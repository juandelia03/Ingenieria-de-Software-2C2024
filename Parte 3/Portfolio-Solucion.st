!classDefinition: #PortfolioTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 13:03:05'!
test08AddingADepositAddsItToAccountSummary

	| account  accountSummaryEntry balanceEntry sumarizer |
	
	account := ReceptiveAccount new.
	sumarizer := AccountSummarizerReportt for:account. 
	
	Deposit register: 100 on: account.
	
	accountSummaryEntry := sumarizer depositMessage,'100'.
	balanceEntry := 	sumarizer balanceMessage ,'100'.
	
	self assert:(sumarizer accountSummary) equals:(OrderedCollection with: accountSummaryEntry with:balanceEntry).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 13:03:05'!
test09AddingAWithdrawalAddsItToAccountSummary

	| account  accountSummaryEntry balanceEntry sumarizer |
	
	account := ReceptiveAccount new.
	
	Withdraw register: 100 on: account.
	sumarizer := AccountSummarizerReportt for:account. 

	
	accountSummaryEntry := sumarizer  extractionMessage,'100'.
	balanceEntry := sumarizer balanceMessage,'-100'.

	
	self assert:(sumarizer accountSummary) equals:(OrderedCollection with: accountSummaryEntry with:balanceEntry).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 13:03:05'!
test10SendindgATransferenceAddsItToAccountSummary

	| account1 account2 accountSummaryEntry balanceEntry sumarizer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	sumarizer := AccountSummarizerReportt for:account1. 

	
	Transference from: account1 to:account2  value:100 .
	
	accountSummaryEntry := sumarizer extractionLegMessage ,'100'.
	balanceEntry := sumarizer balanceMessage,'-100'.

	
	
	self assert:(sumarizer accountSummary) equals:(OrderedCollection with: accountSummaryEntry with: balanceEntry ).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 13:03:05'!
test11ReceivingATransferenceAddsItToAccountSummary

	| account1 account2 accountSummaryEntry balanceEntry sumarizer  | 
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	sumarizer := AccountSummarizerReportt for:account2. 

	
	
	Transference from: account1 to:account2  value:100 .
	
	accountSummaryEntry := sumarizer depositLegMessage ,'100'.
	balanceEntry := sumarizer balanceMessage,'100'.
	
	self assert:(sumarizer accountSummary) equals:(OrderedCollection with: accountSummaryEntry with:balanceEntry).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 13:03:05'!
test12AccountWithNoMovementsHasZeroBalance

	| account balanceEntry sumarizer |
	
	account := ReceptiveAccount new.
	sumarizer := AccountSummarizerReportt for:account. 
	
	balanceEntry := sumarizer balanceMessage ,'0'.
	


	self assert:(sumarizer accountSummary) equals:(OrderedCollection with:balanceEntry).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 13:03:05'!
test13AccountWithManyTransactionsHaveEveryTransactionInSummary

	| account balanceEntry sumarizer |

	account := ReceptiveAccount new.
	sumarizer := AccountSummarizerReportt for:account. 


	Deposit register: 100 on: account.
	Withdraw register: 100 on: account.
	balanceEntry := sumarizer balanceMessage ,'0'.


	self assert:(sumarizer  accountSummary) equals:
	(OrderedCollection with:sumarizer depositMessage,'100'  with:sumarizer extractionMessage ,'100' with:balanceEntry ).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/31/2024 00:32:23'!
test14AccountWithNoTransfersHasZeroTransferNet

	| account  transferNet |

	account := ReceptiveAccount new.
	transferNet := TransferNetReport for:account. 


	self assert:(transferNet  transferNet ) equals:(0).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/31/2024 00:36:20'!
test15AccountWithDepositsOrWithdrawalsHasZeroTransferNet

	| account  transferNet |

	account := ReceptiveAccount new.
	transferNet := TransferNetReport for:account. 

	Withdraw register:1000  on: account.
	Deposit register: 300 on: account.
	
	self assert:(transferNet  transferNet ) equals:(0).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/31/2024 00:40:33'!
test16AccountWithTransferenceSentHasNegativeTransferNet

	| account account2 transferNet |

	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transferNet := TransferNetReport for:account. 

	Transference from: account to:account2 value: 100.

	
	self assert:(transferNet  transferNet ) equals:(-100).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/31/2024 00:43:55'!
test17AccountWithTransferenceReceivedHasPositiveTransferNet

	| account account2 transferNet |

	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transferNet := TransferNetReport for:account. 

	Transference from: account2 to:account value: 100.

	
	self assert:(transferNet  transferNet ) equals:(100).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/31/2024 00:44:08'!
