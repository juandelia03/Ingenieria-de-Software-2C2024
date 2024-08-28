!classDefinition: #Bill category: #'Ejercicio 2'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: #'Ejercicio 2'!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: '-- all --' stamp: 'JD 8/20/2024 12:52:48'!
caminar: unaCantidadDeKilometros
	energia := energia - (3 + (unaCantidadDeKilometros/kilometer) * day)! !

!Bill class methodsFor: '-- all --' stamp: 'JD 8/17/2024 19:51:04'!
comer: unaCantidadDeKilosDeCerebro
	energia := energia + (4*day*unaCantidadDeKilosDeCerebro/kilogram) ! !

!Bill class methodsFor: '-- all --' stamp: 'JD 8/17/2024 19:38:59'!
energia
	^energia! !

!Bill class methodsFor: '--** private fileout/in **--' stamp: 'JD 8/20/2024 13:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := (SimpleMeasure basicNew instVarAt: 1 put: 23; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'day'; instVarAt: 2 put: 'days'; instVarAt: 3 put: 'NO SIGN'; yourself); yourself).! !


!Bill class methodsFor: '--** private fileout/in **--' stamp: 'JD 8/20/2024 13:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := (SimpleMeasure basicNew instVarAt: 1 put: 23; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'day'; instVarAt: 2 put: 'days'; instVarAt: 3 put: 'NO SIGN'; yourself); yourself).! !

Bill initializeAfterFileIn!