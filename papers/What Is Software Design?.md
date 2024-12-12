## Intro

En este ensayo el autor desarrolla en como programar es fundamentalmente un trabajo de diseño y que la única representeación de este diseño es el código fuente en si mismo.

# What Is Software Design?

Distintas técnicas de POO parecen haber tomado al desarrollo. Esta explosión restulta un poco inusual. C++ es un factor muy importante en esta revolución. Se volvió tan popular porque facilitó diseñar software y programarlo al mismo tiempo.  
El crecimiento de C++ nos da una lección para ser mejores ingenieros de software: programar no se trata de construir software sino de diseñarlo.  
En un seminario se discutió si el desarrollo de software era una ingenieria o no, allí el autor concluyó dos cosas:

- se hacen paralelismos erróneos con la ingeniería de hardware y el software
- no somos ingenieros de software porque no entendemos su diseño.

La meta de la ingenieria es desarrollar una documentación para que el equipo de manufacturación (que tiene skillset distinto al equipo de diseño) pueda construir un producto en masa sin más participación de los diseñadores. Con este criterio de ingenieria, la única pieza que puede considerarse como documentación es el código. El resto del paper asume que el código es el diseño del software.
Consecuencias de pensar al código como el diseño del software:

- La construcción del software es barata, casi gratis. Solo se necesita una computadora y un editor. El compilador se encarga de construirlo rápidamente. Lo caro es el diseño.
- Crear el diseño (en el sentido mecánico de escribir) es relativamente fácil. En unos días y con unas pocas líneas de código se puede tener un módulo muy complejo (aunque debuggearlo completamente es otra historia).

Los diseños al ser "fáciles" y prácticament gratis de construir, tienden a volverse grandes y complejos. No interesa el software simple, los productos pueden llegar a tener millones de líneas de código.  
Diseñar software es un ejercicio de manejo de complejidad. Puede usar muchas tecnologías, las especificaiones pueden variar de un momento para otro y los equipos pueden llegar a modificarse en el medio del proceso de diseño. Por esto el software se parece más a sistemas orgánicos o sociales que al hardware, lo que lo vuelve difícil y suceptible a errores y a ser menos disciplinado que otras ingenierias.

La mayoría de la ingenierias cuando terminan un diseño, antes de condstruirlo, están seguros que va a funcionar y que se puede contstruir porque fue muy testeado y validado (pensar en puentes y aviones). Básicamente hacen todo lo posible para que antes de construir algo, sepan que funciona. En el software no se pasa por un proceso tan riguroso. Igual validamos nuestro diseño mediante tests y debugging solo que la mayoría de gente no considera a este proceso verdadera "ingenieria".  
Lo más simple y barato es construir el diseño y testearlo, no tiene ningún sentido hacer modelos o prototipos. Podemos refinar el diseño construyendolo infinitas veces. Este proceso es suceptible a errores y no particularmente riguroso.

Critíca que en el desarrollo se trate de separar en partes: primero el diseño que hasta que no este terminado no se escribe código, después el código y por último testing para limar impurezas. El software es distinto al resto de disciplinas, si un obrero hiciera algo que luego se tuviera que rehacer por completo, seguramente lo despedirían. En software cuando testeamos, muchas veces se reescriben módulos. A diferencia de en una etapa de construcción, a la hora del proceso creativo de diseñar esto es válido. Nadie espera que un ingeniero presente un diseño perfecto a la primera.  
Lo denso de diseñar software es que todo es parte del diseño: codear, testear y lo que generalmeente llaman "diseñar". Si bien es barato de construir, diseñarlo es carísimo. Todos los aspectos están relacionados: que algoritmo elegir, como testear un módulo,etc. Todo puede ser igual de importante que una desición de diseño de alto nivel.  
El diseño debe ser correcto en todos sus aspectos, no hay jerarquía de importancia. Un diseño no está terminado hasta que se haya programado y testeado. Testearlo es un proceso fundamental para refinar y validar el diseño. Refinar todos los aspectos del diseño debe suceder durante el ciclo del mismo. El software depende de muchas cosas que pueden generar problemas, como hardware o librerías, estos problemas son descubiertos a la hora de testear y nos fuerzan a cambiar el diseño. El autor introduce la idea de hacking: cuando una parte del diseño no puede cambiar y hay que cambiar otras de forma no ideal (esto es normal).  
El autor ejemplifica contando que en un proyecto tuvo un problema entre dos módulos. Uno de estos no era accesible y no permitía la integración con el otro. Ya era tarde para cambiar la abstracción del inaccesible y se tuvieron que llevar a cabo varios pequeños arreglos que hicieron al sistema bastante mas propenso a bugs.  
Esta es una situación normal en casi todos los proyectos. Para superar estos problemas se requiere un proceso controlado de refinamientos, eso es la ingenieria.

