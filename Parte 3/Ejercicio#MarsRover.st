!classDefinition: #MarsRoverTest category: #'Ejercicio MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:47:30'!
test01EmptyInstructionMakesMarsRoverStayStill
	|marsRover|
	marsRover := MarsRover PointingAtNorthWithPosition: 0@0.
	marsRover receiveInstruction:''.
	self assert:(marsRover pointingNorthAt: 0@0).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:48:37'!
test02InstructionWithAnFMakesMarsRoverGoForwardPointingN
	|marsRover|
	marsRover := MarsRover PointingAtNorthWithPosition: 0@4.
	marsRover receiveInstruction:'f'.
	self assert:(marsRover pointingNorthAt:0@5 ).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:49:18'!
test03InstructionWithABMakesMarsRoverGoBack
	|marsRover|
	marsRover := MarsRover PointingAtNorthWithPosition: 2@3.
	marsRover receiveInstruction:'b'.
	self assert:(marsRover pointingNorthAt: 2@2).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:50:05'!
test04InstructionWithAnLMakesMarsRoverGoLeftPointingNorth
	|marsRover|
	marsRover := MarsRover PointingAtNorthWithPosition: 2@3.
	marsRover receiveInstruction:'l'.
	self assert:(marsRover pointingWestAt:2@3).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:50:54'!
test05InstructionWithAnLMakesMarsRoverGoLeftPointingW
	|marsRover|
	marsRover := MarsRover PointingAtWestWithPosition: 2@3.
	marsRover receiveInstruction:'l'.
	self assert:(marsRover pointingSouthAt:2@3).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:51:54'!
test06InstructionWithAnLMakesMarsRoverGoLeftPointingE
	|marsRover|
	marsRover := MarsRover PointingAtSouthWithPosition: 2@3.
	marsRover receiveInstruction:'l'.
	self assert:(marsRover pointingEastAt:2@3).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:52:41'!
test07InstructionWithAnLMakesMarsRoverGoLeftPointingS
	|marsRover|
	marsRover := MarsRover PointingAtEastWithPosition: 2@3.
	marsRover receiveInstruction:'l'.
	self assert:(marsRover pointingNorthAt:2@3).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:53:26'!
test08InstructionWithAnRMakesMarsRoverGoRightPointingN
	"no chequeo que rote bien para cada lado porque la defino usando rotateLeft que se que anda"
	|marsRover|
	marsRover := MarsRover PointingAtEastWithPosition: 2@3.
	marsRover receiveInstruction:'r'.
	self assert:(marsRover pointingSouthAt:2@3).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:53:56'!
test09InstructionWithMultipleCommandsGetsProcessedProperly
	"no chequeo que rote bien para cada lado porque la defino usando rotateLeft que se que anda"
	|marsRover|
	marsRover := MarsRover PointingAtEastWithPosition: 2@3.
	marsRover receiveInstruction:'rfrrlllfbbff'.
	self assert:(marsRover pointingEastAt:3@2).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:54:35'!
"los siguientes test deberian haber ido despues del 3"
test10InstructionWithAnFMakesMarsRoverGoForwardPointingS
	|marsRover|
	marsRover := MarsRover PointingAtSouthWithPosition: 2@5.
	marsRover receiveInstruction:'f'.
	self assert:(marsRover pointingSouthAt:2@4).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:55:20'!
"los siguientes test deberian haber ido despues del 3"
test11InstructionWithAnFMakesMarsRoverGoForwardPointingW
	|marsRover|
	marsRover := MarsRover PointingAtWestWithPosition: 2@5.
	marsRover receiveInstruction:'f'.
	self assert:(marsRover pointingWestAt:1@5).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:56:07'!
"los siguientes test deberian haber ido despues del 3"
test12InstructionWithAnFMakesMarsRoverGoForwardPointingE
	|marsRover|
	marsRover := MarsRover PointingAtEastWithPosition: 2@5.
	marsRover receiveInstruction:'f'.
	self assert:(marsRover pointingEastAt:3@5).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:59:07'!
test13MarsRoverCanNotWalkToXNegativeCoordinate
	|marsRover|
	marsRover := MarsRover PointingAtWestWithPosition: 0@5.
	self should: [marsRover receiveInstruction:'f'.] raise: Error withExceptionDo: [:error | 
		self assert: error messageText equals: 'Can not walk to a negative coordinate' ] 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:59:02'!
test14MarsRoverCanNotWalkToYNegativeCoordinate
	|marsRover|
	marsRover := MarsRover PointingAtSouthWithPosition: 5@0.
	self should: [marsRover receiveInstruction:'f'.] raise: Error withExceptionDo: [:error | 
		self assert: error messageText equals: 'Can not walk to a negative coordinate' ] 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:59:42'!
