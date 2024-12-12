# The early history of Smalltalk

## Intro

Dice que las computadoras de hoy (en los 90) son casi lo que el imaginaba con el Dynabook en los 60: con pantalla plana, OOP y corriendo smalltalk. Smalltalk fue un proyecto de ARPA y después Xerox PARC que perseguía posibilitar el "personal computing".  
Filosóficamente, el diseño de smalltalk tiene que ver con las nociones de la física y la biología, todo lo que definimos se describe a partir de la composición recursiva de bloques con un comportamiento único que se esconde y puede ser usado a través de mensajes.  
Su forma de hacer objetos es platónica, en el sentido de que a partir de idear conceptos (ideas) se pueden crear manifestaciones y el sistema se define sobre si mismo.  
Smalltalk contribuyó para shiftear el paradigma hacia el diseño mediante POO,
atacando los problemas de los desarrolladores profesionales y haciendo simples los problemas de los novatos. Hizo que sea más fácil modelar sistemas dinámicos complejos.  
Si bien él diseñó smalltalk, dice que el sistema pertenece más a Dan Ingalls y Adelle goldberg, los principales responables de hacerlo funcionar. Especialmente a Dan Ingalls que dice que se transformo en además de un gran implementador en un gran diseñador no solo del lenguaje sino de la interfaz gráfica.

## 1960-1966---EARLY OOP AND OTHER FORMATIVE IDEAS OF THE SIXTIES

Las dos motivaciones centrales de OOP fueron: encontrar un sistema de modular sistemas escondiendo sus detalles y una forma más flexible de asignación (?).

### Sketchpad and Simula

En 1966 en la universidad de Utah, le asignaron "Sketchpad: A man-machine graphical communication system". Había 3 ideas principales, la invencion de gráficos modernos e interactivos, hacer "instance drawings" mediante un "master drawing" y el control/dinámica que se manejaba a partir de "constraints" que se le aplicaban al master para dar formas o conectar partes.  
Un tiempo después recibe una implementación de Simula para hacerla funcionar. Notó que era un lenguaje procedural con objetos parecidos a sketchpad con instancias y maestros, pero más flexible.
Le pareció una idea brillante. Entendió que dividir las cosas de esta manera era como dividir la computadora en muchas computadoras pequeñas simulando estructuras útiles, en lugar de usar cosas más débiles como estructuras de datos.  
Casi todas sus ideas las tomo de las raíces de simula.

## 1967-69 THE FLEX MACHINE, A FIRST ATTEMPT ATAN OOP-BASED PERSONAL COMPUTER

En el 67 junto a Ed Cheadle hicieron FLEX, una máquina con la intención de ser programada en un lenguaje de más alto nivel. Les gustaba _JOSS_ que ofrecía un buen diseño para el usuario, pero era muy lento y tenía otros problemas, también barajaron EULER. No usaron SIMULA porque las especificaciones de la máquina no eran suficientemente buenas. El lenguaje _FLEX_ debía estar más influenciado por SIMULA que por ALGOL o EULER.

### Doug Engelbart and NLS

