!classDefinition: #FloorTest category: #'ISW1-2024-1C-Parcial'!
TestCase subclass: #FloorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!FloorTest methodsFor: 'testing' stamp: 'jd 9/24/2024 21:01:05'!
test01CannotCreateFloorWithoutRooms

	self
		should: [ Floor createFloorWith: 0 and: self defaultPriceList ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Floor numberOfRoomsMustBePositiveErrorDescription ! !

!FloorTest methodsFor: 'testing' stamp: 'jd 9/24/2024 21:06:47'!
test02CannotCreateFloorWithNoIntergerNumberOfRooms

	self
		should: [ Floor createFloorWith: 1.5 and: self defaultPriceList ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Floor numberOfRoomsMustBeIntegerErrorDescription ! !

!FloorTest methodsFor: 'testing' stamp: 'jd 9/24/2024 21:07:29'!
test03CannotCreateFloorWithoutPrices

	self
		should: [ Floor createFloorWith: 10 and:  Dictionary new ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Floor pricesListCannotBeEmptyErrorDescription ! !

!FloorTest methodsFor: 'testing' stamp: 'jd 9/24/2024 21:06:59'!
test04WhenAFloorIsCreatedAllTheRoomsAreAvailable

	| floor |
	
	floor := Floor createFloorWith: 10 and: self defaultPriceList.
	
	self assert: floor isAvailable.
	self assert: 0 equals: floor totalRoomsOccupied.
	self assert: 0 equals: floor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'jd 9/24/2024 21:07:04'!
test05WhenAFloorReceivesAGuestInARoomReducesTheAvailableRoomsByOneAndIncreaseOccupiedByOne

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := Floor createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) receive: self guestTypeVacation.
	
	self assert: roomsNumber - 1 equals: floor totalRoomsAvailable. 
	self assert: 1 equals: floor totalRoomsOccupied.
	self assert: 0 equals: floor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'jd 9/24/2024 21:07:06'!
test06WhenAFloorReceivesOnReservationAGuestInARoomKeepsTheAvailableRoomsAndOccupiedAndReducesTheReservedByOne

	| floor roomsNumber roomsAvailable roomsOccupied roomsReserved |
	
	roomsNumber := 10.
	floor := Floor createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) reserve.

	roomsAvailable := floor totalRoomsAvailable.
	roomsOccupied := floor totalRoomsOccupied.
	roomsReserved := floor totalRoomsReserved.

	"Tech Debt"
	((floor rooms) at: 1) receiveWithReservation: self guestTypeVacation.
	
	self assert: roomsAvailable equals: floor totalRoomsAvailable. 
	self assert: roomsOccupied equals: floor totalRoomsOccupied.
	self assert: roomsReserved - 1 equals: floor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'jd 9/24/2024 21:07:09'!
test07WhenARoomIsReservedTheFloorAvailableRoomsReducesByOneAndIncreaseReservedAndOccupiedByOne

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := Floor createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) reserve.
	
	self assert: roomsNumber - 1 equals: floor totalRoomsAvailable. 
	self assert: 1 equals: floor totalRoomsOccupied.
	self assert: 1 equals: floor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'jd 9/24/2024 21:07:13'!
test08TotalProfitShouldBeTheSumOfOccupiedRoomsProfits

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := Floor createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) receive: self guestTypeVacation.
	((floor rooms) at: 2) receive: self guestTypeConference.
	((floor rooms) at: 3) reserve.
		
	self assert: (100*peso) + (200*peso) + (50*peso) equals: floor totalProfits
! !

!FloorTest methodsFor: 'testing' stamp: 'jd 9/24/2024 21:07:17'!
test09TotalLossesShouldBeTheSumOfAvailableRoomsLosses

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := Floor createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) receive: self guestTypeVacation.
	((floor rooms) at: 2) receive: self guestTypeConference.
	((floor rooms) at: 3) reserve.
		
	self assert: (200*peso) * 7 equals: floor totalLosses
! !


!FloorTest methodsFor: 'create' stamp: 'FRT 4/21/2024 17:01:23'!
defaultPriceList
	
	^ Dictionary new
		at: self guestTypeVacation put: 100*peso;
		at: self guestTypeConference put: 200*peso;
		yourself ! !

!FloorTest methodsFor: 'create' stamp: 'FRT 4/21/2024 17:00:09'!
guestTypeConference
	
	^ #conferenceGuest! !

!FloorTest methodsFor: 'create' stamp: 'FRT 4/21/2024 17:00:42'!
guestTypeVacation
	
	^ #vacationGuest! !


