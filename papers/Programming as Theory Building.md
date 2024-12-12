# Programming as Theory Building

## Intro

El paper trata de entender que es la programación, descartando que sea la producción de un texto y que debe formar una especie de teoría.
Para poder afrontar los desafíos de la disciplina debemos entender que es programar. Va a presentar la "Theory Building View".

## Programming and the Programmers’ Knowledge

Los programas deben corresponderse a algún aspecto del mundo real y cambiar acorde a este. La programación debe verse como un proceso de construcción de conocimiento, donde los programadores son la principal fuente de ese conocimiento y cualquier documentación una herramienta secundaria. Para elaborar da unos ejemplos:

### Compilador

Un equipo A desarrolló un compilador y un equipo B se interesó en extenderlo, a lo que pidieron asesoramiento del equipo A. Les presentaron todas las propuestas que implementaron usando la documentación del compilador. El equipo original revisó los cambios y explicaron que en vez de estar agregando funcionalidades al sistema estaban haciendo parches que destruían su simplicidad. El equipo A implementó esos casos fácilmente usando la estructura original, demostrando así que la documentación no es tan efectiva como el conocimiento de los programadores.  
Años después otro equipo que tomó las riendas de B siguió desarrollando el compilador sin el consejo de A, y esta vez efectivamente implementaron modificaciones que no respetaban la estructura original empeorandoló. Probando una vez más que el código y documentación es insuficiente para transmitir las ideas de diseño.

### Sistema complejo

Una compañia ofrece un sistema de monitoreo. Es un programa de 200.000 líneas que tiene programadores encargados de instalarlo y trackear fallos. Estos programadores trabajaron full-time por años en este programa desde su concepción. A la hora de arreglar fallas dependen únicamente de lo que saben del sistema para arreglarlo, ninguna documentación les es de ayuda. Otros programadores externos que reciben la documentación del sistema regularmente tienen problemas para entenderla y resolver errores, que cuando se los presentan al equipo original, ellos explican con facilidad. La conclusión es que para programas extensos que necesitan mantenimiento es necesario un equipo que este fuertemente interiorizado.

## Ryle’s Notion of Theory

Si programar involucra esencialmente construir el conocimiento de un desarrollador hay que definir que es ese conocimiento, se lo va a considerar una teoría (con la noción de Ryle).  
Quien posee una teoría sabe hacer algo respaldandose con justificaciónes y explicaciones al respecto.  
Ryle desarrolla la noción de teoría expandiendo sobre la intelectualidad. Hace una diferenciación entre actividad intelectual y actividades meramente inteligentes.

La _actividad inteligente_ no está solo en el conocimiento puntual, sino en complementar con saber hacer cosas (como podría ser contar y apreciar chistes). La inteligencia tiene que ver con hacer las cosas **bien** respecto a algún criterio, como aprender de ejemplos y del resto. Notar que ser inteligente no tiene que ver con saber seguir reglas/métodos.  
La _actividad intelectual_ en cambio tiene que ver con construir una teoría con la cual poder explicar y discutir sobre las cosas inteligentes que se llevan a cabo.  
Tener una teoría va más allá de entender lo superficial o incluso lo central de algo, se debe comprender como ese conocimiento se traslada a la realidad y poder relacionarlo con distintos aspectos. Da el ejemplo de la teoría de Newton: no basta con saber las idea principales como F=m.a, sino a poder entender como las ideas se trasladan al movimiento de los planetas o péndulos y poder expresarlo matemáticamente.

## The Theory To Be Built by the Programmer

La teoría que construyan los programadores debe reflejar como los elementos del mundo se van a soportar en un programa.
El conocimiento de un programador por tener esencialmente la _teoría_ supera al de la documentación en tres aréas:

- El programador puede explicar como se mappea cada parte del programa con la realidad que modela. Tiene que decidir que aspectos del mundo real son relevantes y cuales no para el programa.

- El programador que posee la teoría del programa puede explicar porque cada parte del programa es como es con alguna justificación (basándose en su conocimiento intuitivo).

- El programador con su teoría es capaz de llevar a cabo cualquier modificación y preservar el mappeo con el mundo real. Para modificarlo se necesita entender como el cambio se relaciona y asemeja con el sistema ya existente. Estas similitudes solo son visibles para el programador.

## Problems and Costs of Program Modifications

Para este análisis, no se puede comparar los programas con otras construcciones. Por ejemplo, en el caso de los edificios, muchas veces resulta más barato demolerlos y empezar de nuevo que hacer grandes modificaciones. Además, aclara que modificar un programa no se puede reducir simplemente a la manipulación de texto, por lo que no es razonable asumir que las modificaciones serán siempre económicas.

Luego se aborda la flexibilidad. Un programa flexible incluye características que no son necesarias de inmediato, pero que pueden ser útiles para manejar ciertos cambios sin requerir modificaciones. Diseñar flexibilidad puede ser razonable si es relativamente sencillo, pero suele ser muy costoso. Cada elemento flexible debe ser diseñado, implementado, testeado y documentado para funcionalidades cuya utilidad depende de eventos futuros (lo que lo encarece). Por lo tanto, la flexibilidad temprana no es una solución general.

