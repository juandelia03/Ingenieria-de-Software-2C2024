!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 10:32:41'!
test01SentenceFinderShouldReturnEmptyForAnEmptyStack
	|stack finder prefix|
	stack := OOStack new.
	prefix := 'something'.
	finder := SentenceFinderByPrefix new.
	
	self assert: (finder find:prefix  in:stack) = OrderedCollection new.  ! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 11:38:31'!
test02SentenceFinderShouldReturnElementsWithRightPrefix
	|stack finder collectionWithResults|
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	collectionWithResults := OrderedCollection new.
	
	stack push: 'winter is coming'.
	stack push:'The winds of Winter'.
	stack push:'Winter is here'.
	stack push:'Wint'.

	collectionWithResults add: 'Wint'.
	collectionWithResults add: 'Winter is here'.
	self assert: (finder find:'Wint'  in:stack) = collectionWithResults .  ! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 11:47:54'!
test03SentenceFinderShouldPreserveTheStack
	|stack stackCopy finder |
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	
	stack push: 'winter is coming'.
	stack push:'The winds of Winter'.
	stackCopy:= stack copy.
	finder find:'Wint' in:stack.

	self assert: stack size = stackCopy size.
	self assert: stack top = stackCopy top. ! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 13:01:43'!
test04SentenceFinderPrefixCannotBeEmpty
	|stack finder |
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	
	stack push: 'winter is coming'.
	stack push:'The winds of Winter'.

	self
		should: [	finder find:'' in:stack ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'The prefix can not be empty' ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 11:49:38'!
test04SentenceFinderPrefixCannotContainEmptySpaces
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topElement size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:17:10'!
isEmpty
	^topElement isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:17:18'!
pop
	^topElement pop:self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JD 9/18/2024 15:44:54'!
popWhenEmpty
	self error:'stack is empty!!!!!!'! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:29:26'!
popWhenNotEmpty: element withNextElement:next
	topElement := next.
	size := size-1.
	^element.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:29:35'!
push: anElement
	|newTop|
	newTop := StackElement with:anElement andNext: topElement.
	topElement  := newTop.
	size := size+1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:32:51'!
top
	^topElement top:self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JD 9/18/2024 15:53:16'!
topWhenEmpty
	self isEmpty ifTrue:[self error:'stack is empty!!!!!!'].! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:31:41'!
topWhenNotEmpty
	^topElement value! !


!OOStack methodsFor: 'initialization' stamp: 'JD 9/20/2024 12:29:05'!
initialize
	topElement := StackBottom new.
	size := 0.! !


!OOStack methodsFor: 'accessing' stamp: 'JD 9/20/2024 12:29:40'!
size
	^size ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 13:08:53'!
find:aPrefix in:aStack
	| elementsWithPrefix|
	(aPrefix = '') ifTrue: [^self error:'The prefix can not be empty'].
	(aPrefix substrings includes:' ') ifTrue:[^self error:'The prefix can not contain blank spaces'].

	elementsWithPrefix := OrderedCollection new.
	self iterate: aStack executingBlock: 			[:stackElement|
		(aPrefix isPrefixOf:stackElement) ifTrue:[elementsWithPrefix add:stackElement ]
        ]	.
	^elementsWithPrefix 
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 10:19:19'!
iterate:aStack executingBlock:aBlock
	|temporalStack|
	temporalStack := OOStack new.
	self popAllFrom: aStack executing: aBlock  pushingEveryElementIn: temporalStack.
	self popAllFrom: temporalStack executing: [:stackElement|] pushingEveryElementIn: aStack
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 10:15:04'!
popAllFrom:aStack executing:aBlock pushingEveryElementIn:temporalStack
	|stackElement |
	[aStack isEmpty] whileFalse: [
			stackElement := aStack pop.
			aBlock value: stackElement.
			temporalStack push:stackElement.
		].

	! !


!classDefinition: #StackBottom category: #'Stack-Exercise'!
Object subclass: #StackBottom
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBottom methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:16:10'!
isEmpty
	^true! !

!StackBottom methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:35:56'!
pop:aStack
	^aStack popWhenEmpty. ! !

!StackBottom methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:32:35'!
top:aStack
	aStack  topWhenEmpty ! !


!classDefinition: #StackElement category: #'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: 'value nextElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:16:21'!
isEmpty
	^false! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:35:45'!
pop:aStack
	^aStack popWhenNotEmpty:value withNextElement: nextElement .! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:41:27'!
top:aStack
	^aStack  topWhenNotEmpty 
! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:30:11'!
value
	^value! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:26:39'!
withValue:aValue andNext:anElement
	value := aValue.
	nextElement :=anElement .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: #'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'as yet unclassified' stamp: 'JD 9/20/2024 12:26:12'!
with:aValue andNext:anElement
	^StackElement new withValue:aValue andNext:anElement.! !
