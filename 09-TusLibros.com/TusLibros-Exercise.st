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

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'MG 6/4/2018 21:51:10'!
test02cartIsNotEmptyWhenProductAdded
	| cart product |
	cart _ Cart new.
	product _ Product new.
	cart addProduct: product.
	self assert: cart isEmpty not.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'MG 6/4/2018 21:49:31'!
test03cantRemoveProductFromEmptyCart
	| cart product |
	cart := Cart new.
	product := Product new.
	self should:[ cart removeProduct: product] raise: Error withMessageText: Cart cantRemoveFromEmptyCartErrorDescription.! !


!classDefinition: #Cart category: #'TusLibros-Exercise'!
Object subclass: #Cart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!


!classDefinition: #Product category: #'TusLibros-Exercise'!
Object subclass: #Product
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Exercise'!
