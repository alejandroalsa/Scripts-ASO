# Explicación de los Scripts 01, 02, 03, 04, 05 & 06.

*   **[Script 01](#script-01)**
    *   **[Explicación 01](#explicación-01)**
    *   **[Explicación 02](#explicación-02)**
    *   **[Explicación 03](#explicación-03)**
    *   **[Explicación 04](#explicación-04)**

*   **[Script 02](#script-02)**
    *   **[Explicación 05](#explicación-05)**
    *   **[Explicación 06](#explicación-06)**
    *   **[Explicación 07](#explicación-07)**
    *   **[Explicación 08](#explicación-08)**
    *   **[Explicación 09](#explicación-09)**

*   **[Script 3](#script-03)**
    *   **[Explicación 10](#explicación-10)**
    *   **[Explicación 11](#explicación-11)**
    *   **[Explicación 12](#explicación-12)**
    *   **[Explicación 13](#explicación-13)**
    *   **[Explicación 14](#explicación-14)**

*   **[Script 04](#script-04)**
    *   **[Explicación 15](#explicación-15)**
    *   **[Explicación 16](#explicación-16)**
    *   **[Explicación 17](#explicación-17)**
    *   **[Explicación 18](#explicación-18)**

*   **[Script 05](#script-05)**
    *   **[Explicación 19](#explicación-19)**
    *   **[Explicación 20](#explicación-20)**
    *   **[Explicación 21](#explicación-21)**

*   **[Script 06](#script-06)**
    *   **[Explicación 22](#explicación-22)**
    *   **[Explicación 23](#explicación-23)**
    *   **[Explicación 24](#explicación-24)**




# Script 01

### Explicación 01

El script utiliza un bucle que continúa ejecutándose hasta que el valor de la variable `OPC` sea igual a `10`. El script comienza limpiando la terminal, luego muestra las opciones del menú, numeradas del `1` al `10`. El usuario se le pide que ingrese una selección escribiendo un número entre `1` y `10` y presionando enter. Dependiendo del valor ingresado por el usuario, el script ejecutará un conjunto diferente de comandos. Por ejemplo, si el usuario ingresa `1`, el script creará un nuevo usuario, si el usuario ingresa `2`, el script habilitará un usuario existente, y así sucesivamente. La última opción, `10`, es para salir del script.

### Explicación 02

Este es un script de shell que continúa con las opciones del menú de la explicación anterior. El script utiliza la sentencia `case` para manejar diferentes opciones seleccionadas por el usuario.

Cada opción del menú tiene un bloque de código asociado con ella, que se ejecuta dependiendo del valor de la variable `OPC` ingresado por el usuario. Por ejemplo, si el usuario ingresa `1`, el script ejecutará el bloque de código asociado con la opción `Crear usuario`, que pide el nombre y la contraseña del nuevo usuario, luego verifica si los datos son correctos y si lo son, se crea el usuario con el comando `useradd`.

**Opción 2**) Habilitar usuario: pide el nombre del usuario a habilitar y habilita ese usuario usando el comando `usermod -U`.

**Opción 3**) Deshabilitar usuario: es similar, pero deshabilita al usuario usando el comando `usermod -L`.

**Opción 4**) Eliminar usuario: pide el nombre del usuario a eliminar y elimina ese usuario usando el comando `userdel -r`.

**Opción 5**) Cambiar permisos a un usuario: se asegura de que se ha ingresado una ruta de directorio o archivo como argumento y luego pide los permisos del propietario, grupo y otros, luego verifica si son válidos y si lo son, cambia los permisos del archivo o directorio usando el comando "chmod" y muestra los permisos actuales usando `ls -la`

**Opción 6**) Copia de seguridad del directorio de trabajo de un usuario determinado: pide el nombre del usuario para realizar la copia de seguridad y crea un archivo zip con la copia de seguridad del directorio de trabajo del usuario especificado y lo almacena en `/tmp/` con el comando `zip -r`.

**Opción 7**) Usuarios conectados actualmente: ejecuta el comando `who` para mostrar todos los usuarios conectados actualmente al sistema.

**Opción 8**) Espacio libre en disco: ejecuta el comando `df -h` para mostrar el espacio libre en disco en un formato legible para humanos.

**Opción 9**) Trazar ruta: pide al usuario que ingrese una IP o un nombre de dominio, luego ejecuta el comando "traceroute" para mostrar la ruta de red desde la computadora del usuario hasta el destino especificado.

**Opción 10**) Salir: ejecuta el comando `exit` para salir del script.

### Explicación 03

La primera línea es una condicional `if` que verifica si la variable `SELECCION` es igual a `s`. Esto se refiere a la pregunta anterior donde se le preguntó al usuario si los datos ingresados son correctos. Si la respuesta es `s` (Sí), entonces se ejecutan las siguientes líneas de código. 

Luego, se imprime un mensaje en la pantalla `Creando Usuario.....` y se ejecuta el comando `useradd` para crear un nuevo usuario con el nombre especificado en la variable `NAME_USER`, la contraseña especificada en la variable `PASS_USER` y el directorio home especificado en `/home/$NAME_USER`.

Finalmente, se imprime un mensaje en la pantalla `Usuario Creado` indicando que el usuario ha sido creado exitosamente.

### Explicación 04

Explicación de las validación de permisos, el usuario introduce el permiso de propietario en la variable `OWNER` el permiso de grupo en la variable `GROUP` el permiso de otros en la variable `OTHER`. Después declaramos tres variables más para validar que el usuario a introducido los valores correctos, para eso utilizamos una comparación booleana, es decir `verdadero` o `falso`, en este caso si es `mayor que 1` y `menor que 9` asigna `1` y si no `0`, eso lo hacemos con un operador ternario `? 1 : 0`. Después con un simple `if` decimos que el valor de `GROUP_OK, OWNER_OK, OTHER_OK` tiene que ser `igual a 1` para ejecutar la instrucción.

# Script 01

### Explicación 05

Una simple comprobación de argumentos

### Explicación 06

Comprobación de archivos donde le pasamos los dos argumentos y comprueba si existen.

### Explicación 07

Esta parte del código está tomando una línea de un archivo (llamado `linea`) y utilizando comandos de Linux como `cut` y `tr` para manipular y extraer información de esa línea. Luego, está combinando esa información extraída para crear una nueva cadena de texto (llamada `en_row`). También está creando una variable `people` que combina el nombre y el apellido de la persona de la línea original. Además, está creando una variable `ex_intro` que combina `people`, un punto y coma, y `en_row`. Finalmente, está buscando en otro archivo (llamado `$2`) si hay una coincidencia con la variable `ex_intro` usando el comando `grep`.

### Explotación 08

Al extraer los datos de las líneas de la variable `comparison` los evaluamos en un `if` donde se le aplica la lógica de que si son iguales dará el error de: `El usuario $en_row ya existe`, si no saltara a la siguiente línea.

### Explicación 09

Ejecutamos otra instrucción de comparación indicándole que si hay una línea con el texto `NOMBRE;APELLIDOS;DNI` lo deje vacío y si no que introduzca los datos en la línea siguiente del archivo introducido como segundo argumento.

# Script 03

### Explicación 10

La línea `if [ $# != 3 ]; then` verifica si el número de argumentos `($#)` es diferente de `3`. Si es así, se ejecutan las siguientes tres líneas.

### Explicación 11

Evalúa una expresión matemática y redirige la salida a `/dev/null`, `expr $1 + 1` evalúa la expresión matemática sumando `1` al primer argumento `($1)` pasado al script. `> /dev/null 2>&1` redirige la salida estándar y la salida de error a `/dev/null`, que es un archivo especial en `Unix/Linux` que descarta todos los datos que se escriben en él. Esto significa que cualquier salida generada por la expresión matemática no será mostrada en la consola.

### Explicación 12

La línea `if (( $? < 2 )); then` verifica el valor de la variable especial `$?`. Esta variable contiene el código de salida del último comando ejecutado. Si el valor es menor que `2`, significa que el comando anterior se ejecutó correctamente y el primer argumento es un número.

### Explicación 13

Verifica si el tercer argumento `($3)` pasado al script es un símbolo de operación `(+, -, *, /)` o no.

El comando `if [ $3 = "+" ] || [ $3 = "-" ] || [ $3 = "*" ] || [ $3 = "/" ]; then` comprueba si el tercer argumento es igual a `+, -, *` o `/`, utilizando cuatro condicionales `OR (||)` para comprobar cada posible valor.

### Explicación 14 

Es un código de escape ANSI que cambia el color de la salida. Puedes encontrar una lista de todas las combinaciones aquí:

* **[Web 01](https://misc.flogisoft.com/bash/tip_colors_and_formatting)**
* **[Web 02](https://www.shellhacks.com/bash-colors/)**

# Script 04

### Explicación 15

La línea `if [ $# != 1 ]; then` verifica si el número de argumentos `($#)` es diferente de `1`. Si es así, se ejecutan las siguientes tres líneas.

### Explicación 16

La linea `if [[ ! $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then`, verifica si el primer argumento `$1` es una dirección IP válida en formato xxx.xxx.xxx.xxx.

La expresión regular en el código `^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$` coincide con una dirección IP en formato `xxx.xxx.xxx.xxx` donde cada `xxx` es un número entre `0` y `255`.

El código compara si `$1` coincide con esta expresión regular. Si no coincide, entonces se ejecutará el código dentro del bloque `then`.

### Explicación 17

Es el mismo código que en la anterior instrucción, pero en este caso verifica si es una dirección de red, esto lo conseguimos modificando el último parámetro de configuración de [0-9]{1,3} a [0]{1,3}.

### Explicación 18

Realiza un escaneo de la red especificada en `$1`. Por cada host en el rango de `1` a `254`, se hace un ping a la dirección IP formada por el prefijo de red `network=$1` y el número de host actual (en cada iteración del bucle for). El comando ping se ejecuta con opción `-c 1` para enviar solo un paquete, y con opción `-W 0.09` para esperar solo `0.09` segundos en la respuesta.

La salida de la ejecución del comando ping se redirige al archivo nulo `/dev/null` para descartarla. El resultado de la ejecución del comando se almacena en el código de retorno `$?` y se evalúa con una estructura `if`. Si el código de retorno es `0` (el comando ha sido ejecutado sin errores), se muestra en pantalla la dirección IP en verde y se añade a un archivo llamado `RED_$1_IPs.txt`. Si el código de retorno no es `0`, se muestra en pantalla la dirección IP en rojo.

# Script 05

### Explicación 19

Una estructura de control de menú en un script de bash. La sentencia `until` se utiliza para repetir un bloque de código hasta que la condición se cumpla. En este caso, la condición es `[ $OPC = "5" ]`, lo que significa que el script se repetirá hasta que la variable `OPC` sea igual a `5`.

### Explicación 20

Primero, se lee el nombre de usuario del que se desea realizar la copia de seguridad mediante la sentencia `read`.

Luego, se usa el comando id para verificar si el usuario especificado existe en el sistema. La opción `>/dev/null 2>&1` redirige la salida estándar y la salida de error a `/dev/null`, lo que significa que no se mostrará ningún mensaje en la pantalla. Si el usuario existe, el script usa el comando zip para comprimir el directorio `/home/$NAME_USER/` y crear un archivo `ZIP` en la ruta `/tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip`. El `$(date +%Y_%m_%d_%H:%M:%S)` se utiliza para generar una fecha y hora actual en formato año-mes-día-hora:minuto:segundo.

Si el usuario no existe, se muestra un mensaje de error y se pide al usuario que pulse una tecla para volver al menú. Finalmente, el script pide al usuario que pulse una tecla para volver al menú, independientemente de si la copia de seguridad se realizó correctamente o no.

### Explicación 21

Obtener los `20` inicios de sesión más recientes y guardarlos en un archivo. Primero, se borra cualquier archivo previo llamado `ultimos20.log` mediante el comando `rm` `-rf ultimos20.log`.

Luego, se usa el comando last con la opción `-20` para mostrar los `20` últimos inicios de sesión y la redirección `>>` para agregar la salida a un archivo llamado `ultimos20.log`.

# Script 06

### Explicación 22

Verifica el número de argumentos pasados al script. Si el número de argumentos es diferente a `2`, se muestra un mensaje de error en rojo y se termina el script con el comando `exit`.

La expresión `$# != 2` significa que el número de argumentos es diferente a `2`. El operador `!=` significa `diferente a` y el número `2` representa la cantidad de argumentos que se esperan. El simbolo `$#` representa el número total de argumentos.

### Explicación 23

Esta línea de código verifica si el archivo especificado como segundo argumento existe en el directorio especificado como primer argumento. Si no existe, se muestra un mensaje de error en rojo indicando que el archivo no existe en el directorio y se termina el script con el comando `exit`.

La expresión `[ ! -f "$1/$2" ]` significa que se está verificando si el archivo `$2` no existe en el directorio `$1`. La opción `-f` significa `es un archivo regular`, y el signo de exclamación `!` significa `no`. De esta forma, se está verificando que el archivo sea un archivo regular y no un directorio o un enlace simbólico, por ejemplo.

### Explicación 24

verifica si la respuesta del usuario a la pregunta anterior fue `s` (afirmativo). Si es así, se verifica si el archivo `$2` es un directorio con el comando `[ ! -d "$1/$2" ]`. Si no es un directorio (es un archivo regular), se muestra su contenido en la consola con el comando cat `$1/$2`.

Si el archivo es un directorio, se muestra un mensaje de error en rojo indicando que `$2` es un directorio y no un archivo, y se termina el script con el comando exit. La expresión `[ ! -d "$1/$2" ]` significa `no es un directorio`.
