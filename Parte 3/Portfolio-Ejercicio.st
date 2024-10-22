!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/18/2024 21:55:41'!
test08PortfolioWithNoAccountsHasZeroAsBalance	
	|portfolio|
	portfolio := Portfolio new.
	self assert: 0 equals: (portfolio balance).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/18/2024 23:33:52'!
test09PortfolioWithOneAccountHasBalanceOfTheAccount
	|portfolio account|
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 on:account.
	portfolio add: account.
	
	self assert: 100 equals: (portfolio balance).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/18/2024 23:33:43'!
test10PortfolioWithMoreThanOneAccountHasTheBalanceOfTheSum
	|portfolio account1 account2|
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.

	Deposit register: 100 on:account1.
	Deposit register: 100 on:account2.

	portfolio add: account1.
	portfolio add: account2.

	
	self assert: 200 equals: (portfolio balance).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/18/2024 23:33:36'!
test11PortfolioWithOnePortfolioHasTheBalanceOfPortfolio
	|portfolio1 portfolio2 account|
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on:account.
	portfolio1 add: account.
	
	
	portfolio2 add:portfolio1.

	
	self assert: 100 equals: (portfolio2 balance).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/18/2024 23:33:26'!
test12PortfolioWithMoreThanOnePortfolioHasTheBalanceOfTheSum
	|portfolio1 portfolio2 portfolio3 account1 account2|
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on:account1.
	Deposit register: 100 on:account2.

	portfolio1 add: account1.	
	portfolio2 add: account2.
	
	portfolio3 add: portfolio1.
	portfolio3 add: portfolio2.
	
	self assert: 200 equals: (portfolio3 balance).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/18/2024 23:33:16'!
test13PortfolioWithPortfoliosAndAccountsAddsThemUp
	|portfolio1 portfolio2 account1 account2|
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on:account1.
	Deposit register: 100 on:account2.
	
	portfolio1 add: account1.	
	
	portfolio2 add: account2.
	portfolio2 add: portfolio1.
	
	
	self assert: 200 equals: (portfolio2 balance).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 11:44:12'!
test14EmptyPortfolioHasNoTransactions
	|portfolio|
	portfolio := Portfolio new.	
	self assert: (portfolio transactions) equals: (OrderedCollection new).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 11:53:14'!
test15PortfolioWithManyAccountsHasEveryTransaction
	|portfolio  account1 account2 transaction1 transaction2| 
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transaction1 := Deposit register: 100 on:account1.
	transaction2 := Deposit register: 100 on:account2.
	
	portfolio add: account1.	
	portfolio add: account2.
	
	self assert:2 equals:(portfolio transactions size).
	self assert: ((portfolio transactions) includes:transaction1).
	self assert: ((portfolio transactions) includes:transaction2)

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 12:03:44'!
test16PortfolioWithPortfoliosHasEveryTransaction
	|portfolio1 portfolio2  account1 account2 transaction1 transaction2| 
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transaction1 := Deposit register: 100 on:account1.
	transaction2 :=Deposit register: 100 on:account2.
	
	portfolio1 add: account1.	
	
	portfolio2 add: account2.
	portfolio2 add: portfolio1.
	
	
	self assert: (portfolio2 transactions size) equals: (2).
	self assert:(portfolio2 transactions includes:transaction1).
	self assert:(portfolio2 transactions includes:transaction2).


! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 12:08:49'!
test17EmptyPortfolioHasNoTransactionRegistered
	|portfolio account transaction|
	portfolio := Portfolio new.	
	account := ReceptiveAccount new.
	transaction := Deposit register: 200 on: account.
	self deny:(portfolio hasRegistered:transaction)! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 12:25:48'!
test18PortfolioKnowItsTransactions
	|portfolio1 portfolio2 account transaction|
	portfolio1 := Portfolio new.	
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	transaction := Deposit register: 200 on: account.
	portfolio2 add:account.
	portfolio1 add:portfolio2.
	
	self assert:(portfolio1 hasRegistered:transaction)! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 20:08:32'!
