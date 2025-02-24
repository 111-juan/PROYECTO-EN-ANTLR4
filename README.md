# Calculadora con ANTLR y Java

Este proyecto es una calculadora basada en ANTLR4 y Java que permite evaluar expresiones matemáticas con soporte para variables y operaciones básicas.

## 📂 Estructura del Proyecto
```
📂 Proyecto_lenguajes/
│── 📄 Expresiones.g4       # Archivo de gramática de ANTLR
│── 📄 ExpresionesLexer.java # Lexer generado por ANTLR
│── 📄 ExpresionesParser.java # Parser generado por ANTLR
│── 📄 ExpresionesBaseVisitor.java # Clase base del Visitor
│── 📄 ExpresionesVisitor.java # Interfaz del Visitor
│── 📄 EvalVisitor.java    # Implementación de la lógica de evaluación
│── 📄 Calc.java           # Programa principal
│── 📄 input.txt           # Archivo opcional con expresiones
```

## 🔧 Instalación y Configuración

### 1️⃣ Instalar ANTLR4
Si no tienes ANTLR4 instalado, descárgalo y configúralo:
```bash
# Descargar ANTLR4
curl -O https://www.antlr.org/download/antlr-4.13.1-complete.jar

# Configurar ANTLR en el classpath
export CLASSPATH=".:$(pwd)/antlr-4.13.1-complete.jar:$CLASSPATH"
alias antlr4='java -jar $(pwd)/antlr-4.13.1-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'
```

### 2️⃣ Generar Archivos Java desde la Gramática
```bash
antlr4 -visitor -no-listener Expresiones.g4
```
Esto generará los archivos necesarios para el lexer y el parser.

### 3️⃣ Compilar los Archivos Java
```bash
javac *.java
```

### 4️⃣ Ejecutar la Calculadora en Modo Interactivo
```bash
java Calc
```
Puedes ingresar expresiones como:
```
3 + 4
(5 + 3) * 2
x = 10
x * 3
```
Salida esperada:
```
7
16
30
```

### 5️⃣ Ejecutar con un Archivo de Entrada
Si tienes un archivo `input.txt` con:
```
a = 5
b = a * 2
b + 3
```
Ejecuta:
```bash
java Calc input.txt
```
Salida esperada:
```
10
13
```

## 🛠 Funcionamiento del Código
### 📌 **Expresiones.g4 (Gramática de ANTLR)**
Define la estructura de las expresiones matemáticas permitidas.

### 📌 **EvalVisitor.java (Evaluador de Expresiones)**
Implementa la lógica de evaluación utilizando el patrón Visitor.

### 📌 **Calc.java (Programa Principal)**
1. Lee la entrada (desde teclado o archivo).
2. Genera tokens con el lexer (`ExpresionesLexer`).
3. Construye el árbol de sintaxis con el parser (`ExpresionesParser`).
4. Evalúa las expresiones con `EvalVisitor`.

## 📜 Licencia
Este proyecto es de código abierto bajo la licencia MIT.

---

🚀 **¡Disfruta programando con ANTLR y Java!** 😃

