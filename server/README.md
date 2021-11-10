### Servicio para Cliente: Laboratorio clínico.

> Para instalar deberá :
> ```shell
> $git clone https://github.com/KlissmanGranados/Examenes-de-laboratorio
> ```
> Podrá ejecutar la api en local, si desea modificar el acceso a la base de datos,
> debe de configurar los parametros de la clase: [Connection.php](./app/connection/Connection.php),
> si desea probar con la misma estructura de datos presente instalé el : [db.sql](../analisis/dbMD.sql).
> En caso de estar sobre una base de datos postgresql importe: [dbPostgre.sql](../analisis/dbPostgre.sql).

> Nota: Todas las rutas apuntan al directorio public/ : [index.php](./public/index.php)

#### Middelwares

En el directorio : [app/http/middleware](app/http/middleware), encontrará clases para proteger las rutas por roles o
estado de sessión:

- [app/http/middleware/roles/Administrador.php](app/http/middleware/Administrador.php) : Por ejemplo:

```php
<?php

class Administrador implements IMiddleware
{

    public function handle($request, Closure $next)
    {
        // TODO: Implement handle() method.

        if(Auth::user()->roles_id == 1)
            return $next($request);
    }
}
```

#### Implementando middelware

```php
    Route::middleware('AdministradorRoutes')->group(function () {
        Route::get('/',function(){
            echo 'Hello world';
        });
    });
```

#### Routing

| metodo | ruta | parametros |descripción | Rol | 
| -- | -- | -- | -- | -- |
|get | /users | |listar usuarios | Administrador| 
|get | /roles | |listar roles | Administrador| 
|post | /updateUserRole| id, roles_id | cambiar rol de usuario | Administrador| 
|post|/newAcc|name,pass,roles_id|insertar usuario| Administrador | 
|delete|/deleteUser/:id| id | Eliminar usuario| Administrador| 
|get|/clientes| | Listar clientes | Atencion al cliente| 
|post|newClient|cedula,nombre,apellido,correo | insertar nuevo cliente | Atencion al cliente|
|post|/client-update|id,cedula,nombre,apellido,correo| actualizar cliente | Atencion al cliente| 
|post | /submitExam | nombre,descripcion,clientes_id| insertar examen |Atencion al cliente| 
|get|/examenes| | listar examenes | Atencion al cliente o enfermo| 
|get | /examenes/:estado | estado (booleano) | listar examenes segun estado | Atencion al cliente y enfermo| 
|get | /examenes/:idClient | idClient | listar examenes por cliente | Atencion al cliente y enfermo| 
|post |/sendMail/:idClient/:idExam| idClient,idExam | Enviar correo con examen| Atencion al cliente y enfermo|
|post|/examenInsertResults| id,resultado| Insertar respuesta de examen|Enfermero| 
|get|/reportView/:idClient/:idExam|idClient,idExam| vista del reporte| Publico | 
|get | /reportPdf/:idClient/:idExam| idClient,idExam | descargar reporte en pdf | Publico | 
|post | /login| name,pass | iniciar sessión | Publico | 
|post | /logout/:token| token | terminar sessión | Publico |

>nota: explicitamente esos son los parametros de las rutas, pero hay que pasarle por parametros el token de sessión en caso de que las funciones esten dentro
> de un rol. Por ejemplo: /roles?token=19231903089013asdasd , de esta forma el middelware identificará que esté autenticado y le dará acceso a ciertas rutas según 
> sea su rol.



> Ejemplo de solicitud: [https://laboratorio-urbe.herokuapp.com/users](https://laboratorio-urbe.herokuapp.com/users)

```javascript
{
    "code"
:
    1,
        "message"
:
    "Se ha realizado la operación exitosamente",
        "data"
:
    [
        {
            "id": 2,
            "name": "atencion",
            "pass": "fa5bca988e5669075d2916cd24f796f2",
            "access_token": null,
            "roles_id": 2
        },
        {
            "id": 3,
            "name": "enfermero",
            "pass": "6c0f887d9e9abdc28d034f50ea7fe058",
            "access_token": null,
            "roles_id": 3
        }
    ]
}
``` 

> nota : La ruta pasada estará en un middelware, por ende necesita ser llamada desde el administrador. 