Mientras sucedía esto de _FLEX_, Doug Engelbart visitó Utah. Hablaba de NLS (oNLine Systems), que presentaba cosas como gráficos, múltiples paneles, navegación eficiente, trabajo colaborativo e interactivo y más. Influyó en el concepto de flex, ya que presento la idea de que navegando en las computadoras, era posible aumentar las capacidades intelectuales.  
Con todo esto en mente más la ley de moore, Alan kay entendió que poderosas computadoras iban a estar al alcance de millones de usuarios.  
En la maquina _FLEX_ intentaron incorporar algunas ideas de NLS. Con una impronta parecida a la de Sketchpad hicieron los gráficos. En este proceso se chocaron con varios problemas técnicos.  
Cuenta que muchos de los desarrollos de esa época en _FLEX_, después fueron implementados en smalltalk. Muchas de las ideas de proto-object fueron suficientemente pequeñas para que funcionen en _FLEX_.  
En 1968 dió una charla en Illinois sobre _FLEX_ que fue un éxito, y ahí mismo vio por primera vez una pantalla con display plano, lo que le hizo pensar cuanto faltaría para poder usar su _FLEX_ en esas pantallas.  
Más tarde ese año apareció la tablet _RAND_ con el sistema gráfico _GRAIL_ que ofrecía manipulación directa (sin necesidad de comandos?), que si bien era inestable, le hizo ver que la implementación de _FLEX_ no era buena.
Un mes después visitó a los desarrolladores de LOGO, un lenguaje que usaban con niños en las escuelas para que programen y aprendan. Tras este encuentro Alan kay entendió que las computadoras (el dice _personal computing_) debían ser un medio dinámico para aprender desde la niñez.  
Con lo que aprendió de _FLEX_, _GRAIL_, _LOGO_ y la aparición de los display planos entendió cómo debían ser las computadoras. Tendrían que entrar en una mochila, ser del tamaño de un cuaderno y tener interfaces amigables como _GRAIL_ o _JOSS_ con las capacidades de _SIMULA_ o _FLEX_. Con todo esto en mente ideó la dynabook, anticipando que para cuando llegue tendría un sistema de conexión inalámbrica.  
A principios del siguiente año hubo una conferencia sobre lenguajes extensibles donde Ned Irons presentó el sistema _IMP_, donde cada procedimiento podía definir su sintaxis de manera más natural. Esta idea fue incorporada en la segunda version de _FLEX_, pensando en un interprete extensible en lugar de un compilador dirigido por sintáxis. Esto daba lugar a que la semántica de la programación orientada a objetos pueda extender un lenguaje completo.  
En un campamento de Inteligencia Artificial de Stanford entendió _LISP_, que si bien el creía que tenía fallas en su implementación, como que no era puramente funcional, le pareció una idea increíble (las lambda por ejemplo estaban implementadas como "formas especiales" y no como funciones). No entendió porque lo llamaban funcional si no era puramente funcional, eso lo ayudo a la hora de hacer _Smalltalk_. Entendió que tenía que agarrar lo más difícil/abstracto que necesite hacer, que sea robusto y poder construir con eso de manera sencilla cualquier otra cosa. Para él eso eran los objetos.

## 1970-1972 XEROX PARC: THE KIDDIKOMP, MINICOM, AND SMALLTALK-71

En 1970 Xerox decidió abrir un centro de investigación en Palo Alto, California. Alan empezó a trabajar en una nueva versión del _KiddiKomp_ que podía llevar al diseño de la interfaz de usuario de la notebook.  
Mucha de la gente de Doug Englebart's (el que presentó NLS) también se unió con la intención de re-implementar NLS como un sistema distribuido de redes.  
Cuenta una anécdota en PARC donde Allen Newell (un investigador según Kay más inteligente que el) es retado a resolver el siguiente problema: Dada una lista devolver una lista con todos los elementos de las posiciones pares seguido por todos los de las posiciones impares de la lista original. Allen Newell tardó media hora en resolverlo y dió una solución con bugs que implementó en un lenguaje con manejo de éxplicito de punteros, mientras que Kay lo resolvió en pocos minutos usando Lisp:

```
oddsEvens (x) = append (odds (x), evens (x))
where odds(x) = If null(x) v null(tl(x)) then x
else hd(x) & odds(ttl(x))
evens(x) = if null(x) v null(tl(x)) then nil
else odds(tl(x))
```

