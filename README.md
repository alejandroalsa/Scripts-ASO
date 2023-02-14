# Explicación de los Scripts 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16 & 17.

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

*   **[Script 07](#script-07)**
    *   **[Explicación 25](#explicación-25)**
    *   **[Explicación 26](#explicación-26)**
    *   **[Explicación 27](#explicación-27)**
    *   **[Explicación 28](#explicación-28)**
    *   **[Explicación 29](#explicación-29)**

*   **[Script 08](#script-08)**
    *   **[Explicación 30](#explicación-30)**
    *   **[Explicación 31](#explicación-31)**

*   **[Script 09](#script-09)**
    *   **[Explicación 32](#explicación-32)**
    *   **[Explicación 33](#explicación-33)**
    *   **[Explicación 34](#explicación-34)**

*   **[Script 10](#script-10)**
    *   **[Explicación 35](#explicación-35)**
    *   **[Explicación 36](#explicación-36)**
    *   **[Explicación 37](#explicación-37)**

*   **[Script 11](#script-11)**
    *   **[Explicación 38](#explicación-38)**
    *   **[Explicación 39](#explicación-39)**

*   **[Script 12](#script-12)**
    *   **[Explicación 40](#explicación-40)**
    *   **[Explicación 41](#explicación-41)**
    *   **[Explicación 42](#explicación-42)**
    *   **[Explicación 43](#explicación-43)**

*   **[Script 13](#script-13)**
    *   **[Explicación 44](#explicación-44)**
    *   **[Explicación 45](#explicación-45)**
    *   **[Explicación 46](#explicación-46)**

*   **[Script 14](#script-14)**
    *   **[Explicación 47](#explicación-47)**

*   **[Script 15](#script-15)**
    *   **[Explicación 48](#explicación-48)**
    *   **[Explicación 49](#explicación-49)**
    *   **[Explicación 50](#explicación-50)**

*   **[Script 16](#script-16)**
    *   **[Explicación 51](#explicación-51)**
    *   **[Explicación 52](#explicación-52)**
    *   **[Explicación 53](#explicación-53)**
    *   **[Explicación 54](#explicación-54)**
    *   **[Explicación 55](#explicación-55)**


*   **[Script 17](#script-17)**
    *   **[Explicación 56](#explicación-56)**

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

# Script 07

### Explicación 25

El comando `exec &> >(tee -a /path/to/logfile_backup.log)` se utiliza en el shell de Unix/Linux para redirigir la salida estándar `(stdout)` y la salida de error `(stderr)` a un archivo de registro y, al mismo tiempo, mostrarla en la terminal.

### Explicación 26

`cat /etc/passwd`: Este comando muestra el contenido del archivo de sistema `/etc/passwd`, que es una lista de usuarios en el sistema.

`awk -F: '($3 > 999) {print $1}`: Este comando utiliza awk para procesar el contenido de `/etc/passwd`. awk es un lenguaje de programación que permite manipular texto. La opción `-F`: establece el separador de campo como un dos puntos `(:)`. La expresión `($3 > 999)` dentro de `awk` selecciona solo las líneas en las que el tercer campo (que representa el `ID` de usuario (`UID`) de un usuario) es mayor a `999`. Por último, la acción `{print $1}` imprime el primer campo (que representa el nombre de usuario) de cada línea seleccionada.

`grep -v ^root$`: Este comando utiliza grep para filtrar la salida de awk. La opción `-v` hace que grep muestre solo las líneas que no coinciden con la expresión regular dada (en este caso, `^root$`). La expresión regular `^root$` coincide con una línea que contenga únicamente la cadena `root`.

`while read user; do usermod -L $user; done`: Este es un bucle while que lee la salida filtrada de grep línea por línea. La acción dentro del bucle ejecuta usermod `-L $user` para cada línea, lo que cambia la contraseña de un usuario a `bloqueada` (el modificador `-L` indica que la cuenta está bloqueada).

### Explicación 27

`runlevel=$(runlevel | awk '{print $2}')`: Este comando ejecuta el comando runlevel y utiliza awk para extraer el segundo campo de su salida. Este campo representa el `runlevel` actual del sistema y se asigna a la variable runlevel.

`if [ $runlevel != "1" ]; then init 1; fi`: Este es un bloque `if` que verifica si el valor de la variable runlevel es diferente a `1`. Si es así, ejecuta el comando init `1` para cambiar el `runlevel` a `1`.

### Explicación 28

`fecha=$(date +%Y%m%d_%H%M%S)`: Este comando asigna la fecha y hora actual en formato `YYYYMMDD_HHMMSS` a la variable fecha.

`backup_dir="/backup`: Este comando asigna el valor `/backup` a la variable `backup_dir`, que representa la ruta del directorio de copias de seguridad.

`mkdir -p $backup_dir`: Este comando crea el directorio de copias de seguridad especificado en `backup_dir`, incluyendo cualquier directorio intermedio que no exista (la opción `-p` indica a `mkdir` que cree los directorios intermedios si no existen).

`cat /etc/passwd | awk -F: '($3 > 999) {print $1}' | while read user; do`: Este comando busca en el archivo de sistema `/etc/passwd` y selecciona los nombres de usuario con un UID mayor a 999, similar a lo que se describió en la respuesta anterior.

### Explicación 29

`cat /etc/passwd` muestra el contenido del archivo `/etc/passwd`, que es un archivo de sistema en Unix que contiene información sobre los usuarios del sistema.

`awk -F: '($3 > 999) {print $1}'` utiliza el comando `awk` para procesar el contenido del archivo `/etc/passwd`. La opción `-F:` establece el delimitador de campo como `:`. La expresión regular dentro de las llaves `($3 > 999) {print $1}`indica que se deben imprimir los nombres de usuario `(primer campo $1)` para los cuales el tercer campo `($3)` sea mayor a `999`.

`grep -v "^root$"` utiliza el comando `grep` para filtrar la salida anterior. La opción `-v` invertirá la búsqueda, es decir, se mostrarán todas las líneas que no coincidan con `^root$`.

`while read user` inicia un bucle `while` que lee cada línea de la salida anterior y asigna el valor a la variable `user`.

`usermod -U $user` utiliza el comando `usermod` para desbloquear `(opción "-U")` el usuario especificado en la variable `$user`.

# Script 08

### Explicación 30

El programa usa un bucle `while` que se repite hasta que se ingrese `99` como valor de `x`. Dentro del bucle, se le pide al usuario que infrese el valor de `x` y `y` usando el comando `read`. Luego, se usa un bucle `for` para contar desde `x` hasta `y` e imprimir el valor actual dividido por `y`. La opción `-n` de `echo` se utiliza para imprimir si una nueva linea, lo que permite que los valores se impriman en la misma línea. Finalmente, se usa el comando `echo` para imprimir una nueva línea después de cada secuencia de valores. Si se ingresa `99` como valor de `x`, el programa sele con el comando `exit`.

### Explicación 31

El fragmento de código `for ((i=X; i<=Y; i++)); do` es un bucle `for` en `Bash` que permite iterar una variable `i` desde el valor de `X` hasta el valor de `Y`, incrementando su valor en 1 en cada iteración.

Los componentes del bucle son los siguientes:

*   **((...))** Encierra la expresión aritmética que se evalúa en cada iteración. En este caso, se usa para definir el valor inicial de la variable `i` (que es `X`), la condición de finalización del bucle (que es `i<=Y`), y el incremento que se aplica a la variable `i` en cada iteración (que es `i++`).
*   **do** Marca el inicio del bloque de código que se ejecuta en cada iteración.
*   **...** Contiene el código que se ejecuta en cada iteración del bucle. En este caso, se usa el comando echo para imprimir el valor actual de la variable `i` dividido por `Y`.
*   **done** Marca el final del bloque de código que se ejecuta en cada iteración.

# Script 09

### Explicación 32

La línea `if [ $# -ne 1 ]; then` comprueba el número de argumentos recibidos. Si es distinto de `1`, muestra un mensaje de error y una breve descripción de cómo usar el script.

### Explicación 33

La línea `if [ ! -f "$archivo" ]; then` comprueba si el archivo especificado en `$archivo` existe. Si no existe, muestra un mensaje de error y sale del script.

### Explicación 34

Las líneas siguientes muestran el número de líneas, palabras y caracteres en el archivo, respectivamente. El comando `wc` se utiliza para contar las líneas, palabras y caracteres en el archivo. El operador `<` se utiliza para redirigir la entrada del comando `wc` desde el archivo especificado por `$archivo`.

# Script 10

### Explicación 35

La línea `if [ $# -ne 3 ]; then` comprueba el número de argumentos recibidos. Si es distinto de `3`, muestra un mensaje de error y una breve descripción de cómo usar el script.

### Explicación 36

Las líneas siguientes comprueban que los archivos `$archivo1` y `$archivo2` existen. Si alguno de los archivos no existe, muestra un mensaje de error y sale del script.

### Explicación 37

La línea `diff -u "$archivo1" "$archivo2" > "$archivo_salida"` compara los dos archivos y guarda las diferencias en formato unificado en el archivo especificado en `$archivo_salida`. El operador `>` redirige la salida del comando diff al archivo de salida.


# Script 11

### Explicación 38

La línea `if [ $# -ne 1 ]; then` comprueba el número de argumentos recibidos. Si es distinto de `1`, muestra un mensaje de error y una breve descripción de cómo usar el script.

### Explicación 39

El comando `awk` procesa la salida de `ls` y convierte los espacios en dos puntos como separador de campo. La opción `-v FS=""` especifica que el separador de campo es una cadena vacía, lo que hace que `awk` procese cada carácter como un campo separado. La opción `-v OFS=":"` especifica que el separador de campo de salida es un dos puntos. La expresión `{$1=$1; print}` es una forma de forzar que `awk` procese cada línea y produzca una salida con los nuevos separadores de campo.

# Script 12

### Explicación 40

La línea `if [ $# -ne 1 ]; then` comprueba el número de argumentos recibidos. Si es distinto de `1`, muestra un mensaje de error y una breve descripción de cómo usar el script.

### Explicación 41

El comando `if [ ! -d "$directorio" ]; then` comprueba si el directorio especificado existe. Si no existe, muestra un mensaje de error y sale del script con un código de salida distinto de cero.

### Explicación 42

La función `obtener_archivo()` toma un argumento que es la posición del archivo en el array. La función comprueba si hay un archivo en la posición dada y, si lo hay, muestra su nombre y el número de caracteres que contiene utilizando el comando `wc`.

### Explicación 43

El bucle `while true; do` pide al usuario que seleccione un archivo hasta que introduzca el valor `0`. Dentro del bucle, la línea `read -p "Introduce un número entre 1 y ${#archivos[@]} (0 para salir): "` seleccion muestra un mensaje al usuario y espera una entrada de teclado.

# Script 13

### Explicación 44

Este es el inicio de un bucle `while`. La condición de este bucle es simplemente `true`, lo que significa que se ejecutará indefinidamente hasta que se encuentre una instrucción de break.

### Explicación 45

Esta parte verifica si el carácter leído es la tecla `Intro`. Si es así, la instrucción `break` se ejecuta y el bucle se detiene.

### Explicación 46

Esta es la parte principal del script, donde se determina si el carácter leído es un número o una letra. La construcción `[[ ... ]]` es una forma de evaluación de expresiones condicionales en bash, similar a los paréntesis de los if en otros lenguajes de programación. La expresión `$char =~ [0-9]` evalúa si el carácter en la variable `$char` es un número. La expresión `$char =~ [a-zA-Z]` evalúa si el carácter es una letra (`mayúscula o minúscula`). Si ninguna de las dos expresiones es verdadera, se asume que el carácter es `0` y se informa al usuario de que no es ni un número ni una letra.

# Script 14

### Explicación 47

En este script, se utiliza el comando date para obtener la hora actual del sistema en formato de 24 horas. Luego, se compara esa hora con las horas del día, tarde y noche para determinar qué mensaje mostrar. El operador `-ge` significa `mayor o igual que`, y el operador `-lt` significa `menor que`. Por lo tanto, la primera condición se cumple si la hora actual es mayor o igual que `6` y menor que `12`, lo que significa que es de día. La segunda condición se cumple si la hora actual es mayor o igual que `12` y menor que `20`, lo que significa que es de tarde. Si ninguna de las condiciones anteriores se cumple, entonces es de noche.

# Script 15

### Explicación 48

Se obtiene el nombre de usuario activo en el sistema mediante el comando `whoami`, y se almacena en la variable `nombre_usuario`.

### Explicación 49

Después, se utiliza el comando grep para buscar en el archivo `/etc/passwd` (donde se almacenan los datos de los usuarios del sistema) la línea correspondiente al usuario activo (`^$nombre_usuario:` indica que se busque una línea que empiece con el nombre de usuario seguido de `:`), y se utiliza el comando cut para extraer la sexta columna, que corresponde al directorio de trabajo del usuario. El resultado se almacena en la variable `directorio_trabajo`.

### Explicación 50

Finalmente, se repite el mismo proceso para obtener la `shell` asociada al usuario, y el resultado se almacena en la variable shell.

# Script 16

### Explicación 51

Verificar si se pasó un archivo como argumento

### Explicación 52

Convertir a minúsculas y escribir en un archivo de salida

### Explicación 53

Convertir a mayúsculas y escribir en un archivo de salida

### Explicación 54

Eliminar todas las ocurrencias de "a" y escribir en un archivo de salida

### Explicación 55

Pasar todas las vocales a mayúsculas y escribir en un archivo de salida

# Script 17

### Explicación 56
