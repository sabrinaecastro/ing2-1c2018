!classDefinition: #I category: #NumerosPeano!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosPeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #NumerosPeano!
I class
	instanceVariableNames: 'noSePuedeDividirPorUnNumeroMayor next numerosNegativosNoSoportados'!

!I class methodsFor: 'as yet unclassified' stamp: 'maxi 3/22/2018 21:51:18'!
* unNumeroDePeano
	^unNumeroDePeano.! !

!I class methodsFor: 'as yet unclassified' stamp: 'maxi 3/22/2018 21:06:46'!
+ unNumeroDePeano
	^unNumeroDePeano next.! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 17:00:59'!
- unNumeroDePeano
	self error: numerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 17:06:15'!
/ unNumeroDePeano
	unNumeroDePeano caseOf: {
		[ self ] -> [ ^ I ]}
		 otherwise: [ self error: noSePuedeDividirPorUnNumeroMayor ].! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 17:06:52'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^noSePuedeDividirPorUnNumeroMayor .! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 17:00:59'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ numerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'maxi 3/22/2018 21:23:37'!
next
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'Sabrina Castro 4/1/2018 01:18:17'!
previous
	^nil! !

I instVarNamed: 'noSePuedeDividirPorUnNumeroMayor' put: nil!
I instVarNamed: 'next' put: nil!
I instVarNamed: 'numerosNegativosNoSoportados' put: nil!

!classDefinition: #II category: #NumerosPeano!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosPeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #NumerosPeano!
II class
	instanceVariableNames: 'previous next noSePuedeDividirPorUnNumeroMayor'!

!II class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 14:51:50'!
* unNumerodePeano
	^ ((self previous) * unNumerodePeano) + unNumerodePeano ! !

!II class methodsFor: 'as yet unclassified' stamp: 'maxi 3/22/2018 21:09:14'!
+ unNumerodePeano
	^self previous + unNumerodePeano next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 15:08:11'!
- unNumerodePeano
	unNumerodePeano caseOf: { [I] -> [^self previous]} otherwise: [^(self previous) - unNumerodePeano previous ]! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 16:18:26'!
/ unNumerodePeano
	unNumerodePeano caseOf: {[self] -> [^I]. } otherwise:[ ^(I + ((self - unNumerodePeano) / unNumerodePeano)) ].! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 17:02:14'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ noSePuedeDividirPorUnNumeroMayor! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 15:56:44'!
next
	| n |
	n := next caseOf: {[nil] -> [self cloneNamed: (self name, 'I').]} otherwise: [next].
	n previous: self.
	next _ n.
	^next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'maxi 3/22/2018 21:21:21'!
previous
	^previous.! !

!II class methodsFor: 'as yet unclassified' stamp: 'maxi 3/22/2018 21:21:40'!
previous: a
	previous := a.! !

!II class methodsFor: 'as yet unclassified' stamp: 'maxi 3/22/2018 21:48:25'!
removeAllNext
	next ifNotNil:[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
		].! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 4/2/2018 15:50:40'!
removeNext
	next:=nil! !

II instVarNamed: 'previous' put: I!
II instVarNamed: 'next' put: III!
II instVarNamed: 'noSePuedeDividirPorUnNumeroMayor' put: nil!

!classDefinition: #III category: #NumerosPeano!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosPeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #NumerosPeano!
III class
	instanceVariableNames: 'previous next noSePuedeDividirPorUnNumeroMayor'!

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
* unNumerodePeano
	^ ((self previous) * unNumerodePeano) + unNumerodePeano ! !

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
+ unNumerodePeano
	^self previous + unNumerodePeano next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
- unNumerodePeano
	unNumerodePeano caseOf: { [I] -> [^self previous]} otherwise: [^(self previous) - unNumerodePeano previous ]! !

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
/ unNumerodePeano
	unNumerodePeano caseOf: {[self] -> [^I]. } otherwise:[ ^(I + ((self - unNumerodePeano) / unNumerodePeano)) ].! !

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ noSePuedeDividirPorUnNumeroMayor! !

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
next
	| n |
	n := next caseOf: {[nil] -> [self cloneNamed: (self name, 'I').]} otherwise: [next].
	n previous: self.
	next _ n.
	^next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
previous
	^previous.! !

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
previous: a
	previous := a.! !

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
removeAllNext
	next ifNotNil:[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
		].! !

!III class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:49:58'!
removeNext
	next:=nil! !

III instVarNamed: 'previous' put: II!
III instVarNamed: 'next' put: IIII!
III instVarNamed: 'noSePuedeDividirPorUnNumeroMayor' put: nil!

!classDefinition: #IIII category: #NumerosPeano!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosPeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #NumerosPeano!
IIII class
	instanceVariableNames: 'previous next noSePuedeDividirPorUnNumeroMayor'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
* unNumerodePeano
	^ ((self previous) * unNumerodePeano) + unNumerodePeano ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
+ unNumerodePeano
	^self previous + unNumerodePeano next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
- unNumerodePeano
	unNumerodePeano caseOf: { [I] -> [^self previous]} otherwise: [^(self previous) - unNumerodePeano previous ]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
/ unNumerodePeano
	unNumerodePeano caseOf: {[self] -> [^I]. } otherwise:[ ^(I + ((self - unNumerodePeano) / unNumerodePeano)) ].! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ noSePuedeDividirPorUnNumeroMayor! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
next
	| n |
	n := next caseOf: {[nil] -> [self cloneNamed: (self name, 'I').]} otherwise: [next].
	n previous: self.
	next _ n.
	^next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
previous
	^previous.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
previous: a
	previous := a.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
removeAllNext
	next ifNotNil:[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
		].! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'sabrina castro 4/2/2018 18:50:04'!
removeNext
	next:=nil! !

IIII instVarNamed: 'previous' put: III!
IIII instVarNamed: 'next' put: nil!
IIII instVarNamed: 'noSePuedeDividirPorUnNumeroMayor' put: nil!