test18AccountWithManyTransactionsSumEveryTransference

	| account account2 transferNet |

	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transferNet := TransferNetReport for:account. 

	Transference from: account2 to:account value: 100.
	Transference from: account to:account2  value:20. 
	Withdraw register: 100 on:account. 

	
	self assert:(transferNet  transferNet ) equals:(80).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 10/31/2024 12:47:20'!
test19PortfolioGeneratesTransferNet

	|portfolio account account2 account3 transferNet |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	portfolio add: account.
	portfolio add:account2.
	transferNet := TransferNetReport for:portfolio. 

	Transference from:account3  to:account  value: 150.
	Transference from:account3  to:account2  value: 50.

	Withdraw register: 100 on:account. 

	
	self assert:(transferNet  transferNet ) equals:(200).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 13:03:05'!
test20PortfolioGeneratesSummary

	|portfolio account account2 account3 summary expected|
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	portfolio add: account.
	portfolio add:account2.
	summary := AccountSummarizerReportt for:portfolio. 

	Transference from:account3  to:account  value: 150.
	Transference from:account3  to:account2  value: 50.

	Deposit register: 100 on:account. 
	
	expected := OrderedCollection with:summary depositLegMessage,'150' 
								      with: summary depositMessage,'100'
								      with: summary depositLegMessage,'50'
								      with: summary balanceMessage,'300'.
	
	self assert:(summary  accountSummary) equals:(expected).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 14:58:54'!
test21PortfolioGeneratesExclusiveEmptyPortfolioSummary
	|summary expected|
	
	summary := PortfolioSummarizer for:(Portfolio named: 'Portfolio Vacio').
	expected := Dictionary new.
	expected at:'Portfolio Vacio' put:OrderedCollection new.
	
	self assert:(summary  accountSummary) equals:(expected).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 15:17:07'!
test22PortfolioGeneratesExclusivePortfolioSummaryWithAccounts
	|summary portfolio account1 account2 expected|
	account1 := ReceptiveAccount named:'Cuenta 1'.
	account2 := ReceptiveAccount named: 'Cuenta 2'.
	
	portfolio := Portfolio named: 'Portfolio con Cuentas' with:account1  with: account2.

	summary := PortfolioSummarizer for:portfolio.
	expected := Dictionary new.
	expected at:'Portfolio con Cuentas' put:(OrderedCollection with:'Cuenta 1' with:'Cuenta 2').
	
	self assert:(summary  accountSummary) equals:(expected).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jd 11/1/2024 15:17:26'!
test23PortfolioGeneratesExclusiveSummaryWithPortfoliosAndAccounts
	|johnsAccount angiesAccount childrenPortfolio myAccount familyPortfolio summary expected firstReportLayer secondReportLayer|

	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with:johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with:myAccount with: childrenPortfolio.
	
	summary := PortfolioSummarizer for:familyPortfolio.
	
	expected := Dictionary new.
	secondReportLayer := Dictionary new.
	secondReportLayer at:'Portfolio de hijos' put:(OrderedCollection with:'Cuenta de Juan'  with:'Cuenta de Angeles' ).
	
	firstReportLayer := OrderedCollection with:'Cuenta mia'  with: secondReportLayer .
	expected at:'Portfolio de la familia' put:firstReportLayer .
	
	self assert:(summary  accountSummary) equals:(expected).! !


!classDefinition: #TransferenceTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferenceTest methodsFor: 'nil' stamp: 'jd 10/29/2024 12:50:37'!
test01ATransferenceWithdrawsFromOneAccountAndDepositsInTheOther
	|sender receiver|
	sender := ReceptiveAccount new.
	receiver  := ReceptiveAccount new.
	
	Transference from:sender to:receiver value:100.
	
	self assert:(sender balance) equals:(-100).
	self assert:(receiver balance) equals:(100).! !


!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'jd 10/29/2024 14:30:58'!
test02AccountsHaveTransactionLegs
	|sender receiver transference|
	sender := ReceptiveAccount new.
	receiver  := ReceptiveAccount new.
	
	transference := Transference from:sender to:receiver value:100.
	
	self assert:(sender transactions includes: (transference extractionLeg)) .! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'jd 10/29/2024 14:30:39'!
