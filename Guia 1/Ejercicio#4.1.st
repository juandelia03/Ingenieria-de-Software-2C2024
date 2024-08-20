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
	instanceVariableNames: ''!

!II class methodsFor: '-- all --' stamp: 'JD 8/20/2024 15:53:19'!
* aMultiplicand
	aMultiplicand = I ifTrue:[^self].
	^self + (self * (aMultiplicand previous ))

	! !

!II class methodsFor: '-- all --' stamp: 'JD 8/20/2024 15:46:52'!
+ anAdder
	anAdder = I ifTrue: [^self next].
	^ self next + (anAdder previous ) 
! !

!II class methodsFor: '-- all --' stamp: 'JD 8/20/2024 15:41:53'!
- sustrahend 
	sustrahend  = I ifTrue:[^self previous ].
	^(self previous ) - (sustrahend previous )! !

!II class methodsFor: '-- all --' stamp: 'JD 8/20/2024 16:20:53'!
/ dividend
	(dividend isDescendantOf:self) ifTrue:[self error:'El divisor no puede ser mas grande que el dividendo'].
	dividend = I ifTrue: [^self].
	self = dividend ifTrue:[^I].
	^I + ((self - dividend)/dividend)! !

!II class methodsFor: '-- all --' stamp: 'JD 8/20/2024 14:21:47'!
next
	self createChildNamed: self name , 'I'.
	^ (self children at:1)! !

!II class methodsFor: '-- all --' stamp: 'JD 8/20/2024 14:28:02'!
previous
	self = II ifTrue: [^I].
	^self parent! !


!classDefinition: #III category: #'Ejercicio 4.1'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!


!classDefinition: #IIII category: #'Ejercicio 4.1'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!


!classDefinition: #IIIII category: #'Ejercicio 4.1'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!


!classDefinition: #IIIIII category: #'Ejercicio 4.1'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.1'!