test19CanNotAddAFinancialEntityThatIsTheFirstLevelOfThePortfolio
	|portfolio  account |
	portfolio := Portfolio new.	
	account := ReceptiveAccount new.
	portfolio add:account.
	self should: [portfolio add:account] raise: Error  withExceptionDo: [:error|
		self assert: error messageText equals: (portfolio canNotAddSignal).
		].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 20:30:17'!
test20CanNotAddAFinancialEntityThatIsOneBottomDepthLevelOfThePortfolio
	|portfolio  portfolio2 portfolio3|
	portfolio := Portfolio new.	
	portfolio2 := Portfolio new.	
	portfolio3 := Portfolio new.	

	portfolio add:portfolio2 .
	portfolio2 add:portfolio3.

	
	self should: [portfolio add:portfolio3] raise: Error  withExceptionDo: [:error|
		self assert: error messageText equals: (portfolio canNotAddSignal).
		].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 20:32:04'!
test21CanNotAddAFinancialEntityThatIsInAnyBottomLevelOfThePortfolio
	|portfolio  portfolio2 portfolio3 account|
	portfolio := Portfolio new.	
	portfolio2 := Portfolio new.	
	portfolio3 := Portfolio new.	
	account := ReceptiveAccount new.

	portfolio add:portfolio2 .
	portfolio2 add:portfolio3.
	portfolio3 add:account.
	
	self should: [portfolio add:account] raise: Error  withExceptionDo: [:error|
		self assert: error messageText equals: (portfolio canNotAddSignal).
		].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 20:46:44'!
test22CanNotAddAPortfolioToItself
	|portfolio|
	portfolio := Portfolio new.	
	
	self should: [portfolio add:portfolio] raise: Error  withExceptionDo: [:error|
		self assert: error messageText equals: (portfolio canNotAddSignal).
		].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 21:16:34'!
test23CanNotAddItsParentToAPortfolio
	|portfolio  portfolio2|
	portfolio := Portfolio new.	
	portfolio2 := Portfolio new.	

	portfolio add:portfolio2.

	
	self should: [portfolio2 add:portfolio] raise: Error  withExceptionDo: [:error|
		self assert: error messageText equals: (portfolio canNotAddParentSignal).
		].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 22:11:20'!
test24CanNotAddItsPredecesorToAPortfolio
	|portfolio  portfolio2 portfolio3|
	portfolio := Portfolio new.	
	portfolio2 := Portfolio new.	
	portfolio3 := Portfolio new.

	portfolio add:portfolio2.
	portfolio2 add:portfolio3.

	self should: [portfolio3 add:portfolio] raise: Error  withExceptionDo: [:error|
		self assert: error messageText equals: (portfolio canNotAddParentSignal).
		].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 22:34:20'!
test25CanNotAddAPortfolioWithSubEntitiesWhichAreAlreadyInThePortfolio
	|portfolio1 portfolio2 account|
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	portfolio1 add:account.
	portfolio2 add:account.
	
	self should: [	portfolio1 add:portfolio2.] raise:Error  withExceptionDo: [:error|
		self assert:(error messageText) equals: (portfolio1 canNotAddSignal).
		]! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/20/2024 22:57:00'!
test26CanNotAddAPortfolioWithPredecesorEntitiesWhichAreAlreadyInThePortfolio
	|portfolio1 portfolio2 portfolio3 account1 account2|
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio1 add:portfolio2.
	portfolio1 add:portfolio3.
	portfolio2 add:account1.
	portfolio3 add:account2.
	
	self should: [	portfolio2 add:account2.] raise:Error  withExceptionDo: [:error|
		self assert:(error messageText) equals: (portfolio1 canNotAddSignal).
		]! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'jd 10/18/2024 12:40:19'!
isDeposit
	^false! !

!AccountTransaction methodsFor: 'value' stamp: 'jd 10/18/2024 12:40:11'!
isWithdraw
	^false! !

!AccountTransaction methodsFor: 'value' stamp: 'jd 10/18/2024 23:25:42'!
value

	^ value! !


!AccountTransaction methodsFor: 'initialization' stamp: 'jd 10/18/2024 23:25:12'!
initializeFor: aValue
	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'jd 10/18/2024 23:28:35'!
