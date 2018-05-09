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

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
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


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'firtStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operaciones' stamp: 'sc 4/25/2018 23:54:29'!
isEmpty
	^firtStack isEmpty.! !

!OOStack methodsFor: 'operaciones' stamp: 'sc 4/26/2018 01:40:26'!
pop
	| t |
	t := firtStack  top .
	firtStack := firtStack proximo .
	^ t.! !

!OOStack methodsFor: 'operaciones' stamp: 'sc 4/26/2018 00:32:13'!
push: aString
	firtStack := OOStackContenedor agregar: aString with:firtStack .! !

!OOStack methodsFor: 'operaciones' stamp: 'sx 4/25/2018 23:21:04'!
size
	^firtStack size.! !

!OOStack methodsFor: 'operaciones' stamp: 'sc 4/26/2018 01:08:40'!
top
	^firtStack top.! !


!OOStack methodsFor: 'creacion' stamp: 'sx 4/25/2018 23:19:20'!
initialize
	"elems := OrderedCollection new."
	firtStack:= OOStackVacio new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackContenedor category: #'Stack-Exercise'!
Object subclass: #OOStackContenedor
	instanceVariableNames: 'prox otro'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackContenedor methodsFor: 'creacion' stamp: 'sc 4/26/2018 01:53:55'!
agregar: aString with:otroStack
	prox:=aString .
	otro  := otroStack .! !


!OOStackContenedor methodsFor: 'operaciones' stamp: 'sc 4/26/2018 01:54:27'!
isEmpty
	^false.! !

!OOStackContenedor methodsFor: 'operaciones' stamp: 'sc 4/26/2018 01:54:40'!
proximo
	^ otro .! !

!OOStackContenedor methodsFor: 'operaciones' stamp: 'sc 4/26/2018 01:54:56'!
size
	^ otro  size + 1.! !

!OOStackContenedor methodsFor: 'operaciones' stamp: 'sc 4/26/2018 01:55:06'!
top
	^ prox .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackContenedor class' category: #'Stack-Exercise'!
OOStackContenedor class
	instanceVariableNames: ''!

!OOStackContenedor class methodsFor: 'as yet unclassified' stamp: 'sc 4/26/2018 00:29:19'!
agregar: aString with:otroStack
	^ self new agregar:aString  with: otroStack.! !


!classDefinition: #OOStackVacio category: #'Stack-Exercise'!
Object subclass: #OOStackVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackVacio methodsFor: 'operaciones' stamp: 'sc 4/25/2018 22:19:36'!
isEmpty
	^true.! !

!OOStackVacio methodsFor: 'operaciones' stamp: 'sc 4/26/2018 01:56:45'!
proximo
	self error: 'Stack is empty'.! !

!OOStackVacio methodsFor: 'operaciones' stamp: 'sc 4/25/2018 22:19:59'!
size
	^0.! !

!OOStackVacio methodsFor: 'operaciones' stamp: 'sc 4/26/2018 01:51:59'!
top
	self error: 'Stack is empty'.
! !
