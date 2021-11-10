### Aplicación para gestionar examenes médicos.

> Si desea intalarlo en un ambiente local, deberá tener en consideración la información de [server](./server), no obstante al configurar el servicio, solo deberá de ejecutar index.html que está en la raíz desde cualquier navegador, en caso de que tenga un servidor apache con acceder a la carpeta del proyecto se lanzará automaticamente el [index.html](./index.html).

La aplicación cuenta con tres roles:

- Administrador: desde acá tiene la posibilidad de agregar a nuevos trabajadores con sus respectivos roles por debajo del administrador.

- Atencion al cliente: acceso al crud de la tabla clientes, es decir, los datos personales de este, tambien puede solicitar un examen para n pacientes y visualizar en pdf el reporte de este.

- Enfermero: Tiene la responsabilidad de enviar el reporte en caso de que ya el examen esté corregido y desde luego, puede ingresar las observaciones del examen, así como tambien ver el reporte en pdf.


#### Cuentas de prueba:

|usuario | clave | rol  |
| ---    | ---   | ---  |
|admin   | admin | administrador|
|atencion|1234 | atención al cliente|
|enfermero|1234|enfermero| 

> Con las cuentas anteriores podrá loguearse y empezará a probar los funciones del sistema.