test03CanGoFromTransactionLegsToTransference
	|sender receiver transference|
	sender := ReceptiveAccount new.
	receiver  := ReceptiveAccount new.
	
	transference := Transference from:sender to:receiver value:100.
	
	self assert:((sender transactions at:1) transference) equals:(transference).! !


!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'jd 11/1/2024 14:42:09'!
name 
	^name! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!Account methodsFor: 'initialize' stamp: 'jd 11/1/2024 12:39:28'!
initializeNamed:aName 
	name := aName.! !


!Account methodsFor: 'operations' stamp: 'jd 11/1/2024 13:12:00'!
operation: aReport

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: #'Portfolio-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'jd 11/1/2024 12:39:10'!
named:aName
	^self new initializeNamed:aName.! !


!classDefinition: #Portfolio category: #'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'jd 11/1/2024 13:20:53'!
accountsDo: aBlockToLoop
	accounts do:[:anAccount| 
		aBlockToLoop value: anAccount.
		].! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !

!Portfolio methodsFor: 'transactions' stamp: 'jd 10/31/2024 12:46:41'!
transactionsDo: aBlockToLoop
	accounts do:[:anAccount| 
		anAccount transactionsDo: aBlockToLoop.
	].! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'operations' stamp: 'jd 11/1/2024 13:12:14'!
operation: aReport
	aReport operationPortfolio:self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'jd 11/1/2024 12:40:13'!
named:aName with: anAccount with: anotherAccount

	^(self new initializeNamed: aName)
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'jd 10/29/2024 15:17:23'!
initialize
	super initialize.
	transactions := OrderedCollection new.
! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'jd 10/31/2024 00:21:18'!
transactionsDo: aBlockToLoop
	transactions do:[:aTransaction| 
		aBlockToLoop value: aTransaction.
		].! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'transferences' stamp: 'jd 10/29/2024 15:21:27'!
registerTransferenceReceived: transference
	"Deposit register:(transference value) on:self."! !

!ReceptiveAccount methodsFor: 'transferences' stamp: 'jd 10/29/2024 15:21:22'!
registerTransferenceSent: transference 
	"Withdraw register:(transference value) on:self."! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'jd 10/29/2024 15:21:00'!
registerTransference: aTransference
	"transactions add:aTransference"! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'jd 10/31/2024 00:26:00'!
accountSummary
"	|accountSummary|
	accountSummary := OrderedCollection new.
	transactions do:[:transaction|
		transaction className = 'Deposit' ifTrue:[
			accountSummary add: ('Deposito por ', (transaction value asString))
			].
		transaction className = 'Withdraw' ifTrue:[
			accountSummary add: ('Extraccion por ', (transaction value asString))
			].
		transaction className = 'ExtractionLeg' ifTrue:[
			accountSummary add: ('Salida por transferencia de ', (transaction  value asString))
			].
		transaction className = 'DepositLeg' ifTrue:[
			accountSummary add: ('Entrada por transferencia de ', (transaction  value asString))
			]
		].
	accountSummary add:('Balance = ', (self balance asString)).
	
	^accountSummary."
	! !


!ReceptiveAccount methodsFor: 'operations' stamp: 'jd 11/1/2024 13:12:30'!
operation: aReport
	aReport operationReceptiveAccount:self.! !


!classDefinition: #AccountReports category: #'Portfolio-Solucion'!
Object subclass: #AccountReports
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountReports methodsFor: 'as yet unclassified' stamp: 'jd 10/31/2024 01:03:59'!
operacionDeposit: aDeposit

	self subclassResponsibility! !

!AccountReports methodsFor: 'as yet unclassified' stamp: 'jd 10/31/2024 01:04:06'!
operacionDepositLeg: aDepositLeg

	self subclassResponsibility! !

!AccountReports methodsFor: 'as yet unclassified' stamp: 'jd 10/31/2024 01:04:12'!
operacionExtractionLeg: anExtractionLeg

	self subclassResponsibility! !

!AccountReports methodsFor: 'as yet unclassified' stamp: 'jd 10/31/2024 01:04:18'!
operacionWithdraw: aWithdraw

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReports class' category: #'Portfolio-Solucion'!
AccountReports class
	instanceVariableNames: ''!

!AccountReports class methodsFor: 'instance creation' stamp: 'jd 10/31/2024 01:03:26'!
for: anAccount 
	^self new initializeFor: anAccount ! !


!classDefinition: #AccountSummarizerReportt category: #'Portfolio-Solucion'!
AccountReports subclass: #AccountSummarizerReportt
	instanceVariableNames: 'account accountSummary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummarizerReportt methodsFor: 'messages' stamp: 'jd 10/31/2024 12:58:08'!
