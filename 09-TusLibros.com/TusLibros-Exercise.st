!classDefinition: #TusLibrosTest category: #'TusLibros-Exercise'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'MG 6/4/2018 21:13:37'!
test01newCartIsEmpty
	|cart|
	cart := Cart new.
	self assert: cart isEmpty.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/6/2018 22:29:46'!
test02cartIsNotEmptyWhenProductAdded
	| cart product |
	cart _ Cart new.
	product _ Product new.
	cart addProduct: product.
	self assert: (cart loaded: product).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 00:00:35'!
test03cartProductTwoAddedForAddProduct
	| cart product |
	cart _ Cart new.
	product _ Product new.
	cart addProduct: product.
	cart addProduct: product.
	self assert: ((cart quantity: product) =2).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 00:02:03'!
test04cartProductTwoAddedForAddProductWith
	| cart product |
	cart _ Cart new.
	product _ Product new.
	cart addProduct: product withQuantity: 2.
	self assert: ((cart quantity: product) =2).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 00:03:04'!
test05cantRemoveProductLoadedCartWithAddProduct
	| cart product |
	cart := Cart new.
	product := Product new.
	cart addProduct: product .
	cart removeProduct: product.
	self deny: (cart loaded: product).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 00:03:59'!
test06cantRemoveProductLoadedCartWithAddProductWithQuantity
	| cart product |
	cart := Cart new.
	product := Product new.
	cart addProduct: product withQuantity: 2.
	cart removeProduct: product.
	self deny: (cart loaded: product).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 00:04:19'!
test07cantRemoveProductLoadedCart
	| cart product |
	cart := Cart new.
	product := Product new.
	cart addProduct: product .
	cart removeProduct: product.
	self deny: (cart loaded: product).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'sc 6/7/2018 00:05:06'!
test08cantRemoveProductFromEmptyCart
	| cart product |
	cart := Cart new.
	product := Product new.
	self should:[ cart removeProduct: product] raise: Error withMessageText: Cart notCanRemoveEmptyCartErrorMessage.! !


!classDefinition: #Cart category: #'TusLibros-Exercise'!
Object subclass: #Cart
	instanceVariableNames: 'state list'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!

!Cart methodsFor: 'add product private' stamp: 'sc 6/6/2018 23:41:51'!
addProductWithCartEmpty:aProduct
	list at: aProduct put:1.
	state := LoadedState for: self.! !

!Cart methodsFor: 'add product private' stamp: 'sc 6/6/2018 23:51:49'!
addProductWithCartEmpty:aProduct withQuantity:aQuantity
	list at: aProduct put:aQuantity.
	state := LoadedState for: self.! !

!Cart methodsFor: 'add product private' stamp: 'sc 6/6/2018 23:47:52'!
addProductWithCartLoaded:aProduct withQuantity:aQuantity
	|cantidad|
	cantidad := list at:aProduct.
	list at: aProduct put:cantidad+aQuantity.! !


!Cart methodsFor: 'add product' stamp: 'sc 6/6/2018 23:48:36'!
addProduct: aProduct 
	state addProduct: aProduct withQuantity:1 with:self.! !

!Cart methodsFor: 'add product' stamp: 'sc 6/6/2018 23:44:56'!
addProduct: aProduct withQuantity:aQuantity
	state addProduct: aProduct withQuantity: aQuantity with:self.! !


!Cart methodsFor: 'initialization' stamp: 'sc 6/6/2018 23:35:19'!
initialize
	state:=EmptyState for: self.
	list := Dictionary new.! !


!Cart methodsFor: 'querys' stamp: 'sc 6/6/2018 22:27:41'!
isEmpty
	^list isEmpty.! !

!Cart methodsFor: 'querys' stamp: 'sc 6/6/2018 23:37:39'!
loaded: aProduct
	^list includesKey: aProduct .! !

!Cart methodsFor: 'querys' stamp: 'sc 6/6/2018 23:59:12'!
quantity:aProduct
	^list at: aProduct.! !


!Cart methodsFor: 'remove product' stamp: 'sc 6/6/2018 22:36:47'!
removeProduct: aProduct
	state removeProduct: aProduct with:self.! !


!Cart methodsFor: 'remove product private' stamp: 'sc 6/6/2018 22:45:34'!
removeProductWithCartEmpty: aProduct
	self error: self class notCanRemoveEmptyCartErrorMessage.! !

!Cart methodsFor: 'remove product private' stamp: 'sc 6/6/2018 23:47:20'!
removeProductWithCartLoaded:aProduct
	(self loaded: aProduct) ifFalse: [self error: self class notCanRemoveProductNoLoadedErrorMessage].
	list removeKey: aProduct .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Exercise'!
Cart class
	instanceVariableNames: ''!

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
	instanceVariableNames: 'listCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!