!classDefinition: #HotelTest category: #'ISW1-2024-1C-Parcial'!
TestCase subclass: #HotelTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:16:52'!
test01CannotCreateHotelWithoutFloors

	self
		should: [ Hotel new setFloors: OrderedCollection new. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Hotel noFloorsErrorDescription.! !

!HotelTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 11:30:09'!
test02NewHotelsAreEmpty

	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel isEmpty.! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:18:22'!
test03HotelCanReceiveATypeOfGuestInRoomAtFloor

	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 2.

	self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
	self assert: 0 equals: hotel totalRoomsReserved.
	self assert: 1 equals: hotel totalRoomsOccupied.
! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:18:32'!
test04HotelCanTakeAReservationForARoomAtFloor

	| hotel |
	
	hotel := self createHotel.

	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	hotel reserveRoom: 2 atFloor: 1.

	self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
	self assert: 1 equals: hotel totalRoomsReserved.
	self assert: 1 equals: hotel totalRoomsOccupied.! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:18:41'!
test05HotelCanReceiveWithReservationATypeOfGuestInRoomAtFloor

	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	hotel reserveRoom: 2 atFloor: 1.
	hotel receiveWithReservation: self guestTypeVacation atFloor: 1 atRoom: 2.

	self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
	self assert: 0 equals: hotel totalRoomsReserved.
	self assert: 1 equals: hotel totalRoomsOccupied.
! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:17:34'!
test06HotelCannotReceiveWithReservationWithoutPreviousReservation
	
	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	self 
		should: [ 	hotel receiveWithReservation: self guestTypeVacation atFloor: 1 atRoom: 2. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [		:error |	
			self assert: Room roomIsNotReservedErrorDescription equals: error messageText.
			
			self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
			self assert: 0 equals: hotel totalRoomsReserved.
			self assert: 0 equals: hotel totalRoomsOccupied.
		]


! !

!HotelTest methodsFor: 'testing' stamp: 'jd 9/25/2024 17:42:07'!
test07HotelProfitsAreTheSumOfEachFloorProfits
	
	| hotel floor1 floor2 floors |
	
	
	floor1 := Floor createFloorWith: 10 and: self defaultPriceList.
	floor2 := Floor createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1 with: floor2.
	hotel := 	Hotel createHotelWithFloors: floors.
	
	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 1.
	hotel receive: self guestTypeConference atFloor: 2 atRoom: 1.

	self assert: floor1 totalProfits + floor2 totalProfits equals:		hotel totalProfits.! !

!HotelTest methodsFor: 'testing' stamp: 'jd 9/25/2024 17:42:17'!
test08HotelLossesAreTheSumOfEachFloorLosses
	
	| hotel floor1 floor2 floors |
	
	
	floor1 := Floor createFloorWith: 10 and: self defaultPriceList.
	floor2 := Floor createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1 with: floor2.
	hotel := 	Hotel createHotelWithFloors: floors.
	
	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 1.
	hotel receive: self guestTypeConference atFloor: 2 atRoom: 1.

	hotel reserveRoom: 4 atFloor: 1.
	hotel reserveRoom: 2 atFloor: 2.

	self assert: floor1 totalLosses + floor2 totalLosses equals:		hotel totalLosses.! !

!HotelTest methodsFor: 'testing' stamp: 'jd 9/25/2024 17:42:21'!
test09HotelCannotReserveANonexistentRoom
	
	| hotel floor1 floors |
	
	floor1 := Floor createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel createHotelWithFloors: floors.
	
	self 
	should: [ 	hotel reserveRoom: 42 atFloor: 1. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel roomNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]
! !

!HotelTest methodsFor: 'testing' stamp: 'jd 9/25/2024 17:42:23'!
test10HotelCannotReserveANonexistentFloor
	
	| hotel floor1 floors |
	
	floor1 := Floor createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel new setFloors: floors.
	
	self 
	should: [ 	hotel reserveRoom: 1 atFloor: 42. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel floorNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]! !

!HotelTest methodsFor: 'testing' stamp: 'jd 9/25/2024 17:42:27'!
test11HotelCannotReceiveAtNonexistentRoom
	
	| hotel floor1 floors |
	
	floor1 := Floor createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel new setFloors: floors.
	
	self 
	should: [ 	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 42. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel roomNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]! !

!HotelTest methodsFor: 'testing' stamp: 'jd 9/25/2024 17:42:31'!
test12HotelCannotReceiveAtNonexistentFloor
	
	| hotel floor1 floors |
	
	floor1 := Floor createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel new setFloors: floors.
	
	self 
	should: [ 	hotel receive: self guestTypeVacation atFloor: 42 atRoom: 1. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel floorNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]! !

!HotelTest methodsFor: 'testing' stamp: 'jd 9/25/2024 17:42:34'!
test13HotelCannotReceiveWithReservationAtNonexistentRoom
	
	| hotel floor1 floors |
	
	floor1 := Floor createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel new setFloors: floors.

	hotel reserveRoom: 1 atFloor: 1. 
	
	self 
	should: [ 	hotel receiveWithReservation: self guestTypeVacation atFloor: 1 atRoom: 42. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel roomNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
		self assert: 1 equals: hotel totalRoomsReserved.
		self assert: 1 equals: hotel totalRoomsOccupied.
	]! !


!HotelTest methodsFor: 'create' stamp: 'jd 9/25/2024 17:43:06'!
createHotel

	^ Hotel new 
		      setFloors: (OrderedCollection with: (Floor createFloorWith: 10 and: self defaultPriceList)
								      	 with: (Floor createFloorWith: 1 and: self defaultPriceList)).
								! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:22'!
defaultPriceList
	
	^ Dictionary new
		at: self guestTypeVacation put: self minPriceInList;
		at: self guestTypeConference put: self maxPriceInList;
		yourself ! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:36'!
guestTypeConference
	
	^ #conferenceGuest! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:42'!
guestTypeVacation
	
	^ #vacationGuest! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:48'!
maxPriceInList
	
	^ 200*peso ! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:53'!
minPriceInList
	
	^ 100*peso ! !


!classDefinition: #RoomTest category: #'ISW1-2024-1C-Parcial'!
TestCase subclass: #RoomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/21/2024 22:11:08'!
test01NewRoomsAreAvailable

	| room |
	
	room := Room new.

	self assert: room isAvailable.
	
	self deny: room isOccupied.
	self deny: room isReserved.! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 09:03:07'!
test02ReceivingAGuestMakesTheRoomOccupied

	| room |
	
	room := Room new.

	room receive: self guestTypeVacation.

	self assert: room isOccupied.

	self deny: room isAvailable.
	self deny: room isReserved.! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 09:04:16'!
test03ReservingARoomMakesTheRoomReservedAndOccupied

	| room |
	
	room := Room new.

	room reserve.

	self assert: room isReserved.
	self assert: room isOccupied.

	self deny: room isAvailable.
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 17:30:25'!
test04CannotReceiveAGuestInAOccupiedRoom

	| room |
	
	room := Room new.

	room receive: self guestTypeVacation.
	
	self 
		should: [ room receive: self guestTypeVacation ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotEmptyErrorDescription equals: error messageText.

			self assert: room isOccupied.
			
			self deny: room isAvailable.
			self deny: room isReserved.
		]
	
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 17:30:32'!
test05CannotReceiveAGuestInAReservedRoom

	| room |
	
	room := Room new.

	room reserve.
	
	self 
		should: [ room receive: self guestTypeVacation ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotEmptyErrorDescription equals: error messageText.
			
			self assert: room isReserved.
			self assert: room isOccupied.
			
			self deny: room isAvailable.
		]

	

	
! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 11:58:29'!
test06ReceivingOnReservationMakesTheRoomOccupied

	| room |
	
	room := Room new.

	room reserve.
	
	room receiveWithReservation: self guestTypeVacation.
	
	self assert: room isOccupied.
	
	self deny: room isReserved.
	self deny: room isAvailable.
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 17:30:40'!
test07CannotReceiveOnReservationAnAvailableRoom

	| room |
	
	room := Room new.

	self 
		should: [ room receiveWithReservation: self guestTypeVacation. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotReservedErrorDescription equals: error messageText.

			self assert: room isAvailable.

			self deny: room isReserved.
			self deny: room isOccupied.
		]

	
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 17:30:50'!
test08CannotReceiveOnReservationAnOccupiedRoom

	| room |
	
	room := Room new.

	room receive: self guestTypeVacation.

	self 
		should: [ room receiveWithReservation: self guestTypeVacation. ] 
		raise: Error - MessageNotUnderstood 	
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotReservedErrorDescription equals: error messageText.
			
			self assert: room isOccupied.

			self deny: room isReserved.
			self deny: room isAvailable.
		]

	
! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 09:22:02'!
test09ProfitOfAvailableRoomIsCeroPesos

	| room |
	
	room := Room new.

	self assert: 0*peso equals: (room profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
	
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:22:57'!
test10ProfitOfReservedRoomIsHalfTheMinPriceInList

	| room |
	
	room := Room new.

	room reserve.

	self assert: self minPriceInList / 2 equals: (room profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 09:45:00'!
test11ProfitOfOccupiedRoomDependsOnGuestType

	| roomWithConferenceGuest roomWithVacationGuest |
	
	roomWithConferenceGuest := Room new.
	roomWithConferenceGuest receive: self guestTypeConference.
	
	roomWithVacationGuest := Room new.
	roomWithVacationGuest receive: self guestTypeVacation.

	self assert: (self defaultPriceList at: self guestTypeConference) 
		equals: (roomWithConferenceGuest profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).

	self assert: (self defaultPriceList at: self guestTypeVacation) 
		equals: (roomWithVacationGuest profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
! !

!RoomTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 09:52:21'!
test12NoProfitOnOccupiedRoomByUnknownGuestType

	| room |
	
	room := Room new.
	room receive: #unknownGuest.
	
	room profitUsing: self defaultPriceList ifAbsentGuestType: [ ^self ].
	
	"we should not get here"
	self failWith: 'should not calculate profit on room occupied by unknown guest type'.
! !

!RoomTest methodsFor: 'testing' stamp: 'jd 9/25/2024 16:41:54'!
test13LossesOfAvailableRoomIsTheMaxPriceInList
		| room |
	
		room := Room new.

		self assert: self maxPriceInList equals: (room lossUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
! !

!RoomTest methodsFor: 'testing' stamp: 'jd 9/25/2024 16:42:00'!
test14LossesOfReservedRoomIsCeroPesos
		| room |
	
		room := Room new.

		room reserve.

		self assert: 0*peso equals: (room lossUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
	
! !

!RoomTest methodsFor: 'testing' stamp: 'jd 9/25/2024 16:42:27'!
test15LossesOfOccupiedRoomIsCeroPesos
		| room |
		
		room := Room new.

		room receive: self guestTypeVacation.

		self assert: 0*peso equals: (room lossUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
	! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/28/2024 15:53:31'!
test16CannotReserveWhenReserved

	| room |
	
	room := Room new.

	room reserve.

	self 
		should: [ room reserve ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Room roomIsNotEmptyErrorDescription equals: anError messageText.
			self assert: room isReserved ].! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/28/2024 15:53:48'!
test17CannotReserveWhenOccupied

	| room |
	
	room := Room new.

	room receive: self guestTypeVacation.

	self 
		should: [ room reserve ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Room roomIsNotEmptyErrorDescription equals: anError messageText.
			self assert: room isOccupied ].! !


!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:16:28'!
defaultPriceList
	
	^ Dictionary new
		at: self guestTypeVacation put: self minPriceInList;
		at: self guestTypeConference put: self maxPriceInList;
		yourself ! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 09:20:45'!
guestTypeConference
	
	^ #conferenceGuest! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 09:02:15'!
guestTypeVacation
	
	^ #vacationGuest! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:16:13'!
maxPriceInList
	
	^ 200*peso ! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 09:40:38'!
minPriceInList
	
	^ 100*peso ! !


!classDefinition: #Floor category: #'ISW1-2024-1C-Parcial'!
Object subclass: #Floor
	instanceVariableNames: 'rooms prices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Floor methodsFor: 'testing' stamp: 'FRT 4/21/2024 15:02:31'!
isAvailable
	
	^ self totalRooms = self totalRoomsAvailable

		
! !


!Floor methodsFor: 'accessing' stamp: 'jd 9/25/2024 16:23:35'!
getRoom:aRoomNumber

	^self rooms at: aRoomNumber ifAbsent: [ Hotel signalRoomNumberDoesNotExist ].! !

!Floor methodsFor: 'accessing' stamp: 'jd 9/25/2024 16:15:54'!
rooms
	^ rooms! !


!Floor methodsFor: 'accounting' stamp: 'jd 9/25/2024 17:07:19'!
totalLosses
	^rooms sum: [ :room | room lossUsing: prices ifAbsentGuestType:  [ self class signalUnknownGuestType ].]    ! !

!Floor methodsFor: 'accounting' stamp: 'jd 9/25/2024 17:10:41'!
totalProfits
	^rooms sum: [:aRoom| aRoom profitUsing: prices ifAbsentGuestType:[ self class signalUnknownGuestType ]. ]
! !



!Floor methodsFor: 'totals' stamp: 'FRT 4/21/2024 14:49:55'!
totalRooms
	
	^ rooms size
		
! !

!Floor methodsFor: 'totals' stamp: 'HAW 4/28/2024 16:49:36'!
totalRoomsAvailable
	
	^rooms count: [ :room | room isAvailable ]
		
! !

!Floor methodsFor: 'totals' stamp: 'HAW 4/28/2024 16:49:47'!
totalRoomsOccupied
	
	^rooms count: [ :room | room isOccupied ]
		
! !

!Floor methodsFor: 'totals' stamp: 'HAW 4/28/2024 16:50:07'!
totalRoomsReserved
	
	^rooms count: [ :room | room isReserved ]! !


!Floor methodsFor: 'initialization' stamp: 'jd 9/25/2024 17:34:44'!
initalizeWith:aNumberOfRooms and:aPriceList
	self initializeWith: aPriceList.
	self initializeRoomsWith: aNumberOfRooms .! !

!Floor methodsFor: 'initialization' stamp: 'jd 9/25/2024 17:34:05'!
initializeRoomsWith: aNumberOfRooms
	rooms := OrderedCollection new.
	aNumberOfRooms timesRepeat: [		rooms add: Room new.]

! !

!Floor methodsFor: 'initialization' stamp: 'FRT 4/21/2024 00:23:52'!
initializeWith: aPriceList

	prices := aPriceList! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Floor class' category: #'ISW1-2024-1C-Parcial'!
Floor class
	instanceVariableNames: ''!

!Floor class methodsFor: 'assertions' stamp: 'FRT 4/20/2024 19:39:26'!
assertIsInteger: aNumber ifFalse: signalsBlock

	aNumber isInteger ifFalse: signalsBlock! !

!Floor class methodsFor: 'assertions' stamp: 'FRT 4/20/2024 19:40:06'!
assertIsPositive: aNumber ifFalse: signalsBlock

	aNumber strictlyPositive ifFalse: signalsBlock! !


!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:02:53'!
numberOfRoomsMustBeIntegerErrorDescription
	
	^ 'Number of rooms must be integer'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:35:54'!
numberOfRoomsMustBePositiveErrorDescription
	
	^'The number of rooms must be positive'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:42:12'!
priceMustBeIntegerErrorDescription
	
	^ 'Price must be integer'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:42:25'!
priceMustBePositiveErrorDescription
	
	^'Price must be positive'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/21/2024 14:43:01'!
pricesListCannotBeEmptyErrorDescription 
	
	^ 'Prices List must not be empty'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/21/2024 14:47:30'!
unknownGuestTypeErrorDescription
	
	^ 'The guest type is unknown'! !


!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/21/2024 14:42:33'!
signalNoPrices
	
	self error: self pricesListCannotBeEmptyErrorDescription ! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:02:35'!
signalNumberOfRoomsMustBeInteger
	
	self error: self numberOfRoomsMustBeIntegerErrorDescription ! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:35:54'!
signalNumberOfRoomsMustBePositive

	self error: self numberOfRoomsMustBePositiveErrorDescription! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:41:37'!
signalPriceMustBeInteger
	
	self error: self priceMustBeIntegerErrorDescription ! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:41:58'!
signalPriceMustBePositive

	self error: self priceMustBePositiveErrorDescription! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/21/2024 14:48:09'!
signalUnknownGuestType

	self error: self class unknownGuestTypeErrorDescription
! !


!Floor class methodsFor: 'creation' stamp: 'jd 9/24/2024 21:01:38'!
assertNumberOfRooms: aNumberOfRooms

	self  assertIsPositive: aNumberOfRooms ifFalse: [ self  signalNumberOfRoomsMustBePositive ].
	self  assertIsInteger: aNumberOfRooms ifFalse: [ self  signalNumberOfRoomsMustBeInteger ].! !

!Floor class methodsFor: 'creation' stamp: 'jd 9/24/2024 21:01:30'!
assertPrices: aPriceList

	aPriceList isEmpty ifTrue: [ self  signalNoPrices ].
	
	aPriceList values do: [ :price | 
		self assertIsPositive: price ifFalse: [ self  signalPriceMustBePositive ].
	].! !

!Floor class methodsFor: 'creation' stamp: 'jd 9/24/2024 20:59:46'!
createFloorWith: aNumberOfRooms and: aPrice
	self assertPrices: aPrice.
	self assertNumberOfRooms: aNumberOfRooms .
	
	^self new  initalizeWith:aNumberOfRooms and:aPrice.! !


!classDefinition: #Hotel category: #'ISW1-2024-1C-Parcial'!
Object subclass: #Hotel
	instanceVariableNames: 'floors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Hotel methodsFor: 'accounting' stamp: 'jd 9/25/2024 17:08:01'!
totalLosses
	^floors sum: [:aFloor | aFloor totalLosses].
! !

!Hotel methodsFor: 'accounting' stamp: 'jd 9/25/2024 17:08:42'!
totalProfits
	^floors sum: [:aFloor| aFloor totalProfits ].
! !


!Hotel methodsFor: 'initialization' stamp: 'jd 9/25/2024 17:35:12'!
initialize
! !

!Hotel methodsFor: 'initialization' stamp: 'jd 9/25/2024 17:35:22'!
initializeWithFloors:aFloors
	floors := aFloors.
! !


!Hotel methodsFor: 'setters' stamp: 'jd 9/25/2024 17:35:42'!
setFloors: aFloorsCollection

	self class assertHaveFloors: aFloorsCollection.

	floors := aFloorsCollection.
	
! !


!Hotel methodsFor: 'totals' stamp: 'jd 9/25/2024 16:36:07'!
totalRooms
	^floors sum: [:floor|floor totalRooms ].
	
! !

!Hotel methodsFor: 'totals' stamp: 'jd 9/25/2024 17:36:05'!
totalRoomsAvailable
	^ self totalRooms - self totalRoomsOccupied 
! !

!Hotel methodsFor: 'totals' stamp: 'jd 9/25/2024 16:37:12'!
totalRoomsOccupied
	^floors sum:[:aFloor| aFloor totalRoomsOccupied ]

! !

!Hotel methodsFor: 'totals' stamp: 'jd 9/25/2024 16:37:50'!
totalRoomsReserved
	^floors sum:[:aFloor| aFloor totalRoomsReserved ]

! !


!Hotel methodsFor: 'testing' stamp: 'jd 9/25/2024 16:26:14'!
isEmpty
	^self totalRoomsAvailable = self totalRooms 

! !


!Hotel methodsFor: 'guests' stamp: 'jd 9/25/2024 17:13:41'!
getFloor: aFloorNumber

	^ floors at: aFloorNumber ifAbsent:  [ self class signalFloorNumberDoesNotExist ]! !

!Hotel methodsFor: 'guests' stamp: 'jd 9/25/2024 17:35:28'!
receive: aGuestType atFloor: aFloorNumber atRoom: aRoomNumber

	| floor room |
	
	floor := self getFloor: aFloorNumber.
	room := floor getRoom:aRoomNumber.
	room receive: aGuestType.
	
! !

!Hotel methodsFor: 'guests' stamp: 'jd 9/25/2024 17:13:41'!
receiveWithReservation: aGuestType atFloor: aFloorNumber atRoom: aRoomNumber

	| floor room |
	
	floor := self getFloor: aFloorNumber.
	room := floor getRoom: aRoomNumber .

	room receiveWithReservation: aGuestType.

! !

!Hotel methodsFor: 'guests' stamp: 'jd 9/25/2024 17:35:39'!
reserveRoom: aRoomNumber atFloor: aFloorNumber

	| floor room |
	
	floor := self getFloor: aFloorNumber.
	room := floor getRoom: aRoomNumber.
	 
	room reserve.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hotel class' category: #'ISW1-2024-1C-Parcial'!
Hotel class
	instanceVariableNames: ''!

!Hotel class methodsFor: 'assertions' stamp: 'jd 9/25/2024 16:23:12'!
assertHaveFloors: aFloorsCollection
	aFloorsCollection isEmpty ifTrue: [ self signalNoFloors ].! !


!Hotel class methodsFor: 'error description' stamp: 'FRT 4/25/2024 21:42:02'!
floorNumberDoesNotExistErrorDescription

	^ 'Floor number does not exist'.! !

!Hotel class methodsFor: 'error description' stamp: 'FRT 4/20/2024 21:42:02'!
noFloorsErrorDescription

	^ 'Cannot have a Hotel without floors'! !

!Hotel class methodsFor: 'error description' stamp: 'FRT 4/25/2024 21:41:41'!
roomNumberDoesNotExistErrorDescription

	^ 'Room number does not exist'.! !


!Hotel class methodsFor: 'exceptions' stamp: 'FRT 4/25/2024 21:42:24'!
signalFloorNumberDoesNotExist

	self error: self floorNumberDoesNotExistErrorDescription.! !

!Hotel class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 21:41:30'!
signalNoFloors

	self error: self noFloorsErrorDescription.! !

!Hotel class methodsFor: 'exceptions' stamp: 'FRT 4/25/2024 21:42:39'!
signalRoomNumberDoesNotExist

	self error: self roomNumberDoesNotExistErrorDescription.! !


!Hotel class methodsFor: 'creation' stamp: 'jd 9/24/2024 21:24:48'!
createHotelWithFloors: floors
	self assertHaveFloors: floors.
	^self new initializeWithFloors:floors.! !


!classDefinition: #Room category: #'ISW1-2024-1C-Parcial'!
Object subclass: #Room
	instanceVariableNames: 'roomStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Room methodsFor: 'guests' stamp: 'jd 9/25/2024 15:45:40'!
receive: aGuestType
	roomStatus receive: aGuestType
	
		! !

!Room methodsFor: 'guests' stamp: 'jd 9/25/2024 16:02:39'!
receiveWithReservation: aGuestType
	roomStatus receiveWithReservation:aGuestType.
	! !

!Room methodsFor: 'guests' stamp: 'jd 9/25/2024 16:02:27'!
reserve
	roomStatus reserve

	
! !


!Room methodsFor: 'testing' stamp: 'jd 9/25/2024 15:04:33'!
isAvailable
	^roomStatus isAvailable. ! !

!Room methodsFor: 'testing' stamp: 'jd 9/25/2024 15:05:27'!
isOccupied
	^roomStatus isOccupied.	 
! !

!Room methodsFor: 'testing' stamp: 'jd 9/25/2024 15:06:45'!
isReserved
	^roomStatus isReserved.! !


!Room methodsFor: 'accounting' stamp: 'jd 9/25/2024 16:51:01'!
lossUsing: aPriceList  ifAbsentGuestType:unknownGuestTypeBlock
	^roomStatus lossUsing: aPriceList ifAbsentGuestType:unknownGuestTypeBlock ! !

!Room methodsFor: 'accounting' stamp: 'jd 9/25/2024 16:48:19'!
maxPriceInList
	^ 200*peso ! !

!Room methodsFor: 'accounting' stamp: 'jd 9/25/2024 16:08:46'!
profitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock
	^roomStatus profitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock.

	
	! !


!Room methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:02:26'!
initialize
	roomStatus := RoomAvailable withRoom:self.! !

!Room methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:29:32'!
updateWithGuest:aGuest andRoomStatus:aStatus
	guest := aGuest.
	roomStatus := aStatus.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Room class' category: #'ISW1-2024-1C-Parcial'!
Room class
	instanceVariableNames: ''!

!Room class methodsFor: 'error messages' stamp: 'FRT 4/22/2024 09:01:14'!
roomIsNotEmptyErrorDescription

	^ 'Room is not empty.'! !

!Room class methodsFor: 'error messages' stamp: 'FRT 4/22/2024 09:01:43'!
roomIsNotReservedErrorDescription

	^ 'Room is not reserved.'! !



!classDefinition: #RoomStatus category: #'ISW1-2024-1C-Parcial'!
Object subclass: #RoomStatus
	instanceVariableNames: 'room'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomStatus methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:03:09'!
initializeWith:aRoom
	room := aRoom.! !

!RoomStatus methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:06:19'!
isAvailable
	self subclassResponsibility.! !

!RoomStatus methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:06:53'!
isReserved
	self subclassResponsibility ! !


!RoomStatus methodsFor: 'nil' stamp: 'jd 9/25/2024 15:06:15'!
isOccupied
	self subclassResponsibility.! !


!RoomStatus methodsFor: 'receiving' stamp: 'jd 9/25/2024 16:09:17'!
profitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock

	self subclassResponsibility! !

!RoomStatus methodsFor: 'receiving' stamp: 'jd 9/25/2024 16:09:25'!
receive: aGuestType

	self subclassResponsibility! !

!RoomStatus methodsFor: 'receiving' stamp: 'jd 9/25/2024 16:09:29'!
receiveWithReservation: aGuestType

	self subclassResponsibility! !

!RoomStatus methodsFor: 'receiving' stamp: 'jd 9/25/2024 16:09:37'!
reserve

	self subclassResponsibility! !


!RoomStatus methodsFor: 'accounting' stamp: 'jd 9/25/2024 16:47:04'!
lossUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoomStatus class' category: #'ISW1-2024-1C-Parcial'!
RoomStatus class
	instanceVariableNames: ''!

!RoomStatus class methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:57:49'!
withRoom:aRoom
	^self new initializeWith:aRoom.

! !


!classDefinition: #RoomAvailable category: #'ISW1-2024-1C-Parcial'!
RoomStatus subclass: #RoomAvailable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomAvailable methodsFor: 'nil' stamp: 'jd 9/25/2024 15:18:10'!
isAvailable
	^true.! !


!RoomAvailable methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:05:35'!
isOccupied
	^false.! !

!RoomAvailable methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:06:58'!
isReserved
	^false! !


!RoomAvailable methodsFor: 'receiving' stamp: 'jd 9/25/2024 21:24:00'!
receive: aGuestType
	^room updateWithGuest:aGuestType andRoomStatus: (RoomOcupied withRoom:room  andGuest:aGuestType ).

! !

!RoomAvailable methodsFor: 'receiving' stamp: 'jd 9/25/2024 15:50:43'!
receiveWithReservation:aGuestType
	^self error: Room roomIsNotReservedErrorDescription.
! !

!RoomAvailable methodsFor: 'receiving' stamp: 'jd 9/25/2024 16:00:57'!
reserve
	room updateWithGuest: nil andRoomStatus: (RoomReserved withRoom: room)! !


!RoomAvailable methodsFor: 'accounting' stamp: 'jd 9/25/2024 17:02:58'!
lossUsing: aPriceList  ifAbsentGuestType:unknownGuestTypeBlock
	|maxPrice|
	maxPrice := aPriceList max.
	^maxPrice ! !

!RoomAvailable methodsFor: 'accounting' stamp: 'jd 9/25/2024 16:04:31'!
profitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock
	^0*peso! !


!classDefinition: #RoomOcupied category: #'ISW1-2024-1C-Parcial'!
RoomStatus subclass: #RoomOcupied
	instanceVariableNames: 'guestType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomOcupied methodsFor: 'nil' stamp: 'jd 9/25/2024 15:04:50'!
isAvailable
	^false! !


!RoomOcupied methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 21:23:23'!
initializeWithRoom:aRoom andGuest: aGuestType
	room := aRoom.
	guestType := aGuestType.! !

!RoomOcupied methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:05:42'!
isOccupied
	^true! !

!RoomOcupied methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:07:06'!
isReserved
	^false! !


!RoomOcupied methodsFor: 'receiving' stamp: 'jd 9/25/2024 15:43:03'!
receive: aGuestType
	^self error: Room roomIsNotEmptyErrorDescription
! !

!RoomOcupied methodsFor: 'receiving' stamp: 'jd 9/25/2024 15:51:05'!
receiveWithReservation:aGuestType
	^self error: Room roomIsNotReservedErrorDescription.! !

!RoomOcupied methodsFor: 'receiving' stamp: 'jd 9/25/2024 15:44:09'!
reserve
	self error: Room roomIsNotEmptyErrorDescription! !


!RoomOcupied methodsFor: 'accounting' stamp: 'jd 9/25/2024 16:49:31'!
lossUsing: aPriceList  ifAbsentGuestType:unknownGuestTypeBlock
	^0*peso! !

!RoomOcupied methodsFor: 'accounting' stamp: 'jd 9/25/2024 21:24:45'!
profitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock
	^aPriceList at:(guestType) ifAbsent: unknownGuestTypeBlock! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoomOcupied class' category: #'ISW1-2024-1C-Parcial'!
RoomOcupied class
	instanceVariableNames: ''!

!RoomOcupied class methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 21:23:02'!
withRoom:aRoom andGuest: aGuestType
	^self new initializeWithRoom:aRoom andGuest: aGuestType.


! !


!classDefinition: #RoomReserved category: #'ISW1-2024-1C-Parcial'!
RoomStatus subclass: #RoomReserved
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomReserved methodsFor: 'nil' stamp: 'jd 9/25/2024 15:05:48'!
isAvailable
	^false! !


!RoomReserved methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:05:52'!
isOccupied
	^true! !

!RoomReserved methodsFor: 'as yet unclassified' stamp: 'jd 9/25/2024 15:17:54'!
isReserved
	^true! !


!RoomReserved methodsFor: 'receiving' stamp: 'jd 9/25/2024 15:42:43'!
receive: aGuestType
	^self error: Room roomIsNotEmptyErrorDescription! !

!RoomReserved methodsFor: 'receiving' stamp: 'jd 9/25/2024 21:24:29'!
receiveWithReservation:aGuestType
	room updateWithGuest:aGuestType  andRoomStatus: (RoomOcupied  withRoom: room andGuest:aGuestType).! !

!RoomReserved methodsFor: 'receiving' stamp: 'jd 9/25/2024 15:45:13'!
reserve
	self error: Room roomIsNotEmptyErrorDescription! !


!RoomReserved methodsFor: 'accounting' stamp: 'jd 9/25/2024 16:49:00'!
lossUsing: aPriceList  ifAbsentGuestType:unknownGuestTypeBlock
	^0 * peso ! !

!RoomReserved methodsFor: 'accounting' stamp: 'jd 9/25/2024 16:05:24'!
profitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock
	^aPriceList values min /2! !