balanceMessage

	^ 'Balance = '! !

!AccountSummarizerReportt methodsFor: 'messages' stamp: 'jd 10/31/2024 12:58:46'!
depositLegMessage

	^ 'Entrada por transferencia de '! !

!AccountSummarizerReportt methodsFor: 'messages' stamp: 'jd 10/31/2024 12:56:46'!
depositMessage

	^ 'Deposito por '! !

!AccountSummarizerReportt methodsFor: 'messages' stamp: 'jd 10/31/2024 12:57:14'!
extractionLegMessage

	^ 'Salida por transferencia de '! !

!AccountSummarizerReportt methodsFor: 'messages' stamp: 'jd 10/31/2024 12:58:29'!
extractionMessage

	^ 'Extraccion por '! !


!AccountSummarizerReportt methodsFor: 'initialize' stamp: 'jd 11/1/2024 14:23:16'!
initializeFor:aReceptiveAccount
	account := aReceptiveAccount.
	accountSummary := OrderedCollection new.! !


!AccountSummarizerReportt methodsFor: 'report' stamp: 'jd 11/1/2024 13:01:12'!
accountSummary
	account transactionsDo:[:transaction|
		transaction operation: self.
		].
	accountSummary add:(self balanceMessage, (account balance asString)).
		

	^accountSummary.
! !


!AccountSummarizerReportt methodsFor: 'operations' stamp: 'jd 10/31/2024 12:56:46'!
operacionDeposit:aDeposit
	accountSummary add: (self depositMessage, (aDeposit value asString)).
! !

!AccountSummarizerReportt methodsFor: 'operations' stamp: 'jd 10/31/2024 12:58:46'!
operacionDepositLeg: aDepositLeg
	accountSummary add: (self depositLegMessage, (aDepositLeg  value asString)).
! !

!AccountSummarizerReportt methodsFor: 'operations' stamp: 'jd 10/31/2024 12:57:14'!
operacionExtractionLeg:anExtractionLeg
	accountSummary add: (self extractionLegMessage, (anExtractionLeg value asString)).
! !

!AccountSummarizerReportt methodsFor: 'operations' stamp: 'jd 10/31/2024 12:58:29'!
operacionWithdraw:aWithdraw
	accountSummary add: (self extractionMessage, (aWithdraw value asString)).
! !


!classDefinition: #PortfolioSummarizer category: #'Portfolio-Solucion'!
AccountReports subclass: #PortfolioSummarizer
	instanceVariableNames: 'portfolio portfolioSummaryBody summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioSummarizer methodsFor: 'operation' stamp: 'jd 11/1/2024 13:38:32'!
operationPortfolio: aPortfolio
	portfolioSummaryBody add:(PortfolioSummarizer for:aPortfolio) accountSummary .
! !

!PortfolioSummarizer methodsFor: 'operation' stamp: 'jd 11/1/2024 14:43:18'!
operationReceptiveAccount: aReceptiveAccount
	portfolioSummaryBody add: (aReceptiveAccount name)! !


!PortfolioSummarizer methodsFor: 'report' stamp: 'jd 11/1/2024 14:56:20'!
accountSummary	
	portfolio accountsDo:[:anAccount|
		anAccount operation: self.
		].
	summary at:(portfolio name) put:portfolioSummaryBody.
	^summary.! !


!PortfolioSummarizer methodsFor: 'as yet unclassified' stamp: 'jd 11/1/2024 13:38:32'!
initialize
	portfolioSummaryBody := OrderedCollection new.! !

!PortfolioSummarizer methodsFor: 'as yet unclassified' stamp: 'jd 11/1/2024 14:25:10'!
initializeFor:aPortfolio
	portfolio := aPortfolio .
	portfolioSummaryBody := OrderedCollection new.
	summary := Dictionary new.
	
! !


!classDefinition: #TransferNetReport category: #'Portfolio-Solucion'!
AccountReports subclass: #TransferNetReport
	instanceVariableNames: 'account transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetReport methodsFor: 'report' stamp: 'jd 10/31/2024 01:02:39'!
transferNet
	account transactionsDo:[:transaction|
		transaction operation: self.
	].

	^transferNet.! !


!TransferNetReport methodsFor: 'operations' stamp: 'jd 10/31/2024 00:49:25'!
operacionDeposit:aDeposit
! !