register: aValue on: account
	| transaction |
	transaction := self for: aValue.
	account register: transaction.
	^ transaction ! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!


!Deposit methodsFor: 'value' stamp: 'jd 10/18/2024 12:39:11'!
isDeposit
	^true. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'jd 10/18/2024 12:54:30'!
for: aValue
	"chequeo que sea mayor a 0?"
	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!


!Withdraw methodsFor: 'value' stamp: 'jd 10/18/2024 12:39:43'!
isWithdraw
	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'jd 10/18/2024 12:55:21'!
for: aValue
	"chequeo q sea mayor a 0?"
	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialEntity category: #'Portfolio-Ejercicio'!
Object subclass: #FinancialEntity
	instanceVariableNames: 'parentPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialEntity methodsFor: 'transactions' stamp: 'jd 10/18/2024 23:41:50'!
transactions

	self subclassResponsibility! !


!FinancialEntity methodsFor: 'balance' stamp: 'jd 10/18/2024 23:42:00'!
balance

	self subclassResponsibility! !


!FinancialEntity methodsFor: 'testing' stamp: 'jd 10/18/2024 23:42:22'!
hasRegistered: aTransaction

	self subclassResponsibility! !

!FinancialEntity methodsFor: 'testing' stamp: 'jd 10/20/2024 22:22:31'!
parentPortfoliosIncludes: aPortfolio
	"ver si en el nivel de arriba esta portfolio, o si alguno de los de mas arriba lo tiene"
	^(parentPortfolios includes: aPortfolio) or:[
		parentPortfolios anySatisfy:[:portfolio| portfolio parentPortfoliosIncludes:aPortfolio ]
		].! !


!FinancialEntity methodsFor: 'nil' stamp: 'jd 10/20/2024 21:13:39'!
addParentPortfolio: aPortfolio
	parentPortfolios add:aPortfolio.! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
FinancialEntity subclass: #Portfolio
	instanceVariableNames: 'financialEntitys'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'initialize' stamp: 'jd 10/20/2024 21:13:39'!
initialize
	financialEntitys := OrderedCollection new.
	parentPortfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'jd 10/18/2024 23:37:54'!
balance
	^(financialEntitys sum:[:account|account balance] ifEmpty:[0]) ! !


!Portfolio methodsFor: 'adding' stamp: 'jd 10/20/2024 23:26:04'!
add: financialEntity 
	self assertItCanBeAdded: financialEntity.
	self addAndUpdate: financialEntity.! !

!Portfolio methodsFor: 'adding' stamp: 'jd 10/20/2024 23:26:04'!
addAndUpdate: financialEntity

	financialEntitys add: financialEntity.
	financialEntity addParentPortfolio: self! !

!Portfolio methodsFor: 'adding' stamp: 'jd 10/20/2024 23:24:58'!
assertDoesNotContainEntitiesOfAnyParentPortfolio: financialEntity

	^ parentPortfolios do:[:aPortfolio| financialEntity assertDoesNotIncludeAnyFinancialEntityOf: aPortfolio]! !

!Portfolio methodsFor: 'adding' stamp: 'jd 10/20/2024 22:17:58'!
assertFinancialEntityIsNotBottomUpInPortfolio: financialEntity

	^(self parentPortfoliosIncludes:financialEntity ) ifTrue:[self error:(self canNotAddParentSignal)].! !

!Portfolio methodsFor: 'adding' stamp: 'jd 10/20/2024 22:16:52'!
assertFinancialEntityIsNotDeepDownInPortfolio: financialEntity

	^ (self includes: financialEntity) ifTrue: [self error:(self canNotAddSignal)]! !

!Portfolio methodsFor: 'adding' stamp: 'jd 10/20/2024 23:25:12'!
assertItCanBeAdded: financialEntity

	financialEntity assertDoesNotIncludeAnyFinancialEntityOf:self.
	self assertDoesNotContainEntitiesOfAnyParentPortfolio: financialEntity! !