Con esto quiere ilustrar que, aún siendo menos inteligente que Newell, al tener una herramienta de pensamiento más poderosa pudo resolver el problema de mucho mejor manera y que cualquier herramienta para niños debe ayudarlos amplificar sus habilidades cognitivas.  
En esa misma época los directivos de Xerox estaban preocupados en como iba a ser el futuro y cuales eran las tendencias, a lo que Alan Kay le dijo, "la mejor forma de predecir el futuro es inventarlo".  
Más adelante creó el Learning Research Group (LRG), su primer grupo. Solo contrató gente que se veía interesada en el concepto de la notebook, si alguien le preguntaba que había que hacer señalaba al modelo de la computadora y decía que lo avancen. Los miembros del grupo se volvieron muy unidos. Dan Ingalls atribuyé parte de los avances al amor y energía de todo el grupo, se pasaban varios días fuera de Xerox PARC haciendo cualquier actividad y discutiendo del Dynabook y su potencial para amplificar el alcance de los humanos y traer nuevas formas de pensar.  
En el verano del 71 refinó la idea de la _KiddiKomp_ a un diseño mas ajustado llamado miniCOM. Tenía un nuevo display, un dispositivo para apuntar (mouse?), una memoria secundaria y un nuevo lenguaje llamado _Smalltalk_ (era Smalltalk-71). Le pareció un nombre tan inocuo/inofensivo que si hiciera cualquier cosa la gente ya estaría más que sorprendida. El lenguaje fue influenciado por _FLEX_, _PLANNER_, _LOGO_, _META II_ y sus derivados.  
Vuelve a explicar que la belleza de _Lisp_ se vió diluida definiendo partes del lenguaje como "formas especiales" en lugar de estar construido universalmente con funciones. Reflexionó mucho en como caracterizar a los objetos de forma que sean "computadoras universales" sin tener excepciones a la metáfora central. Para esto es necesario tener control en cuando y en que ambiente se evalúan las expresiones.  
Comenta que Dave Fisher presentó una solución elegante en una tésis. En esta dice que hay que manejar la mecánica de las invocaciones entre modulos sin que nos importen los detalles de los modulos en si mismo. El manejo sería igual para Smalltalk y Lisp, después difieren en como son sus modulos (apreciación mía: creo que esto tiene que ver con late-binding, resuelve todo lo externo a los módulos de la misma manera, evitando preocuparse por las implementaciones espécificas de los mismos).  
Alan intenta describir a la belleza de un lenguaje, sobre lo cual reflexiona mucho. Los lenguajes deberían reducirse a lo mínimos y necesario:

- ser adaptables a distintos contextos
- ser elegantes/comprensibles
- ser prácticos (que no pierdan simplicidad a la hora de escribir soluciones).

Después cuenta que siguió trabajando en las interfaces gráficas haciendo superposición de ventanas. La pantalla era importante para poder introducir la Dynabook a las escuelas con premisa de mostrar textos en buena calidad.  
Al final de la sección cuenta que presentó un plan para hacer un sistema que involucre OOP, ventanas, música, animaciones y programación icónica. "Simple things should be simple, complex things should be possible.".

## 1972-76---THE FIRST REAL SMALLTALK (-72), ITS BIRTH, APPLICATIONS,AND IMPROVEMENTS

Cuenta que hizo dos apuestas. Una fue que un colega decía que podía construir una computadora en 3 meses, kay lo ayudó con la pantalla (fonts,resolución,animación, música). Esta computadora terminó siendo la famosa ALTO. La segunda apuesta fue más interesante, discutiendo de lenguajes Alan Kay dijo que un lenguaje muy poderoso podía ser definido en una sola página (ya vió algo similar con Lisp). En unos días con el equipo diseñó el primer Smalltalk-72 que luego fue ligeramente modificado. Poco tiempo más tarde Dan Ingalls llevo el lenguaje a la vida en una _NOVA_ usando BASIC.  
Unos meses después construyeron la primer DynaBook y Dan Ingalls trabajó en hacer que corra smalltalk. Smalltalk se ordenó en 6 ideas:

- Todo es un objeto
- Los objetos se comunican enviando y recibiendo mensajes
- Los objetos tienen su propia memoria
- Cada objeto es instancia de una clase (que a su vez es un objeto)
- La clase contiene el comportamiento de sus instancias
- Para evaluar una lista de programa, se le pasa el control al primer objeto y el resto es tratado como un mensaje (a+b -> reciever:a message:+b).

