!classDefinition: #TusLibrosTest category: #'TusLibros-Exercise'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 13:19:21'!
supermarket0
	|listProduct|
	listProduct := OrderedCollection new.	
	^Supermarket for:listProduct.
	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:05:01'!
supermarket1
	|listProduct|
	listProduct := OrderedCollection new.	
	listProduct  add: 'La mitad del cielo'.
	^Supermarket for:listProduct.
	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:05:30'!
supermarket2
	|listProduct|
	listProduct := OrderedCollection new.	
	listProduct add: 'La mitad del cielo'.
	listProduct add: 'Yo niña, yo princesa'.
	^Supermarket for:listProduct.
	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 14:46:37'!
test01newCartIsEmpty
	|cart|
	"supermarket0: 
		- No tiene libros
	"
	cart := Cart for:self supermarket0.
	self assert: cart isEmpty.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:12:09'!
test02aCartIsNotEmptyWhenProductAdded
	| cart product supermarket|
	"supermarket1: 
		- La mitad del cielo
	"
	supermarket  := self supermarket1.
	product := 'La mitad del cielo'.
	cart _ Cart for:supermarket.
	cart addProduct: product.
	self assert: (cart loaded: product).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:21:34'!
test02bCartIsNotEmptyWhenProductAdded
	| cart product supermarket|
	"supermarket1: 
		- La mitad del cielo
	"
	supermarket  := self supermarket1.
	product := 'Yo Niña, yo princesa'.
	cart _ Cart for:supermarket.
	self should:[ cart addProduct: product] raise: Error withMessageText: Cart notCanAddProductThatIsNotInTheListCartErrorMessage.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:29:07'!
test03cartProductTwoAddedForAddProduct
	| cart product supermarket |
	supermarket  := self supermarket1.
	cart _ Cart for:supermarket .
	product _ 'La mitad del cielo'.
	cart addProduct: product.
	cart addProduct: product.
	self assert: ((cart quantity: product) =2).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:30:30'!
test04cartProductTwoAddedForAddProductWith
	| cart product supermarket |
	supermarket  := self supermarket1.
	cart _ Cart for:supermarket .
	product _ 'La mitad del cielo'.
	cart addProduct: product withQuantity: 2.
	self assert: ((cart quantity: product) =2).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:32:36'!
test05cantRemoveProductLoadedCartWithAddProduct
	| cart product supermarket |
	supermarket  := self supermarket1.
	cart _ Cart for:supermarket .
	product _ 'La mitad del cielo'.
	cart addProduct: product .
	cart removeProduct: product.
	self deny: (cart loaded: product).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:33:29'!
test06cantRemoveProductLoadedCartWithAddProductWithQuantity
| cart product supermarket |
	supermarket  := self supermarket1.
	cart _ Cart for:supermarket .
	product _ 'La mitad del cielo'.
	cart addProduct: product withQuantity: 2.
	cart removeProduct: product.
	self deny: (cart loaded: product).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:33:50'!
test07cantRemoveProductLoadedCart
	| cart product supermarket |
	supermarket  := self supermarket1.
	cart _ Cart for:supermarket .
	product _ 'La mitad del cielo'.
	cart addProduct: product .
	cart removeProduct: product.
	self deny: (cart loaded: product).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:34:01'!
test08cantRemoveProductFromEmptyCart
	| cart product supermarket |
	supermarket  := self supermarket1.
	cart _ Cart for:supermarket .
	product _ 'La mitad del cielo'.
	self should:[ cart removeProduct: product] raise: Error withMessageText: Cart notCanRemoveEmptyCartErrorMessage.! !


!classDefinition: #Cart category: #'TusLibros-Exercise'!
Object subclass: #Cart
	instanceVariableNames: 'state listOrders supermarket'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!

!Cart methodsFor: 'add product private' stamp: 'sc 6/7/2018 13:52:38'!
addProductThatIsInTheList:aProduct withQuantity:aQuantity
	state addProduct: aProduct withQuantity: aQuantity with:self.
	! !

!Cart methodsFor: 'add product private' stamp: 'sc 6/7/2018 15:39:53'!
addProductThatIsNotInTheList:aProduct withQuantity:aQuantity
	^self error: self class notCanAddProductThatIsNotInTheListCartErrorMessage.
						! !

!Cart methodsFor: 'add product private' stamp: 'sc 6/7/2018 12:41:25'!
addProductWithCartEmpty: aProduct
	listOrders
		at: aProduct
		put: 1.
	state _ LoadedState for: self.! !

!Cart methodsFor: 'add product private' stamp: 'sc 6/7/2018 12:41:25'!
addProductWithCartEmpty: aProduct withQuantity: aQuantity
	listOrders
		at: aProduct
		put: aQuantity.
	state _ LoadedState for: self.! !

!Cart methodsFor: 'add product private' stamp: 'sc 6/7/2018 12:41:25'!
addProductWithCartLoaded: aProduct withQuantity: aQuantity
	| cantidad |
	cantidad _ listOrders at: aProduct.
	listOrders
		at: aProduct
		put: cantidad + aQuantity.! !


!Cart methodsFor: 'add product' stamp: 'sc 6/7/2018 13:51:01'!
addProduct: aProduct 
	supermarket addProduct:aProduct withQuantity:1 with:self.! !

!Cart methodsFor: 'add product' stamp: 'sc 6/7/2018 13:50:54'!
addProduct: aProduct withQuantity:aQuantity
	supermarket addProduct:aProduct withQuantity:aQuantity with:self.! !


