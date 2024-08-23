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

!I class methodsFor: '-- all --' stamp: 'JD 8/22/2024 13:15:12'!
nameOfNext
	^II! !

!I class methodsFor: '-- all --' stamp: 'JD 8/20/2024 14:03:31'!
next 
	^II! !

!I class methodsFor: '-- all --' stamp: 'JD 8/20/2024 15:24:32'!
previous
	^self error: 'El I no tiene previo'! !


!classDefinition: #II category: 'Ejercicio 4.3'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Ejercicio 4.3'!
II class
	instanceVariableNames: ''!

!II class methodsFor: '-- all --' stamp: 'JD 8/20/2024 15:53:19'!
* aMultiplicand
	aMultiplicand = I ifTrue:[^self].
	^self + (self * (aMultiplicand previous ))

	! !

!II class methodsFor: '-- all --' stamp: 'JD 8/22/2024 12:47:28'!
+ anAdder
	^ self previous + (anAdder next ) 
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

!II class methodsFor: '-- all --' stamp: 'JD 8/22/2024 13:24:12'!
nameOfNext
	(self name endsWith: 'VIII') ifTrue:[^(self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'IX') ifTrue:[^(self name withoutSuffix: 'IX'), 'X'].
	^self name,'I'! !

!II class methodsFor: '-- all --' stamp: 'JD 8/22/2024 13:16:15'!
next
	|Nombresiguiente|
	Nombresiguiente := self nameOfNext.
	self createChildNamed: Nombresiguiente .
	^ (self children at:1)! !

!II class methodsFor: '-- all --' stamp: 'JD 8/20/2024 14:28:02'!
previous
	self = II ifTrue: [^I].
	^self parent! !


!classDefinition: #III category: 'Ejercicio 4.3'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #IV category: 'Ejercicio 4.3'!
III subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #V category: 'Ejercicio 4.3'!
IV subclass: #V
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #VI category: 'Ejercicio 4.3'!
V subclass: #VI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #VII category: 'Ejercicio 4.3'!
VI subclass: #VII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #VIII category: 'Ejercicio 4.3'!
VII subclass: #VIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #IX category: 'Ejercicio 4.3'!
VIII subclass: #IX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #X category: 'Ejercicio 4.3'!
IX subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XI category: 'Ejercicio 4.3'!
X subclass: #XI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XII category: 'Ejercicio 4.3'!
XI subclass: #XII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XIII category: 'Ejercicio 4.3'!
XII subclass: #XIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XIV category: 'Ejercicio 4.3'!
XIII subclass: #XIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XV category: 'Ejercicio 4.3'!
XIV subclass: #XV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XVI category: 'Ejercicio 4.3'!
XV subclass: #XVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XVII category: 'Ejercicio 4.3'!
XVI subclass: #XVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XVIII category: 'Ejercicio 4.3'!
XVII subclass: #XVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XIX category: 'Ejercicio 4.3'!
XVIII subclass: #XIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XX category: 'Ejercicio 4.3'!
XIX subclass: #XX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXI category: 'Ejercicio 4.3'!
XX subclass: #XXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXII category: 'Ejercicio 4.3'!
XXI subclass: #XXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXIII category: 'Ejercicio 4.3'!
XXII subclass: #XXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXIV category: 'Ejercicio 4.3'!
XXIII subclass: #XXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXV category: 'Ejercicio 4.3'!
XXIV subclass: #XXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXVI category: 'Ejercicio 4.3'!
XXV subclass: #XXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXVII category: 'Ejercicio 4.3'!
XXVI subclass: #XXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXVIII category: 'Ejercicio 4.3'!
XXVII subclass: #XXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXIX category: 'Ejercicio 4.3'!
XXVIII subclass: #XXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXX category: 'Ejercicio 4.3'!
XXIX subclass: #XXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXXI category: 'Ejercicio 4.3'!
XXX subclass: #XXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXXII category: 'Ejercicio 4.3'!
XXXI subclass: #XXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXXIII category: 'Ejercicio 4.3'!
XXXII subclass: #XXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXXIV category: 'Ejercicio 4.3'!
XXXIII subclass: #XXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXXV category: 'Ejercicio 4.3'!
XXXIV subclass: #XXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXXVI category: 'Ejercicio 4.3'!
XXXV subclass: #XXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXXVII category: 'Ejercicio 4.3'!
XXXVI subclass: #XXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXXVIII category: 'Ejercicio 4.3'!
XXXVII subclass: #XXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!


!classDefinition: #XXXIX category: 'Ejercicio 4.3'!
XXXVIII subclass: #XXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4.3'!
