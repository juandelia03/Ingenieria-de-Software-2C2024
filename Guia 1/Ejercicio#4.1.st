!classDefinition: #I category: #'Ejercicio 4.1'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Ejercicio 4.1'!
I class
	instanceVariableNames: ''!

!I class methodsFor: '-- all --' stamp: 'JD 8/20/2024 15:49:04'!
* aMultiplicand
	^aMultiplicand .! !

!I class methodsFor: '-- all --' stamp: 'JD 8/20/2024 15:16:29'!
+ anAdder
	^anAdder next
	! !

!I class methodsFor: '-- all --' stamp: 'JD 8/20/2024 16:30:56'!
- sustrahend
	^self error: 'No se le puede restar a I'
! !

!I class methodsFor: '-- all --' stamp: 'JD 8/20/2024 16:02:58'!
/ dividend 
	dividend = I ifTrue:[^I].
	^self error:'Los numeros no son divisibles'! !

!I class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:51:08'!
menorA: unNumero
	unNumero  = I ifTrue: [^false].
	^true
! !

!I class methodsFor: '-- all --' stamp: 'JD 8/20/2024 14:03:31'!
next 
	^II! !

!I class methodsFor: '-- all --' stamp: 'JD 8/20/2024 15:24:32'!
previous
	^self error: 'El I no tiene previo'! !


!classDefinition: #II category: #'Ejercicio 4.1'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Ejercicio 4.1'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:12:17'!
* aMultiplicand
	aMultiplicand = I ifTrue:[^self].
	^self + (self * (aMultiplicand previous))
	
	
	

	! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 20:09:10'!
+ anAdder
	^ self previous + (anAdder next ) 
! !

!II class methodsFor: '-- all --' stamp: 'JD 8/20/2024 15:41:53'!
- sustrahend 
	sustrahend  = I ifTrue:[^self previous ].
	^(self previous ) - (sustrahend previous )! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:46:20'!
/ dividend
	|esMenor|
	esMenor := self menorA:dividend.
	esMenor ifTrue:[self error:'El divisor no puede ser mas grande que el dividendo'].
	dividend = I ifTrue: [^self].
	self = dividend ifTrue:[^I].
	^I + ((self - dividend)/dividend)! !

!II class methodsFor: '--** private fileout/in **--' stamp: 'jd 8/24/2024 20:01:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:50:35'!
menorA: unNumero
	unNumero = I ifTrue: [^false].
	^self previous menorA: (unNumero previous)! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:04:32'!
next
	next ifNotNil: [^next].
	next := II createChildNamed: self name,'I'.
	next previous: self.
	^ (self next)! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:03:47'!
previous
	^previous! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:08:35'!
previous: previo
	previous:=previo.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'jd 8/24/2024 20:01:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: #'Ejercicio 4.1'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Ejercicio 4.1'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'jd 8/24/2024 20:01:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: #'Ejercicio 4.1'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Ejercicio 4.1'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: '--** private fileout/in **--' stamp: 'jd 8/24/2024 20:01:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: #'Ejercicio 4.1'!
II subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Ejercicio 4.1'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'jd 8/24/2024 20:01:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: #'Ejercicio 4.1'!
II subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #'Ejercicio 4.1'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: '--** private fileout/in **--' stamp: 'jd 8/24/2024 20:01:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIII.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!