Esto llevo a un estilo de programación que buscaba comportamiento genérico para los mensajes con símbolos, como que el + no sea único para números, sino que 'hola' + ' mundo' evalúe a 'hola mundo'. Esto es un polimorfismo, dependiendo del tipo de quien recive el mensaje cambia el comportamiento. Con esto en mente se podía agregar funcionalidad "intensionally", en lugar de extensiva, como definir en la clase de Integer el factorial en lugar de definir el método en cualquier lado. La idea de OOP es definir todo pensando en el comportamiento y la esencia (intensionalmente).

### Development of the Smalltalk-72 System and Applications

La implementación de _Smalltalk-72_ en la Interim Dynabook era fácil de cambiar y lo suficientemente rápida para hacer sistemas interactivos en tiempo real.  
El primer proyecto fue implementar las ventanas (las primeras con la convención GRAIL), que se rediseñaron varias veces porque no tenían suficiente poder de cómputo. Se podían mover, resizear, clonar y cerrar.  
Después se crearon las clases básicas (strings, int, etc), una clase para dibujar (turtle) y un editor de código de smalltalk ideado para usarse con mouse. Luego implementaron un editor de paráfos y documentos multimedia, en ese momento se dieron cuenta que cada objeto tendría que poder manejar su propia edición.  
Desarrollaron algunos avances de música simulada por computadora como procesar voces, conectar instrumentos, efectos, un sistema para la notación de música clara para niños y herremienatas de análisis musical.  
Hicieron simpula, una versión más simple que SIMULA para hacer simulaciones de por ejemplo hospitales o parques de diversiones.  
Acalaración: con programación icónica se refiere a programar usando entornos más visualas mostrando como debe cambiar el sistema de forma más entendible.

### The Evolution Of Smalltalk-72

Smalltalk-74 incorporó varias mejoras. Diccionario de mensajes para las clases, un rediseño de los gráficos implementado por Ingalls y una mejor y más general interfaz de las ventanas.  
Se agregó OOZE (Object-Oriented Zoned Environment) un sistema de memoria virtual ya que la ALTO tenía poca memoria. Hacía que solo los objetos necesarios estén en memoria "purgando" los "sucios" y los que no se utilizaban. Si un objeto importante se purgaba por error se traía de vuelta. Tuvieron que enfrentar otros desafíos de manejo de memoria pero al final consiguieron que el sistema crashee menos, que haya una imagen "checkpoint" de no más de unos segundos de antigüedad y usar la memoria de manera más eficiente.

### "Object-oriented" Style

Para que los desarrolladores no rompan el estado interno de los componentes, los objetos deben ser cosas con comportamiento de más alto nivel y tener algún objetivo para usar como componentes dinámicos, no como un tipo abstracto donde el manejo del estado es explícito.  
Lo eficiente de diseñar de forma orientada a objetos es que representa sistemas complejos de manera mucho más clara, además permite reducir la cantidad de código y al encapsular es menos frágil y mas extensible. Cuatro técnicas para hacerlo son:

- Los objetos deben mantener su propio estado
- polimorfismo
- instanciación
- métodos como metas (se debe definir comportamiento).

Básicamente la idea es eliminar algunas dificultades como el manejo éxplicito de datos para que los desarrolladores estén más preocupados en el diseño que en ciertas cuestiones técnicas.

### Smalltalk And Children

En el 73 empezaron los experimentos con los niños. Lo primero que hicieron fue usar la implementación de Turtle que hizo Adele Goldber en Smalltalk para que los chicos puedan dibujar en la pantalla, pero no les pareció muy productivo.  
Se les ocurrió hacer un libro para enseñar smalltalk y dió algunos resultados. Niños pudieron desarrollar proyectos interesantes como por ejemplo un sistema de diseño de circuitos.  
Si bien sentían que tenían éxito la realidad era otra, unos pocos usaban el sistema con naturalidad y la gran mayoría no lo aprendía a tiempo o no lo encontraba natural.  
Algo parecido pasó con adultos. Con conceptos básicos y el libro de Adele avanzaban bien, pero cuando tuvieron que hacer algún proyecto simple no lo podían llevar a cabo. Ahí Alan se dió cuenta que había muchas cosas que si no se conocian de antemano no eran obvias.  
En ese momento se decidieron a enseñar diseño. Daban la pauta de no implementar los métodos sino separar el problema en componentes y con lenguaje informal explicar como funcionaría para después implementarlo.  
Reflexiona que enseñar ideas poderosas (como inheritance) es muy difícil y que la programación así como la literatura y matemática (disciplinas que con años de antigüedad todavía son muy difíciles de enseñar) necesita años para interiorizarse. Además cuestiona que programar mejore la capacidad general de pensar mejor.  
Explica dos pilares fundamentales para aprender:

