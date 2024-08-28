!classDefinition: #BoolsTest category: #'Ejercicio Bools'!
DenotativeObject subclass: #BoolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Bools'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoolsTest class' category: #'Ejercicio Bools'!
BoolsTest class
	instanceVariableNames: ''!

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:18:08'!
testFalsoOFalso
	Assert that: (Falso o:Falso) isEqualTo:Falso! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:18:49'!
testFalsoOVerdadero
	Assert that: (Falso o:Verdadero) isEqualTo:Verdadero! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/18/2024 23:40:53'!
testFalsoSiFalso
	Assert that: (Falso  siFalso:[1+2]) isEqualTo: (3)! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/18/2024 23:37:36'!
testFalsoSiVerdadero
	Assert that: (Falso  siVerdadero:[1+2]) isEqualTo: ([] value)! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:20:16'!
testFalsoYFalso
	Assert that: (Falso y:Falso) isEqualTo:Falso! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:20:32'!
testFalsoYVerdadero
	Assert that: (Falso y:Verdadero) isEqualTo:Falso! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:09:57'!
testNegarFalsoEsVerdadero
	
	Assert that: Falso no isEqualTo: Verdadero! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:09:03'!
testNegarVerdaderoEsFalso
	
	Assert that: Verdadero no isEqualTo: Falso! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:14:20'!
testVerdaderoOFalso
	Assert that: (Verdadero o:Falso) isEqualTo:Verdadero! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:13:39'!
testVerdaderoOVerdadero
	Assert that: (Verdadero o:Verdadero) isEqualTo:Verdadero! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/18/2024 23:41:26'!
testVerdaderoSiFalso
	Assert that: (Verdadero  siFalso:[1+2]) isEqualTo: ([] value)! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/18/2024 23:27:43'!
testVerdaderoSiVerdadero
	Assert that: (Verdadero  siVerdadero:[1+2]) isEqualTo:3! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:16:22'!
testVerdaderoYFalso
	Assert that: (Verdadero y:Falso) isEqualTo:Falso! !

!BoolsTest class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:14:53'!
testVerdaderoYVerdadero
	Assert that: (Verdadero y:Verdadero) isEqualTo:Verdadero! !


!classDefinition: #Falso category: #'Ejercicio Bools'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Bools'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: #'Ejercicio Bools'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:10:28'!
no
	^Verdadero! !

!Falso class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:19:45'!
o: unBooleano
	^unBooleano
	! !

!Falso class methodsFor: '-- all --' stamp: 'JD 8/18/2024 23:39:22'!
siFalso: unaAccionARealizarUIgnorar
	^unaAccionARealizarUIgnorar  value! !

!Falso class methodsFor: '-- all --' stamp: 'JD 8/18/2024 23:39:01'!
siVerdadero: unaAccionARealizarUIgnorar
	^[] value! !

!Falso class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:21:23'!
y: unBooleano
	
	^self! !


!classDefinition: #Verdadero category: #'Ejercicio Bools'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Bools'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: #'Ejercicio Bools'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: '-- all --' stamp: 'JD 8/17/2024 19:59:25'!
no
	^Falso! !

!Verdadero class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:21:45'!
o: unBooleano
	^self! !

!Verdadero class methodsFor: '-- all --' stamp: 'JD 8/18/2024 23:39:34'!
siFalso: unaAccion
	^[] value! !

!Verdadero class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:23:04'!
siVerdadero: unaAccion
	^unaAccion value! !

!Verdadero class methodsFor: '-- all --' stamp: 'JD 8/17/2024 20:00:16'!
y: unBooleano
	^unBooleano! !
