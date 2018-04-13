!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #IdiomTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!IdiomTest methodsFor: 'testing' stamp: 'sabrina castro 4/13/2018 00:49:36'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	"agregar un cliente no deberia tardar mas de 50 milisegundos"
	| customerBook|
	
	customerBook := CustomerBook  new.
	
	self verificarSiSeRealiza: [customerBook addCustomerNamed: 'John Lennon'] enMenosDe:50.
						 
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'sabrina castro 4/13/2018 00:49:43'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	self verificarSiSeRealiza: [customerBook removeCustomerNamed: paulMcCartney] enMenosDe:100.

	
! !

!IdiomTest methodsFor: 'testing' stamp: 'sabrina castro 4/13/2018 00:45:24'!
test03CanNotAddACustomerWithEmptyName 
	"no se puede agregar un cliente con nombre vacio"
	| customerBook |
			
	customerBook := CustomerBook new.
	
	self  verificarBloque: [customerBook addCustomerNamed: '']  tipoError: Error errores: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!IdiomTest methodsFor: 'testing' stamp: 'sabrina castro 4/13/2018 00:45:08'!
test04CanNotRemoveAnInvalidCustomer
	"eliminar un cliente invalido, uno que no este en la lista"
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self verificarBloque:[customerBook removeCustomerNamed: 'Paul McCartney'.]  tipoError: NotFound errores: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !

!IdiomTest methodsFor: 'testing' stamp: 'sabrina castro 4/13/2018 00:44:41'!
verificarBloque: unBloque tipoError: tipo errores: otroBloque
	[ unBloque value.
	self fail ]
		on: tipo 
		do: [ otroBloque]! !

!IdiomTest methodsFor: 'testing' stamp: 'sabrina castro 4/13/2018 00:49:12'!
verificarSiSeRealiza: unBloque enMenosDe: unTiempo
	"comment stating purpose of message"

	|millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	unBloque value.						 
	millisecondsAfterRunning := Time millisecondClockValue.
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < unTiempo.
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'sabrina castro 4/12/2018 19:59:26'!
addCustomerNamed: aName
	"agrega un cliente, verifica que no sea vacio sino exception, si ya esta incluido levanto excepcion de cliente ya existe, sino lo agrega"
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'sabrina castro 4/12/2018 20:00:36'!
removeCustomerNamed: aName
 	"intenta remover de la coleccion sino exception"
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
