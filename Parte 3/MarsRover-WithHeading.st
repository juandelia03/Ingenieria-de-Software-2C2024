!classDefinition: #MarsRoverLogTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLogTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 17:57:34'!
east

	^ MarsRoverHeadingEast! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 17:24:33'!
north

	^ MarsRoverHeadingNorth! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 18:48:15'!
test01LogCheckingPositionHasNotLoggedAnythingWhenStill
	| marsRover positionLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	positionLog := MarsRoverPositionLog observing:marsRover.
		
	self  assert: (positionLog isEmpty).
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 18:26:45'!
test02LogCheckingPositionUpdatesPositionWhenMovingBackwards
	| marsRover positionLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	positionLog := MarsRoverPositionLog observing:marsRover .

	
	marsRover moveBackward.
	
	self  assert: (positionLog log) equals:(OrderedCollection with:(1@1))
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:17:40'!
test03LogCheckingPositionUpdatesPositionWhenMovingForward
	| marsRover positionLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	positionLog := MarsRoverPositionLog observing: marsRover.
	
	marsRover moveForward.
	
	self assert: (positionLog log) equals:(OrderedCollection with:1@3).

	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:17:07'!
test04LogCheckingPositionDoesNotChangeWhenRotatingRight
	| marsRover positionLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	positionLog := MarsRoverPositionLog observing:marsRover .

	marsRover rotateRight .
	
	self  assert: (positionLog isEmpty)
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:17:13'!
test05LogCheckingPositionDoesNotChangeWhenRotatingLeft
	| marsRover positionLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	positionLog := MarsRoverPositionLog observing:marsRover .

	
	marsRover moveBackward.
	
	self  assert: (positionLog log) equals:(OrderedCollection with:(1@1))
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:22:22'!
test06LogCheckingHeadingHasNoLogsWhenStill
	| marsRover headLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headLog := MarsRoverHeadLog observing: marsRover.
	
	self  assert: (headLog isEmpty )
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:18:54'!
test07LogCheckingHeadingUpdatesHeadingWhenRotatingLeft
	| marsRover headLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headLog := MarsRoverHeadLog observing: marsRover.
	
	marsRover rotateLeft.
	self  assert: (headLog log) equals:(OrderedCollection with:(#west))
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:21:43'!
test08LogCheckingHeadingUpdatesHeadingWhenRotatingRight
	| marsRover headLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headLog := MarsRoverHeadLog observing: marsRover.
	
	marsRover rotateRight.
	self  assert: (headLog log) equals:(OrderedCollection with:(#east))
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:21:37'!
test09LogCheckingHeadingDoesNotChangeWhenMovingForward
	| marsRover headLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headLog := MarsRoverHeadLog observing: marsRover.
	
	marsRover moveForward.
	self  assert: (headLog isEmpty) 
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:21:33'!
test10LogCheckingHeadingDoesNotChangeWhenMovingBackward
	| marsRover headLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headLog := MarsRoverHeadLog observing: marsRover.
	
	marsRover moveBackward.
	self  assert: (headLog isEmpty) 
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:25:51'!
test11LogCheckingHeadingProccessingManyInstructionsLogJustHeading
	| marsRover headLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headLog := MarsRoverHeadLog observing: marsRover.
	
	marsRover process:'ffblrr'.
	self  assert: (headLog log )equals:(OrderedCollection with:#west  with:#north  with:#east ) 
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:27:48'!
test12LogCheckingPositionProccessingManyInstructionsLogJustPositions
	"este era el 6, me lo olvide"
	| marsRover headLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headLog := MarsRoverPositionLog observing: marsRover.
	
	marsRover process:'ffblrr'.
	self  assert: (headLog log )equals:(OrderedCollection with:1@3  with:1@4  with:1@3 ) 
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 19:59:53'!
test13LogCheckingPositionAndHeadingIsEmptyWhenStill
	| marsRover headAndPositonLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headAndPositonLog := MarsRoverHeadAndPositionLog observing: marsRover.
	
	self assert:(headAndPositonLog isEmpty)! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:01:02'!
test14LogCheckingPositionAndHeadingLogsHeadingChange
	| marsRover headAndPositonLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headAndPositonLog := MarsRoverHeadAndPositionLog observing: marsRover.
	
	marsRover rotateLeft.
	
	self assert:(headAndPositonLog log) equals:(OrderedCollection with:#west)! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:01:53'!
test15LogCheckingPositionAndHeadingLogsPositionChange
	| marsRover headAndPositonLog |
	marsRover := MarsRover at:1@2  heading:(self north).
	headAndPositonLog := MarsRoverHeadAndPositionLog observing: marsRover.
	
	marsRover moveBackward.
	
	self assert:(headAndPositonLog log) equals:(OrderedCollection with:1@1)! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:03:56'!
test16LogCheckingPositionAndHeadingLogsPositionAndHeadingChangeSimultaniusly
	| marsRover headAndPositonLog expected |
	marsRover := MarsRover at:1@2  heading:(self north).
	headAndPositonLog := MarsRoverHeadAndPositionLog observing: marsRover.
	
	marsRover process: 'ffblrr'.
	expected := OrderedCollection new.
	expected add:1@3;add:1@4;add:1@3;add:#west;add:#north;add:#east;yourself.
	self assert:(headAndPositonLog log) equals:(expected)! !


!classDefinition: #MarsRoverTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRoverWindowTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:31:36'!
test01MarsRoverWindowCheckingPositionStartsShowingNothing
	
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverPositionWindow observing: marsRover.
	
	self assert: window position equals: window uninitialized.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:33:12'!
test02MarsRoverWindowUpdatesWhenMarsRoverMoves
	
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverPositionWindow observing: marsRover.
	
	marsRover moveForward.
	
	self assert: window position equals: 1@3.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:41:13'!
test03MarsRoverWindowUpdatesWhenMarsRoverMovesManyTimes
	
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverPositionWindow observing: marsRover.
	
	marsRover moveForward.
	marsRover moveForward.

	
	self assert: window position equals: 1@4.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:43:48'!
test04MarsRoverWindowDoesnotChangeWhenMarsRoverRotates
	
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverPositionWindow observing: marsRover.
	
	marsRover process: 'rl'.

	
	self assert: window position equals:window uninitialized.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:44:50'!
test05MarsRoverWindowCheckingHeadStartsShowingNothing
	
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverHeadWindow observing: marsRover.
	
	self assert: window heading equals: window uninitialized.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:46:21'!
test06MarsRoverWindowCheckingHeadUpdatesHeadingWhenRotating
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverHeadWindow observing: marsRover.
	
	marsRover rotateLeft.
	
	self assert: window heading equals: #west.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:47:48'!
test07MarsRoverWindowCheckingHeadUpdatesHeadingWhenRotatingManyTimes
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverHeadWindow observing: marsRover.
	
	marsRover process: 'lrll'.
	
	self assert: window heading equals: #south.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:48:47'!
test08MarsRoverWindowCheckingHeadIgnoresWhenMarsRoverMoves
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverHeadWindow observing: marsRover.
	
	marsRover process: 'lrlfffbbbfl'.
	
	self assert: window heading equals: #south.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:50:35'!
test09MarsRoverWindowCheckingHeadAndPositionIsUnitinializedWhenStill
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverHeadAndPositionWindow observing: marsRover.
	
	self assert: window heading equals: window uninitialized.
	self assert:window position equals: window uninitialized.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:53:37'!
test10MarsRoverWindowCheckingHeadAndPositionUpdatesJustPositionWhenMoving
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverHeadAndPositionWindow observing: marsRover.
	
	marsRover process: 'ffb'.
	
	self assert: window heading equals: window uninitialized.
	self assert:window position equals: 1@3.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:54:33'!
test11MarsRoverWindowCheckingHeadAndPositionUpdatesJustHeadingWhenRotating
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverHeadAndPositionWindow observing: marsRover.
	
	marsRover process: 'rrlr'.
	
	self assert: window heading equals: #south.
	self assert:window position equals:window uninitialized.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:55:37'!
test12MarsRoverWindowCheckingHeadAndPositionUpdatesPositionAndHeadingWhenMovingAndRotating
	| marsRover window |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverHeadAndPositionWindow observing: marsRover.
	
	marsRover process: 'rrffl'.
	
	self assert: window heading equals: #east.
	self assert:window position equals:1@0.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 21:02:26'!
test13MarsRoverWithManyObserversKeepsEveryObserverUpdatedWhenProcessing
	| marsRover window log expectedLog |
	marsRover := MarsRover at:1@2  heading:MarsRoverHeadingNorth.
	window := MarsRoverHeadAndPositionWindow observing: marsRover.
	log := MarsRoverHeadAndPositionLog observing: marsRover.
	
	marsRover process: 'rrffl'.
	expectedLog := OrderedCollection new.
	expectedLog add:#east;add:#south;add:1@1;add:1@0;add:#east;yourself.
	
	self assert: window heading equals: #east.
	self assert:window position equals:1@0.
	
	self assert: log log equals: expectedLog.! !


!classDefinition: #MarsRover category: #'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'jd 11/13/2024 19:12:15'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self.
	observers := OrderedCollection new.! !


!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:02'!
headEast
	
	head := MarsRoverHeadingEast for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:12'!
headNorth
	
	head := MarsRoverHeadingNorth for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:17'!
headSouth
	
	head := MarsRoverHeadingSouth for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:24'!
headWest
	
	head := MarsRoverHeadingWest for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'jd 11/13/2024 19:11:38'!
rotateLeft
	
	head rotateLeft.
	self notifyHead.! !

!MarsRover methodsFor: 'heading' stamp: 'jd 11/13/2024 19:11:43'!
rotateRight
	
	head rotateRight.
	self notifyHead.! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'jd 11/13/2024 19:12:26'!
moveBackward
	
	head moveBackward.
	self notifyPosition.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:01'!
moveEast
	
	position := position + (1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'jd 11/13/2024 19:12:31'!
moveForward

	head moveForward.
	self notifyPosition.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:12'!
moveNorth
	
	position := position + (0@1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:34'!
moveSouth
	
	position := position + (0@-1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:32'!
moveWest
	
	position := position + (-1@0)! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'attatching' stamp: 'jd 11/13/2024 19:12:15'!
attatch: positionLog 
	observers add:positionLog.! !


!MarsRover methodsFor: 'getters' stamp: 'jd 11/13/2024 18:44:07'!
heading
	^head heading ! !


!MarsRover methodsFor: 'notifying' stamp: 'jd 11/13/2024 20:35:27'!
notifyPosition
	observers do:[:observer|
		observer updatePosition: position.
		
		]! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:37:36'!
notifyHead
	observers do:[:observer| 
		observer updateHead: head.
		]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'jd 11/13/2024 17:21:56'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: #'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'jd 11/13/2024 18:42:20'!
heading

	self subclassResponsibility! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: #'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'jd 11/13/2024 18:42:30'!
heading
	^#east! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!classDefinition: #MarsRoverHeadingNorth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'jd 11/13/2024 18:42:38'!
heading
	^#north! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!classDefinition: #MarsRoverHeadingSouth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'jd 11/13/2024 18:42:47'!
heading
	^#south! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!classDefinition: #MarsRoverHeadingWest category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'jd 11/13/2024 18:43:05'!
heading
	^#west! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!classDefinition: #MarsRoverObserver category: #'MarsRover-WithHeading'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverObserver class' category: #'MarsRover-WithHeading'!
MarsRoverObserver class
	instanceVariableNames: ''!

!MarsRoverObserver class methodsFor: 'instance creation' stamp: 'jd 11/13/2024 20:08:47'!
observing: aMarsRover 
	^self new initializeObserving: aMarsRover ! !


!classDefinition: #MarsRoverLog category: #'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverLog
	instanceVariableNames: 'log marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLog methodsFor: 'testing' stamp: 'jd 11/13/2024 18:30:01'!
includes: aPosition 
	^log  includes: aPosition ! !

!MarsRoverLog methodsFor: 'testing' stamp: 'jd 11/13/2024 18:29:45'!
isEmpty
	^log isEmpty ! !

!MarsRoverLog methodsFor: 'testing' stamp: 'jd 11/13/2024 18:29:26'!
log
	^log! !


!MarsRoverLog methodsFor: 'initialization' stamp: 'jd 11/13/2024 18:30:11'!
initializeObserving: aMarsRover 
	marsRover := aMarsRover.
	marsRover attatch: self.
	log := OrderedCollection new.! !


!MarsRoverLog methodsFor: 'updating' stamp: 'jd 11/13/2024 20:37:36'!
updateHead: aHeading
	log add: marsRover heading.! !


!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:36:00'!
updatePosition: aPosition
	log add: aPosition! !


!classDefinition: #MarsRoverHeadAndPositionLog category: #'MarsRover-WithHeading'!
MarsRoverLog subclass: #MarsRoverHeadAndPositionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!


!classDefinition: #MarsRoverHeadLog category: #'MarsRover-WithHeading'!
MarsRoverLog subclass: #MarsRoverHeadLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadLog methodsFor: 'updating' stamp: 'jd 11/13/2024 20:35:27'!
updatePosition: aPosition
! !


!classDefinition: #MarsRoverPositionLog category: #'MarsRover-WithHeading'!
MarsRoverLog subclass: #MarsRoverPositionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!


!MarsRoverPositionLog methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:37:36'!
updateHead: aHeading
! !


!classDefinition: #MarsRoverWindow category: #'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverWindow
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:24:03'!
initializeAttributes

	self subclassResponsibility! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:23:43'!
initializeObserving: aMarsRover 
	marsRover := aMarsRover.
	marsRover attatch: self.
	self initializeAttributes.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:25:16'!
uninitialized
	^#uninitialized.! !


!classDefinition: #MarsRoverHeadAndPositionWindow category: #'MarsRover-WithHeading'!
MarsRoverWindow subclass: #MarsRoverHeadAndPositionWindow
	instanceVariableNames: 'heading position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadAndPositionWindow methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:25:36'!
initializeAttributes
	position := self uninitialized.
	heading := self uninitialized.! !


!MarsRoverHeadAndPositionWindow methodsFor: 'updating' stamp: 'jd 11/13/2024 20:53:29'!
updateHead: aHeading 
	heading := aHeading heading.! !

!MarsRoverHeadAndPositionWindow methodsFor: 'updating' stamp: 'jd 11/13/2024 20:53:06'!
updatePosition: aPosition
	position := aPosition ! !


!MarsRoverHeadAndPositionWindow methodsFor: 'accessing' stamp: 'jd 11/13/2024 20:50:51'!
heading
	^heading! !

!MarsRoverHeadAndPositionWindow methodsFor: 'accessing' stamp: 'jd 11/13/2024 20:51:11'!
position
	^position! !


!classDefinition: #MarsRoverHeadWindow category: #'MarsRover-WithHeading'!
MarsRoverWindow subclass: #MarsRoverHeadWindow
	instanceVariableNames: 'heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadWindow methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:25:59'!
initializeAttributes
	heading := self uninitialized! !


!MarsRoverHeadWindow methodsFor: 'accessing' stamp: 'jd 11/13/2024 20:45:08'!
heading
	^heading! !


!MarsRoverHeadWindow methodsFor: 'updating' stamp: 'jd 11/13/2024 20:46:47'!
updateHead: aHeading 
	heading := aHeading heading.! !

!MarsRoverHeadWindow methodsFor: 'updating' stamp: 'jd 11/13/2024 20:48:37'!
updatePosition: aPosition
! !


!classDefinition: #MarsRoverPositionWindow category: #'MarsRover-WithHeading'!
MarsRoverWindow subclass: #MarsRoverPositionWindow
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionWindow methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:26:29'!
initializeAttributes
	position := self uninitialized.! !

!MarsRoverPositionWindow methodsFor: 'as yet unclassified' stamp: 'jd 11/13/2024 20:31:10'!
position
	^position ! !


!MarsRoverPositionWindow methodsFor: 'updating' stamp: 'jd 11/13/2024 20:43:13'!
updateHead: aHeading
! !

!MarsRoverPositionWindow methodsFor: 'updating' stamp: 'jd 11/13/2024 20:38:43'!
updatePosition: aPosition
	position := aPosition ! !