!TransferNetReport methodsFor: 'operations' stamp: 'jd 10/31/2024 00:51:07'!
operacionDepositLeg: aDepositLeg
	transferNet := transferNet + aDepositLeg value.! !

!TransferNetReport methodsFor: 'operations' stamp: 'jd 10/31/2024 00:51:23'!
operacionExtractionLeg:anExtractionLeg
	transferNet := transferNet - anExtractionLeg value.! !

!TransferNetReport methodsFor: 'operations' stamp: 'jd 10/31/2024 00:49:47'!
operacionWithdraw: aWithdraw 
! !


!TransferNetReport methodsFor: 'initialize' stamp: 'jd 10/31/2024 00:47:05'!
initializeFor: anAccount 
	account := anAccount.
	transferNet :=0.! !


!classDefinition: #AccountTransaction category: #'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'jd 10/31/2024 00:58:17'!
operation: aReport

	self subclassResponsibility! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'jd 10/31/2024 00:58:49'!
operation: aReport
	aReport  operacionDeposit: self.! !

!Deposit methodsFor: 'value' stamp: 'jd 10/30/2024 00:10:35'!
value
	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferenceLeg category: #'Portfolio-Solucion'!
AccountTransaction subclass: #TransferenceLeg
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferenceLeg methodsFor: 'nil' stamp: 'jd 10/29/2024 14:07:47'!
initializeOf:aTransference
	transference := aTransference.! !

!TransferenceLeg methodsFor: 'nil' stamp: 'jd 10/29/2024 14:30:04'!
transference
	^transference! !

!TransferenceLeg methodsFor: 'nil' stamp: 'jd 10/30/2024 00:09:57'!
value
	^transference value! !


!TransferenceLeg methodsFor: 'as yet unclassified' stamp: 'jd 10/30/2024 00:11:37'!
affectBalance: aBalance

	self subclassResponsibility! !


!TransferenceLeg methodsFor: 'value' stamp: 'jd 10/31/2024 01:00:27'!
operation: aReport

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceLeg class' category: #'Portfolio-Solucion'!
TransferenceLeg class
	instanceVariableNames: ''!

!TransferenceLeg class methodsFor: 'as yet unclassified' stamp: 'jd 10/29/2024 14:21:48'!
of:aTransference
	^(self new) initializeOf:aTransference.! !


!classDefinition: #DepositLeg category: #'Portfolio-Solucion'!
TransferenceLeg subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'jd 10/30/2024 00:10:06'!
affectBalance: aBalance
	"como hago para no repetir codigo??? esta bien subclasificar de deposit y withdraw?"
	^aBalance + (self value) 
	! !


!DepositLeg methodsFor: 'value' stamp: 'jd 10/31/2024 01:00:49'!
operation: aReport
	aReport  operacionDepositLeg: self.! !


!classDefinition: #ExtractionLeg category: #'Portfolio-Solucion'!
TransferenceLeg subclass: #ExtractionLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ExtractionLeg methodsFor: 'as yet unclassified' stamp: 'jd 10/30/2024 00:10:24'!
affectBalance: aBalance
	^aBalance - (self value) ! !


!ExtractionLeg methodsFor: 'value' stamp: 'jd 10/31/2024 01:01:12'!
operation: aReport
	aReport operacionExtractionLeg: self.! !


!classDefinition: #Withdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'jd 10/31/2024 01:01:35'!
operation: aReport
	aReport  operacionWithdraw: self.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transference category: #'Portfolio-Solucion'!
Object subclass: #Transference
	instanceVariableNames: 'value extractionLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transference methodsFor: 'initialize' stamp: 'jd 10/30/2024 00:08:12'!
initializeFrom: aSender to: aReceiver value: aValue 
	depositLeg := DepositLeg of:self.
	extractionLeg := ExtractionLeg of:self.
	value := aValue.! !


!Transference methodsFor: 'nil' stamp: 'jd 10/29/2024 14:17:06'!
depositLeg
	^depositLeg ! !

!Transference methodsFor: 'nil' stamp: 'jd 10/29/2024 14:16:52'!
extractionLeg
	^extractionLeg ! !

!Transference methodsFor: 'nil' stamp: 'jd 10/29/2024 13:26:24'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: #'Portfolio-Solucion'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'jd 10/30/2024 00:07:39'!
from: sender to: receiver value: aValue
	|transference|
	transference := (self new) initializeFrom: sender to: receiver value: aValue.
	receiver register:(transference depositLeg).
	sender  register:(transference extractionLeg).
	^transference.! !