test15MarsRoverCanNotBeCreatedInNegativePosition
	self should: [	MarsRover PointingAtSouthWithPosition: (-2@0).] raise: Error withExceptionDo: [:error | 
		self assert: error messageText equals: 'MarsRover Can not be created in Negative Coordinates' ] 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 01:00:30'!
test16MarsRoverWithInvalidInstructionStopsProcessing
	|marsRover|
	marsRover := MarsRover PointingAtEastWithPosition: 2@5.
	marsRover receiveInstruction:'ffgffblbffhr'.
	self assert:(marsRover pointingEastAt:4@5 ).! !


!classDefinition: #MarsRover category: #'Ejercicio MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MarsRover methodsFor: 'initialize' stamp: 'jd 10/16/2024 00:37:39'!
initializePointingAtEastWithPosition:aPosition
	position := aPosition.
	orientation := MarsRoverPointingEast with:self.
! !

!MarsRover methodsFor: 'initialize' stamp: 'jd 10/16/2024 00:36:11'!
initializePointingAtNorthWithPosition:aPosition
	position := aPosition.
	orientation := MarsRoverPointingNorth with:self.
! !

!MarsRover methodsFor: 'initialize' stamp: 'jd 10/16/2024 00:37:49'!
initializePointingAtSouthWithPosition:aPosition
	position := aPosition.
	orientation := MarsRoverPointingSouth with:self.
! !

!MarsRover methodsFor: 'initialize' stamp: 'jd 10/16/2024 00:37:29'!
initializePointingAtWestWithPosition:aPosition
	position := aPosition.
	orientation := MarsRoverPointingWest with:self.
! !