Para realizar una modificaión hay que confrontar la solución actual y determinar como se relaciona con el cambio a desarrollar. Acá brilla Theory Building: el candidato ideal para reconocer las símilitudes es quien posea la teoría. Él tiene la intuición y entendimiento del programa, algo que no se puede reducir a reglas formales.  
Aclaración: no modificamos la teoría, sino el programa mismo.

Si no ideamos las modificaciones de un programa a través de una teoría, muchas formas de modificarlo parecerían correctas. Si las vemos en relación a la teoría hay dos tipos: las que respetan o extienden la teoría y las que son inconsistentes actuando como parches.  
Para mantener la calidad, simplicidad y buena estructura de un programa es necesario que cada modificación se base en la teoría.

## Program Life, Death, and Revival

La teoría de un programa no es algo que se pueda expresar, sino que está intrínsecamente ligada a los seres humanos. Es importante que quienes posean la teoría de un programa estén a cargo del mismo. Consturir un programa es lo mismo que la contstrucción de su teoría.

Separa en tres nociones del programa:

- Vida: En este proceso un equipo que tiene la teoría del programa están en control de sus modificaciones.

- Muerte: Sucede cuando se disuelve al equipo poseedor de la teoría. El programa sigue corriendo y produciendo resultados. Se hace visible la muerte cuando se requiere hacer modificaciones que no se realizan de manera inteligente.

- Revival: Cuando un nuevo equipo reconstruye la teoría.

Para que la vida de un programa se extienda es importante que nuevos programadores se unan a equipos y aprendan la teoría. Para esto ninguna documentación es suficiente, es fundamental que los nuevos programadores trabajen con quienes tienen la teoría para familiarizarse con todas sus matices.

Revivir un programa exclusivamente con documentación es imposible. Intentar revivir un programa solo debe hacerse en situaciones excepcionales, teniendo en cuenta que puede ser costoso y posiblemente reviva una teoría algo distinta a la original.  
En contraposición a revivir un programa sería mejor descartarlo y darle la oportunidad a un nuevo equipo de construir su propia teoría. Posiblemente hacer esto implique un programa mas viable a un menor costo. Es difícil desarrollar una teoría que encaje con código existente.
Los problemas también pueden surgir si un programa se mantiene activo demasiado tiempo, especialmente debido a la rotación del equipo de programación.

## Method and Theory Building

Define método de programación como un conjunto de reglas para los programadores, incluyendo que hacer y en que orden, que notaciones o lenguajes usar y que documentos producir. Implicando que se puede definir una _secuencia_ de acciones.  
Pensando en Theory Building esto no tiene sentido, las acciones no tienen un orden o una división en particular. La persona que tiene el conocimiento debe ser capaz de producir lo necesario en base a cualquier demanda.  
Las notaciones resultan secundarias, el componente principal es la teoría y esta no se puede expresar.  
Entonces según la "Theory Building" no puede haber un método correcto a la hora de programar.
Esto puede resultar raro por dos cosas:

- **El desarrollo de software debe seguir un método porque debe basarse en la ciencia**:
  El problema con esta idea es que no hay tal cosa como el "método científico", ya que no es un método como tal. No es una receta fija para hacer ciencia, no sigue rígidamente pasos, más bien es una serie de sugerencias para estimular la actividad de resolver problemas.

- **Estudios muestran la eficacia de los métodos**:
  El autor dice que no hay suficientes estudios que realmente prueben esto. Cuenta que un estudio concluyó que seguir métodos mecánicamente a ciegas no da buenos resultados.
  Los métodos para de educar programadores si son compatibles con la _Theory Building_. La calidad de lo que construyan depende en gran parte de soluciones a modelos típicos, técnicas de verificación y algunos principios.  
  Si bien muchas de las problemáticas que atacan los métodos de programación también son relevantes para _Theory building_, la gran diferencia es que lo métodos fuerzan que técnicas usar y en que orden cuando esto debe ser una decisión del programador dependiendo del problema.

## Programmers’ Status and the Theory Building View

La _Theory Building_ da una visión distinta respecto a la contribución de los programadores.
Generalmente se asume a la programción como producción industrial donde el programador actúa como mano de obra. Puede ser fácilmente reemplazado y funcionaría mejor si trabajara como una máquina, siguiendo reglas rígidas.  
La _Theory Building_ propone que el programador es de alto valor y que tiene una gran responsabilidad. Es valioso y dificilmente reemplazable, así como un ingeniero o abagado, contribuyendo desde su competencia intelectual.
La educación de los programadores debe seguir incluyendo el dominio de representaciones, procesos y lenguajes, pero lo principal debe centrarse en fomentar la capacidad de formar teorías.

## Conclusions

El objetivo principal de la programación es que los programadores construyan una teoría sobre cómo el programa respalda los problemas en cuestión.

La vida de un programa depende del soporte continuo de los programadores que poseen su teoría. Además, la noción de un "método de programación" basado en reglas fijas se rechaza. Es necesario otorgar a los programadores el rol de desarrolladores responsables y permanentes, con una educación centrada en la construcción de teorías y el conocimiento de procesamiento de datos y notaciones.