!Cart methodsFor: 'initialization' stamp: 'sc 6/7/2018 12:56:02'!
initialize:aSupermarket
	state _ EmptyState for: self.
	listOrders _ Dictionary new.
	supermarket := aSupermarket.! !


!Cart methodsFor: 'querys' stamp: 'sc 6/7/2018 12:41:25'!
isEmpty
	^ listOrders isEmpty.! !

!Cart methodsFor: 'querys' stamp: 'sc 6/7/2018 12:41:25'!
loaded: aProduct
	^ listOrders includesKey: aProduct.! !

!Cart methodsFor: 'querys' stamp: 'sc 6/7/2018 12:41:25'!
quantity: aProduct
	^ listOrders at: aProduct.! !


!Cart methodsFor: 'remove product' stamp: 'sc 6/6/2018 22:36:47'!
removeProduct: aProduct
	state removeProduct: aProduct with:self.! !


!Cart methodsFor: 'remove product private' stamp: 'sc 6/6/2018 22:45:34'!
removeProductWithCartEmpty: aProduct
	self error: self class notCanRemoveEmptyCartErrorMessage.! !

!Cart methodsFor: 'remove product private' stamp: 'sc 6/7/2018 12:41:25'!
removeProductWithCartLoaded: aProduct
	(self loaded: aProduct) ifFalse: [ self error: self class notCanRemoveProductNoLoadedErrorMessage ].
	listOrders removeKey: aProduct.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Exercise'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 13:00:14'!
for: aSupermarket
	^self new initialize: aSupermarket.! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 13:45:01'!
notCanAddProductThatIsNotInTheListCartErrorMessage
	^'No puede agregar productos que no estan la lista del supermercado'.! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'sc 6/6/2018 22:47:14'!
notCanRemoveEmptyCartErrorMessage
	^'No puede eliminar carrito vacio'.! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'sc 6/6/2018 23:00:56'!
notCanRemoveProductNoLoadedErrorMessage
	^'No puede eliminar, el producto no fue cargado'.! !


!classDefinition: #CartState category: #'TusLibros-Exercise'!
Object subclass: #CartState
	instanceVariableNames: 'cart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!

!CartState methodsFor: 'initialization' stamp: 'sc 6/6/2018 21:59:16'!
initializeFor: aCart

	cart:= aCart! !


!CartState methodsFor: 'as yet unclassified' stamp: 'sc 6/6/2018 23:50:00'!
addProduct: aProduct withQuantity:aQuantity with:aCart
	self subclassResponsibility.! !

!CartState methodsFor: 'as yet unclassified' stamp: 'sc 6/6/2018 22:39:04'!
removeProduct: aProduct with:aCart
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartState class' category: #'TusLibros-Exercise'!
CartState class
	instanceVariableNames: ''!

!CartState class methodsFor: 'instance creation' stamp: 'sc 6/6/2018 21:58:25'!
for: aCart
	
	^self new initializeFor: aCart! !


!classDefinition: #EmptyState category: #'TusLibros-Exercise'!
CartState subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!

!EmptyState methodsFor: 'as yet unclassified' stamp: 'sc 6/6/2018 23:49:35'!
addProduct: aProduct withQuantity:aQuantity with:aCart
	aCart addProductWithCartEmpty:aProduct withQuantity:aQuantity.! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'sc 6/6/2018 22:40:37'!
removeProduct: aProduct with:aCart
	aCart removeProductWithCartEmpty: aProduct.! !


!classDefinition: #LoadedState category: #'TusLibros-Exercise'!
CartState subclass: #LoadedState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!

!LoadedState methodsFor: 'remove product' stamp: 'sc 6/6/2018 22:49:03'!
removeProduct: aProduct with:aCart
	aCart removeProductWithCartLoaded: aProduct.! !


!LoadedState methodsFor: 'add product' stamp: 'sc 6/6/2018 23:46:55'!
addProduct: aProduct withQuantity:aQuantity with:aCart
	aCart  addProductWithCartLoaded: aProduct withQuantity:aQuantity.! !


!classDefinition: #Product category: #'TusLibros-Exercise'!
Object subclass: #Product
	instanceVariableNames: 'id name sumpermarkets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!

!Product methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 14:59:59'!
description
	^name.! !

!Product methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 14:59:43'!
id
	^id.! !

!Product methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 14:49:08'!
initialize:aName
	name:= aName.! !

!Product methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 14:58:03'!
initialize:number with: aName
	id := number.
	name:= aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Product class' category: #'TusLibros-Exercise'!
Product class
	instanceVariableNames: ''!

!Product class methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 14:58:17'!
for: number with: aName
	^self new initialize: number  with:aName.	! !


!classDefinition: #Supermarket category: #'TusLibros-Exercise'!
Object subclass: #Supermarket
	instanceVariableNames: 'listProducts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!

!Supermarket methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:15:32'!
addProduct:aProduct withQuantity:aQuantity with:aCart
	(listProducts includes: aProduct ) ifFalse:[aCart addProductThatIsNotInTheList:aProduct withQuantity:aQuantity].
	aCart addProductThatIsInTheList:aProduct withQuantity:aQuantity.
	! !

!Supermarket methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 15:00:50'!
initializeWith:aListIdProduct
	listProducts :=aListIdProduct.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Supermarket class' category: #'TusLibros-Exercise'!
Supermarket class
	instanceVariableNames: ''!

!Supermarket class methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 13:00:21'!
for: aListProduct
	^self new initializeWith:aListProduct.
	! !