!MarsRover methodsFor: 'receive' stamp: 'jd 10/16/2024 00:00:34'!
isInvalid:aCommand
	^(#($f $b $l $r) includes:aCommand) not.

	! !

!MarsRover methodsFor: 'receive' stamp: 'jd 10/16/2024 00:19:07'!
processCommand: aCommand
	aCommand = $f ifTrue:[^self goForward].
	aCommand = $b ifTrue:[^self goBack].
	aCommand = $l ifTrue:[^self rotateLeft].
	aCommand = $r ifTrue:[^self rotateRight].
! !

!MarsRover methodsFor: 'receive' stamp: 'jd 10/15/2024 23:58:49'!
receiveInstruction: anInstruction 
	anInstruction do:[:aCommand|
		(self isInvalid:aCommand) ifTrue:[^self].
		self processCommand: aCommand.
		]

	! !


!MarsRover methodsFor: 'move' stamp: 'jd 10/14/2024 22:04:38'!
goBack
	self turnAround.
	self goForward.
	self turnAround! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 00:12:50'!
goForward
	orientation goForward.
! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 00:19:39'!
goForwardPointingEast
	^position := ((position x)+1)@(position y)! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 00:13:05'!
goForwardPointingNorth
	^ position := (position x)@((position y)+1)! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 00:22:12'!
goForwardPointingSouth
	position y = 0 ifTrue:[self signalCantWalkToNegativeCoordinate].
	position := (position x)@((position y)-1)! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 00:22:12'!
goForwardPointingWest
	position x = 0 ifTrue:[self signalCantWalkToNegativeCoordinate].
	position := ((position x)-1)@(position y)! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 00:16:34'!
rotateLeft
	orientation rotateLeft.
! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 01:03:31'!
rotateLeftPointingEast
	orientation := MarsRoverPointingNorth with:self.! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 01:03:36'!
rotateLeftPointingNorth
	orientation := MarsRoverPointingWest with:self.
! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 01:03:41'!
rotateLeftPointingSouth
	orientation := MarsRoverPointingEast with:self.
! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 01:03:45'!
rotateLeftPointingWest
	orientation := MarsRoverPointingSouth with:self.
! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/14/2024 22:06:24'!
rotateRight
	self turnAround. 
	self rotateLeft.! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 00:22:40'!
signalCantWalkToNegativeCoordinate
	^ self error:'Can not walk to a negative coordinate'! !

!MarsRover methodsFor: 'move' stamp: 'jd 10/16/2024 00:13:25'!
turnAround
	^2 timesRepeat:[self rotateLeft]! !



!MarsRover methodsFor: 'asserting' stamp: 'jd 10/16/2024 00:46:56'!
pointingEastAt: aPosition 
	^ position = aPosition and:[orientation isPointingEast ].! !

!MarsRover methodsFor: 'asserting' stamp: 'jd 10/16/2024 00:46:12'!
pointingNorthAt: aPosition 
	^ position = aPosition and:[orientation isPointingNorth].! !

!MarsRover methodsFor: 'asserting' stamp: 'jd 10/16/2024 00:47:13'!
pointingSouthAt: aPosition 
	^ position = aPosition and:[orientation isPointingSouth ].! !

!MarsRover methodsFor: 'asserting' stamp: 'jd 10/16/2024 00:47:04'!
pointingWestAt: aPosition 
	^ position = aPosition and:[orientation isPointingWest ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Ejercicio MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'jd 10/16/2024 00:38:24'!
PointingAtEastWithPosition: aPosition
	self assertPositionIsPositive: aPosition.
	^self new initializePointingAtEastWithPosition: aPosition.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'jd 10/16/2024 00:35:05'!
PointingAtNorthWithPosition: aPosition
	self assertPositionIsPositive: aPosition.
	^self new initializePointingAtNorthWithPosition: aPosition.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'jd 10/16/2024 00:38:17'!
PointingAtSouthWithPosition: aPosition
	self assertPositionIsPositive: aPosition.
	^self new initializePointingAtSouthWithPosition: aPosition.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'jd 10/16/2024 00:38:32'!
PointingAtWestWithPosition: aPosition
	self assertPositionIsPositive: aPosition.
	^self new initializePointingAtWestWithPosition: aPosition.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'jd 10/14/2024 22:32:26'!
assertPositionIsPositive: aPosition
	^ (aPosition x < 0 or:[aPosition y<0]) ifTrue:[self error:'MarsRover Can not be created in Negative Coordinates']! !


!classDefinition: #MarsRoverOrientation category: #'Ejercicio MarsRover'!
Object subclass: #MarsRoverOrientation
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MarsRoverOrientation methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:02:02'!
initializeWith:aMarsRover
	marsRover := aMarsRover! !

!MarsRoverOrientation methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:42:06'!
isPointingEast
	^false.! !

!MarsRoverOrientation methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:42:00'!
isPointingNorth
	^false.! !

!MarsRoverOrientation methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:42:04'!
isPointingSouth
	^false.! !

!MarsRoverOrientation methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:42:10'!
isPointingWest
	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientation class' category: #'Ejercicio MarsRover'!
MarsRoverOrientation class
	instanceVariableNames: ''!

!MarsRoverOrientation class methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:01:43'!
with:aMarsRover
	^(self new) initializeWith:aMarsRover! !


!classDefinition: #MarsRoverPointingEast category: #'Ejercicio MarsRover'!
MarsRoverOrientation subclass: #MarsRoverPointingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MarsRoverPointingEast methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:09:44'!
goForward
	marsRover goForwardPointingEast.! !

!MarsRoverPointingEast methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:42:45'!
isPointingEast
	^true.! !

!MarsRoverPointingEast methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:15:30'!
rotateLeft
	marsRover rotateLeftPointingEast.
		! !


!classDefinition: #MarsRoverPointingNorth category: #'Ejercicio MarsRover'!
MarsRoverOrientation subclass: #MarsRoverPointingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MarsRoverPointingNorth methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:09:29'!
goForward
	marsRover goForwardPointingNorth.
	
	! !

!MarsRoverPointingNorth methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:42:53'!
isPointingNorth
	^true.! !

!MarsRoverPointingNorth methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:15:45'!
rotateLeft
	marsRover rotateLeftPointingNorth.
		! !


!classDefinition: #MarsRoverPointingSouth category: #'Ejercicio MarsRover'!
MarsRoverOrientation subclass: #MarsRoverPointingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MarsRoverPointingSouth methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:09:54'!
goForward
	marsRover goForwardPointingSouth.! !

!MarsRoverPointingSouth methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:42:58'!
isPointingSouth
	^true.! !

!MarsRoverPointingSouth methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:15:56'!
rotateLeft
	marsRover rotateLeftPointingSouth.
		! !


!classDefinition: #MarsRoverPointingWest category: #'Ejercicio MarsRover'!
MarsRoverOrientation subclass: #MarsRoverPointingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio MarsRover'!

!MarsRoverPointingWest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:10:07'!
goForward
	marsRover goForwardPointingWest.! !

!MarsRoverPointingWest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:42:18'!
isPointingWest
	^true.! !

!MarsRoverPointingWest methodsFor: 'as yet unclassified' stamp: 'jd 10/16/2024 00:16:03'!
rotateLeft
	marsRover rotateLeftPointingWest.
		! !