Aclara que termina siendo más preciso escribir la documentación del diseño después de hacer el código en lugar de antes, porque así se refleja el diseño después de ser refinado.  
Es muy importante tener un buen diseño en todos los niveles y para hacerlo no hay que tener miedo de programarlo y después refinarlo, en última instancia el diseño va a tener que ser código. El diseño de alto nivel no va a mapear perfectamente con el programa por lo que ese paso introduce errores que luego hay que cambiar en el diseño de alto nivel. Por esto es que es útil que los mismos diseñadores sean quienes escriben el código en lugar de pensarlo como una traducción.  
Acá es donde entra en juego C++, que unifica la notación de diseño. Nos permite expresar componentes de más alto nivel lo que hace más fácil producir un diseño robusto y refinarlo.  
El autor expresa que las herramientas como diagramas de objetos si bien pueden ser útiles, no son diseño de software. Lo importante son las técnicas de programación. Cada vez se usan más técnicas que aceleran el inicio de la etapa de programar, como el prototipamiento rápido que permiten testear y refinar el diseño más temprano.  
Para que el desarrollo de software se parezca más a una ingenieria es necesario mejorar el ciclo de programación y testeo para que sea algo más riguroso (aunque sea muy difícil porque se puede construir literalmente lo que sea).

## Puntos clave según el autor

- Real software runs on computers. It is a sequence of ones and zeros that is stored on
  some magnetic media. It is not a program listing in C++ (or any other programming
  language).
- A program listing is a document that represents a software design. Compilers and
  linkers actually build software designs.
- Real software is incredibly cheap to build, and getting cheaper all the time as
  computers get faster.
- Real software is incredibly expensive to design. This is true because software is
  incredibly complex and because practically all the steps of a software project are
  part of the design process.
- Programming is a design activity—a good software design process recognizes this
  and does not hesitate to code when coding makes sense.
- Coding actually makes sense more often than believed. Often the process of
  rendering the design in code will reveal oversights and the need for additional
  design effort. The earlier this occurs, the better the design will be.

- Since software is so cheap to build, formal engineering validation methods are not
  of much use in real world software development. It is easier and cheaper to just
  build the design and test it than to try to prove it.

- Testing and debugging are design activities—they are the software equivalent of the
  design validation and refinement processes of other engineering disciplines. A good
  software design process recognizes this and does not try to short change the steps.
- There are other design activities—call them top level design, module design,
  structural design, architectural design, or whatever. A good software design process
  recognizes this and deliberately includes the steps.
- All design activities interact. A good software design process recognizes this and
  allows the design to change, sometimes radically, as various design steps reveal the
  need.
- Many different software design notations are potentially useful—as auxiliary
  documentation and as tools to help facilitate the design process. They are not a
  software design.
- Software development is still more a craft than an engineering discipline. This is
  primarily because of a lack of rigor in the critical processes of validating and
  improving a design.
- Ultimately, real advances in software development depend upon advances in
  programming techniques, which in turn mean advances in programming languages.
  C++ is such an advance. It has exploded in popularity because it is a mainstream
  programming language that directly supports better software design.
- C++ is a step in the right direction, but still more advances are needed.
