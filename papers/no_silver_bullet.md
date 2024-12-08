# No Silver Bullet

## Abstract

En el _Abstract_ explica que en el software hay tareas esenciales como diseñar las estructuras conceptuales del software y tareas accidentales como representar estas estructuras en lenguajes de programación y todas las dificultades que eso conlleva (por ejemplo manejo de espacio y memoria).

Dice que las tareas accidentales ya se redujeron mucho y la mayoria del esfuerzo hoy en dia se debe dedicar a las tareas esenciales, algunas sugerencias para hacer esto son:

- Explotar el mercado masivo para evitar construir lo que se puede comprar
- Hacer prototipamiento rapido
- Hacer crecer el software organicamente, agregando funcionalidades a medida que los sistemas se usan y testean

## Introduction

Explica un poco que siempre se busco una "bala de plata" que magicamente solucione los problemas de productividad en el desarrollo de software, pero que todavía no hubo ningún avance disruptivo que realmente marque la diferencia.

## Does it have to be hard? - Essential Difficulties

En este capitulo dice que no es posible que el avance en el software sea tan rápido como el del hardware, pero que la anomalía es el rápido desarrollo del hardware.

Después separa las dificultades del software en:

- Esenciales: las inherentes a la naturaleza del software
- Accidentales: las cuales se relacionan a la producción del software

En esta sección desarrolla sobre las esenciales.
Describe la esencia como un entrelazamiento de conceptos, como algoritmos, estructuras de datos etc. Esta esencia es abstracta y su conceptualización es la misma bajo distintas representaciones.

La verdadera dificultad respecto al software dice que es la especificación, diseño y testeo.
Bajo este concepto construir software siempre va a resultar complicado.

Considera las dificultades inherentes:

- Complejidad:
  El software es posiblemente el constructo humano más complejo de todos. Ninguna parte es igual a otra (la abstraeriamos). Además hay que lidiar con una cantidad muy extensa de estados que lo vuelve dificil de testear o describir. También se compone de muchas partes que se relacionan de distintas maneras, introduciendo una complejidad no-lineal a medida que crece.  
  De la gran complejidad que implica el software subyacen problemas tecnicos y de managment.

- Conformidad:
  Parte de la dificultad del software es manejar la complejidad _arbitraria_. Aquello que es
  forzado sin razón aparente por las instituciones y sistemas, cuyas interfaces cambian
  de organización en organización y a medida que pasa el tiempo

- Flexibilidad:
  El software al ser maleable, siempre es forzado a actualizarse. Todo software exitoso cambia porque los usuarios piden nuevas funcionalidades o bien porque necesita un cambio de plataforma al pasar tiempo.

- Invisibilidad:
  No tenemos una forma consistente de visualizar el software por eso decimos que es invisible (a diferencia, por ejemplo, de un plano de construcción). Esto dificulta el proceso
  de diseñar en la cabeza y en general.

## Past Breakthroughs Solved Accidental Difficulties

En esta seccion enumera 3 'breakthroughs' en el desarrollo que fueron útiles para resolver difitultades accidentales.

- Lenguajes de alto nivel:
  Los lenguajes de alto nivel eliminan mucha de la complejidad de bajo nivel que no es inherente al programa en si,
  como manejar registros, representaciones en bits, etc.

- Time-sharing:
  Ayudó a que programar sea mas inmediato, sin la necesidad de llamar a compilacion y ejecucion.
  Mientras más rápido sea el feedback del sistema, menor es la complejidad accidental (hasta un punto, la diferencia entre 50ms y 40ms indetectable. Esta complejidad ya está resuelta).

- Ambientes unificados de programación:
  Con estos entornos se ataca la complejidad de usar de usar distintos programas juntos, integrando librerias, formatos de archivos, etc. (SmallTalk por ejemplo)

## Hopes for The Silver

En este cápitulo el autor describe algunos desarrollos que podrían ser balas de plata y los analiza.

