!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'sc 6/7/2018 19:27:19'!
test01CashierCheckoutCartsEmpty
	| cashier  cart |
	
	cashier := self createCashier.
	cart := self createCart.
	self 
		should: [ cashier checkout:cart]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartEmptyErrorMessage.
		]
	! !

!CashierTest methodsFor: 'tests' stamp: 'sc 6/7/2018 20:07:09'!
test02CashierCheckoutCartsOneProduct
	| cashier  cart |
	
	cashier := self createCashier.
	cart := self createCart.
	cart add:'La mitad del cielo'.
	self assert:((cashier checkout:cart )= 20).

! !

!CashierTest methodsFor: 'tests' stamp: 'sc 6/11/2018 14:31:58'!
test03CashierCheckoutCartsTwoProduct
	| cashier  cart |
	
	cashier := self createCashier.
	cart := self createCart.
	cart add:'La mitad del cielo'.
	cart add:'Yo niña, yo princesa'.
	self assert:((cashier checkout:cart )= 35).

! !

!CashierTest methodsFor: 'tests' stamp: 'sc 6/11/2018 15:05:51'!
test04CashierDebitMountFromCreditCardExpired
	| cashier cart mount creditCart|
	cashier := self createCashier.
	cart := self createCart.
	cart add:'La mitad del cielo'.
	mount := cashier checkout:cart .
	creditCart := CreditCart for: 'Juan Perez' month:06  year:2015.
	self 
		should: [ cashier debit:mount from:creditCart]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardDateExpirationErrorMessage.
		]


! !

!CashierTest methodsFor: 'tests' stamp: 'sc 6/11/2018 15:07:06'!
test05CashierDebitMountFromCreditCardNotExpired
	| cashier cart mount creditCart|
	cashier := self createCashier.
	cart := self createCart.
	cart add:'La mitad del cielo'.
	mount := cashier checkout:cart .
	creditCart := CreditCart for: 'Juan Perez' month:06  year:2018.
	self assert:(cashier debit:mount from:creditCart).

! !


!CashierTest methodsFor: 'support' stamp: 'sc 6/7/2018 19:10:04'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CashierTest methodsFor: 'support' stamp: 'sc 6/11/2018 14:27:21'!
createCashier
	|date|
	date := Date today.
	^Cashier for: self defaultPriceList when:date.! !

!CashierTest methodsFor: 'support' stamp: 'sc 6/11/2018 14:38:13'!
defaultCatalog
	| catalog |
	catalog :=  #('La mitad del cielo' 'Yo niña, yo princesa').
	^catalog.! !

!CashierTest methodsFor: 'support' stamp: 'sc 6/11/2018 14:29:41'!
defaultPriceList
	| priceList |
	priceList := Dictionary new.
	priceList at:'La mitad del cielo' put:20.
	priceList at:'Yo niña, yo princesa' put:15.
	^priceList.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidItem: anItem

	(catalog includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'sc 6/7/2018 20:08:42'!
items
	^items! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'priceList today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'sc 6/11/2018 15:20:12'!
checkout: aCart 
	|cost|
	cost := 0.
	(aCart isEmpty) ifTrue: [^self error: self class cartEmptyErrorMessage].
	(aCart items) do:[:item| cost := cost + priceList at:item].
	^cost.
! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'sc 6/11/2018 15:32:13'!
debit: mount from: aCreditCart 
	(aCreditCart dateExpiration < today) ifTrue:[^self error: self class  creditCardDateExpirationErrorMessage ].
	^ true.
! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'sc 6/11/2018 15:28:09'!
initializeWith:aPriceLis when:date
	priceList := aPriceLis.
	today := date.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'sc 6/11/2018 15:21:44'!
cartEmptyErrorMessage
	^'El carrto esta vacio'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'sc 6/11/2018 15:21:56'!
creditCardDateExpirationErrorMessage
	^'Tarjeta de credito vencida'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'sc 6/11/2018 15:27:53'!
for: aPriceLIst when:date
	^self new initializeWith: aPriceLIst when:date.! !


!classDefinition: #CreditCart category: #TusLibros!
Object subclass: #CreditCart
	instanceVariableNames: 'name monthExpiration yearExpiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCart methodsFor: 'initialize creation' stamp: 'sc 6/11/2018 14:56:08'!
initialize: aName month: aMonth year: aYear
	name := aName.
	monthExpiration := aMonth .
	yearExpiration := aYear.! !


!CreditCart methodsFor: 'as yet unclassified' stamp: 'sc 6/11/2018 15:02:11'!
dateExpiration
	^Date year: yearExpiration month: monthExpiration day: (Date daysInMonth:monthExpiration  forYear:yearExpiration).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCart class' category: #TusLibros!
CreditCart class
	instanceVariableNames: ''!

!CreditCart class methodsFor: 'as yet unclassified' stamp: 'sc 6/11/2018 14:59:03'!
for: aName month: aMonth year: aYear
	^self new initialize:aName month: aMonth year: aYear.! !