!Portfolio methodsFor: 'adding' stamp: 'jd 10/20/2024 23:26:49'!
assertItIsNotInPortfolioTree: financialEntity
	self assertPortfoliosAreNotEqual: financialEntity.
	self assertFinancialEntityIsNotDeepDownInPortfolio: financialEntity.
	self assertFinancialEntityIsNotBottomUpInPortfolio:financialEntity ! !

!Portfolio methodsFor: 'adding' stamp: 'jd 10/20/2024 23:26:49'!
assertPortfoliosAreNotEqual: financialEntity

	^ self = financialEntity ifTrue:[self error:(self canNotAddSignal)]! !


!Portfolio methodsFor: 'transactions' stamp: 'jd 10/20/2024 11:59:13'!
transactions
	|transactions|
	transactions := OrderedCollection new.
	financialEntitys do:[:aFinancialEntity| transactions addAll: (aFinancialEntity transactions)].
	^transactions.
! !


!Portfolio methodsFor: 'testing' stamp: 'jd 10/20/2024 23:24:58'!
assertDoesNotIncludeAnyFinancialEntityOf: aPortfolio
	aPortfolio assertItIsNotInPortfolioTree: self.
	financialEntitys do: [:aFinancialEnity| aPortfolio assertItIsNotInPortfolioTree:aFinancialEnity ]! !

!Portfolio methodsFor: 'testing' stamp: 'jd 10/20/2024 12:13:30'!
hasRegistered: aTransaction
	^financialEntitys anySatisfy: [:aFinancialEntity| aFinancialEntity hasRegistered:aTransaction ].! !

!Portfolio methodsFor: 'testing' stamp: 'jd 10/20/2024 20:37:51'!
includes:aFinancialEntity
	^(self isInTheFirstLevelOfPortfolio: aFinancialEntity)or:[ self isInThePorfolioInaDeeperLevel: aFinancialEntity].
	! !

!Portfolio methodsFor: 'testing' stamp: 'jd 10/20/2024 20:36:50'!
isInTheFirstLevelOfPortfolio: aFinancialEntity

	^ financialEntitys includes: aFinancialEntity! !

!Portfolio methodsFor: 'testing' stamp: 'jd 10/20/2024 20:37:39'!
isInThePorfolioInaDeeperLevel: aFinancialEntity

	^ financialEntitys anySatisfy: [:financialEntity| 
			financialEntity includes:aFinancialEntity ]! !


!Portfolio methodsFor: 'signals' stamp: 'jd 10/20/2024 21:01:23'!
canNotAddParentSignal

	^'Can not Add a financial entity which contains this this entity'! !

!Portfolio methodsFor: 'signals' stamp: 'jd 10/20/2024 20:45:47'!
canNotAddSignal

	^'Can not Add a financial entity which is already in the portfolio'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
FinancialEntity subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'jd 10/20/2024 21:13:39'!
initialize
	transactions := OrderedCollection new.
	parentPortfolios := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'jd 10/18/2024 12:52:46'!
deposits
	^transactions select:[:transaction|transaction isDeposit].! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'jd 10/18/2024 12:32:52'!
register: aTransaction
	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'jd 10/18/2024 12:32:56'!
transactions 
	^ transactions copy! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'jd 10/18/2024 12:52:58'!
withdrawals
	^transactions select:[:transaction|transaction isWithdraw].! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'jd 10/18/2024 12:59:42'!
balance
	^self depositsTotal - self withdrawalsTotal! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'jd 10/18/2024 12:59:54'!
depositsTotal
	^self subTotalOf: self deposits! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'jd 10/20/2024 20:21:10'!
includes: aFinancialEntity
	"no tiene sentido definirle includes deberia usar un adapter?"
	^false! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'jd 10/18/2024 12:59:54'!
subTotalOf: aCollectionOfTransactions
	^aCollectionOfTransactions sum: [ :aTransaction | aTransaction value ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'jd 10/18/2024 12:59:54'!
withdrawalsTotal
	^self subTotalOf: self withdrawals ! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'jd 10/20/2024 23:24:58'!
assertDoesNotIncludeAnyFinancialEntityOf: aPortfolio
	aPortfolio assertItIsNotInPortfolioTree: self.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'jd 10/18/2024 12:32:42'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction 
! !