- Fluidez: construir las estructuras mentales para que las interpretaciones de las representaciones desaparezcan, como por ejemplo para un tenista la raqueta es una extensión de su cuerpo.

- Metáforas: una metáfora que ayude a iluminar otras áreas, pero evitando volver al problema aún más confuso.

## 1976-1980--THE FIRST MODERN SMALLTALK (-76), ITS BIRTH,APPLICATIONS, AND IMPROVEMENTS

A fines del 75 el equipo sentía que estaba sin rumbo y que la idea del "Dynabook for children" no estaba funcionando.  
Kay se puso a trabajar en una máquina portátil nueva, _NoteTaker_. Le parecía que smalltalk no cumplía con su visión para fomentar el pensamiento computacional en niños, mientras que Ingalls se volcó a diseñar smalltalk-76.
Dan se deshizo del dualismo entre funciones y clases que había en smalltalk para conseguir una definición totalmente intensional (comportamiento y esencia). La mayoría del código ya estaba escrito de esa manera.  
Mejoró el mecanismo de herencia haciendolo más flexible y solidificó la idea de que "todo es un objeto" incluidas las partes internas del sistema.
Además mejoró la sintáxis ya que antes era demasiado flexible. Agregó keywords y operadores mejorando la claridad y manteniendo flexibilidad. Mejoró el rendimiento (x180) usando un compilador como los de las máquinas FLEX (usando una representación de bytecode) y adaptando el OOZE VM.

### Inheritance

Se decidió omitir la implementación de herencia en smalltalk 72 ya que podía traer problemas de rigidez como paso con SIMULA. Para smalltalk-76 Dan presentó un esquma similar al de simula pero más flexible que podía ser modificado fácilmente acorde a las metas del equipo, lo que permite por ejemplo cosas como metaprogramación. a Alan igualmente no le terminaba de convencer.

En esta época Xerox seguía construyendo cada vez más computadoras, pero Alan insistía con la dynabook. Entendía que en el próximo tiempo las computadoras iban a ser suficientemente poderosas para funcionar enteramente por software. Por eso le parecía fundamental invertir en software.  
Años después, en 1992, el mercado de computadoras personales se duplico. La empresa más exitosa en ese entonces era Microsoft, una empresa de software.

### Smalltalk-76