- **Ada y otros lenguajes de alto nivel**: Describe a Ada como un lenguaje que mejora bien en algunos conceptos, pero por sobre todo elogia su filosofía que invoulucra modularizacion, tipos abstractos de datos y estructuras jerarquicas. Concluye que Ada no es una bala de plata, pues es un lenguaje más de alto nivel y la mayoría de ventajas que otorgan los lenguajes de alto nivel ya están asentadas, lo que ya resolvió en gran parte la dificultad accidental de lo abstractos que eran los lenguajes. La mayor contribución que aporta Ada es que entrena a los programadores en tecnicas más modernas de diseño.

- **Programación orientada a objetos**: Separa POO en dos. Primero el concepto de tipos abstractos de datos que definen el tipo de los objetos con un nombre, valores y operaciones teniendo su estructura escondida. Después habla de tipos jerárquicos/clases, que permiten definir interfaces que pueden ser refinadas con subclases. Ambas permiten eliminar la dificultad accidental de tener que agregar código que no aporta nada respecto a la esencia, lo que resulta en mejores expresiones de diseño. POO no elimina la dificultad esencial de hacer un buen diseño cuando programamos.

- **Inteligencia Artificial**: Dice que la mayoría del trabajo es lidiar con problemas especifícos, por lo que siempre se necesita algo de creatividad, abstraccion y saber como transferirlo. Concluye que lo dificil de construir software es decidir que decir, no decirlo. Refiriendose a que una vez que sabemos como se resuelve un problema, no es muy desafiante resolverlo.

- **Sistemas expertos**: Un sistema experto es un programa que recibe un input y que mediante un motor de inferencia y reglas, explora lógicamente para ofrecer conclusiones al usuario. Generalmente usa data probabilistica y lógica determinística. Una ventaja por ejemplo es que al usar bases de reglas de forma uniforme, resulta sencillo cambiar testear y documentar la base de código. Dice que lo más rico de estos sistemas se encuentra en las bases de conocimiento que deben reflejar el mundo real lo mejor posible. Este tipo de sistema sirve para pedir consejos por ejemplo a la hora de testear. En el paper resalta que puede servir como un asistente para pedirle ayuda con básicamente cualquier cosa a la hora de diseñar el sistema y que a medida que lo usamos da mejores resultados. (Todo lo que describe en esta sección como muy útil es muy parecido a lo que hacemos con cualquier LLM). Al final explica que lo esencial para que estos sistemas funcionen es tener un experto que genere una buena base de conocimiento.

- **Programación automática**: Dada una especificación genera un problema que soluciona un problema. Dice que es básicamente programar pero con un nivel aún más alto de abstracción. Enumera algunas excepciones como integrar ecuaciones diferenciales.

- **Programación gráfica**: Programar usando alguna representación gráfica como un cuadro de control de flujo. En el paper ya se explico que es muy difícil graficar software y que los cuadros de control de flujo no sirven para representarlo. Es muy difícil mostrar todas las dimensiones que atraviesan el software usando cualquier representación.

- **Verificación de programa**: El autor dice que las verificaciones son tan laboriosas que solo para ciertos programas valen la pena. Además no asegura que no haya errores. La prueba matemática también puede llegar a fallar, así que si bien existen formas de reducir las fallas, no existe magia. Aún más importante la verificación solo ayuda a ver que un programa cumple su especificación, pero no nos asegura que hayamos encontrado una **especifiacion completa y consistente**,lo que resulta esencial al hacer programas.

- **Ambientes y herramientas**: Estos ya resolvieron dificultades como sistemas de archivos, formatos uniformes, eliminación de errores sintácticos. Todo esto es muy útil pero no ataca ninguna dificultad esencial del software.

- **Estaciones de trabajo**: Aumentar la velocidad de las máquinas donde trabajamos no cambia tanto la productividad del desarrollo (mucho menos hoy que los programas ya compilan rápido), la mayor parte del tiempo se gasta en pensar las soluciones e implementarlas.
