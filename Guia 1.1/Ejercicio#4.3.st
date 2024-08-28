!classDefinition: #I category: 'Ejercicio 4.3'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Ejercicio 4.3'!
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

!I class methodsFor: '-- all --' stamp: 'jd 8/24/2024 20:16:09'!
restarleA:unNumero
	^unNumero previous.! !


!classDefinition: #II category: 'Ejercicio 4.3'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Ejercicio 4.3'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: '-- all --' stamp: 'jd 8/24/2024 20:27:15'!
* aMultiplicand
	^aMultiplicand + (self previous * aMultiplicand)
	
	
	

	! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 20:09:10'!
+ anAdder
	^ self previous + (anAdder next ) 
! !

!II class methodsFor: '-- all --' stamp: 'jd 8/24/2024 20:09:29'!
- sustrahend 
	^sustrahend restarleA: self .! !

!II class methodsFor: '-- all --' stamp: 'jd 8/24/2024 20:28:23'!
/ dividend
	(self menorA:dividend) ifTrue:[self error:'El divisor no puede ser mas grande que el dividendo'].
	dividend = I ifTrue: [^self].
	self = dividend ifTrue:[^I].
	^I + ((self - dividend)/dividend)! !

!II class methodsFor: '--** private fileout/in **--' stamp: 'jd 8/24/2024 20:43:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:50:35'!
menorA: unNumero
	unNumero = I ifTrue: [^false].
	^self previous menorA: (unNumero previous)! !

!II class methodsFor: '-- all --' stamp: 'jd 8/24/2024 20:32:14'!
nameOfNext
	(self name endsWith: 'VIII') ifTrue:[^(self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'IX') ifTrue:[^(self name withoutSuffix: 'IX'), 'X'].
	^self name,'I'! !

!II class methodsFor: '-- all --' stamp: 'jd 8/24/2024 20:32:33'!
next
	next ifNotNil: [^next].
	next := II createChildNamed: self nameOfNext.
	next previous: self.
	^ (self next)! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:03:47'!
previous
	^previous! !

!II class methodsFor: '-- all --' stamp: 'jd 8/23/2024 21:08:35'!
previous: previo
	previous:=previo.! !

!II class methodsFor: '-- all --' stamp: 'jd 8/24/2024 20:23:38'!
restarleA:unNumero
	^self previous restarleA: (unNumero previous)

! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'jd 8/24/2024 20:43:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Ejercicio 4.3'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Ejercicio 4.3'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'jd 8/24/2024 20:43:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := II.! !

II initializeAfterFileIn!
III initializeAfterFileIn!