Dan y su equipo terminaron el diseño de smalltalk-76 y lo implementaron en 7 meses desde cero, lo que incluía reescribir la definición de cada clase. Alan lo encontró fascinante, era rápido, podía resolver problemas complejos y era divertido. Se componía de 50 clases incluyendo funciones del OS, archivos, servicio de ethernet, la interfaz de ventanas, editores, gráficos y dos novedades: un buscador de métodos estáticos en la jerarquía de herencia y contextos dinámicos para debugging en run-time. Aparece el return ^,pasar colaboradores con :, self y la implementación de super para delegar el mensaje a la siguiente superclase. Todo esto implicó un gran avance.  
Cuenta que en el 78 tenían que dar un seminario de software para los directivos de Xerox con enfásis en su complejidad y que se podía hacer con el. En lugar de enseñarles smalltalk-76 decidieron crear (en dos meses) un sistema en smalltalk para usuarios no-expertos. Tomaron la simulación de una tienda que hicieron en _SIMPULA_ como punto de partida para crear una herramienta de simulaciones que los directivos puedan usar para hacer simulaciones dinámicas con gráficos animados en la pantalla al cambiar de estado. Se llamó Smalltalk SimKit. Adele Goldberg fue la líder de diseño. En este proceso también implementaron la opción de personalizar las fonts y su tamaño en el sistema. La presentación fue un éxtio rotundo, 9 de 10 directivos pudieron resolver el problema que quisieron en la simulación.  
Más adelante Dan se interesó por la NoteTaker y quería ver si podía correr smalltalk.
Para hacerlo correr llevó a cabo excelentes mejoras en el diseño del sistema y cambios en el manejo de memoria.  
Si bien los 8086 de la NoteTaker no eran tan buenos como la ALTO, el interprete resultó ser el doble de rápido que la ALTO. Funcionaba tan bien que hicieron 10 máquinas.  
Alan dice que le dió lastima que Xerox no les haya dado la oportunidad de hacer esto antes, y que lo hayan tenido que hacer con el CPU y display equivocados, cuando si en el año 70 les hubieran dado los recursos lo podrían haber hecho ellos.  
Para el año 79 estaban haciendo muchas demos, en particular hicieron una para Steve Jobs y la gente de Apple. Estaban desarrollando el proyecto _Lisa_ que todavía no tenían claro como debía ser así que visitaron PARC. Ahí les mostraron la _Dorado_, una máquina muy rápida "hermana mayor" de la ALTO.  
En una parte de la presentación Jobs dijo que no le gustaba la forma de scrollear y preguntó si se podía hacer de forma más continua a lo que en menos de un minuot Dan cambio los métodos e implementó un scroll continuo. Quienes veían quedaron shockeados, especialmente los programadores, que nunca vieron un sistema tan poderoso. Jobs trato de comprar la tecnología pero Xerox se negó y tampoco la siguió desarrollando con inversiones en la NoteTaker.

## 1980-1983--THE RELEASE VERSION OF SMALLTALK (-80)

Dan Ingals dijo : "La decisión de no continuar con el proyecto NoteTaker agregó motivación adicional para publicar SmallTalk". Alan estaba contento con la elegancia del Smalltalk de Dan y su equipo pero triste porque desde el debut de Smalltalk-76 ningún niño tuvo acceso a usarlo.  
Esto y que tecnologías viables en el sentido comercial como sus displays también sean abandonadas, le hizo pensar que Xerox nunca iba a entender su punto de vista. Luego decidió tomarse un "sabático".  
Para que Smalltalk se pueda distribuir Adele escribió la documentación y se hicieron algunos cambios, como cambiar la fuente a ASCII para que sea generalmente más compatible y transformaron los Blocks en algo más parecido a las lambdas.  
Lo que más sorprendió a Alan fue la implementación de las metaclases, que le pareció algo que aportó mas confusión que valor.

### Coda

Alan concluye que POO y late-binding son clave para mejorar el software y critica como por culpa del hardware y la optimización excesiva, se atrasa el progreso del diseño de software.

Aclaración: Late-binding (o vinculación tardía) es un concepto en programación que se refiere a la resolución de los métodos o comportamientos de un objeto en tiempo de ejecución, en lugar de hacerlo en tiempo de compilación. Es un enfoque utilizado para que las decisiones sobre qué código ejecutar (como qué método llamar) se tomen solo cuando sea necesario, es decir, cuando el programa se esté ejecutando, no antes.

En un sistema con late-binding, el código no se enlaza a una función o método específico hasta que el programa ejecuta la llamada. Este enfoque permite mayor flexibilidad, ya que permite que el comportamiento de los objetos pueda cambiar dinámicamente durante la ejecución del programa. Este concepto es esencial en la Programación Orientada a Objetos (OOP), donde el tipo de un objeto no siempre es conocido de antemano y puede depender del contexto en que se utiliza.

Por ejemplo, en un lenguaje de programación como Smalltalk, un método puede ser determinado dinámicamente en función del tipo de objeto al que se le aplique, permitiendo una mayor flexibilidad y extensibilidad en el diseño del software, no así en Simula que al compilarse cada objeto tiene ligado su método.
