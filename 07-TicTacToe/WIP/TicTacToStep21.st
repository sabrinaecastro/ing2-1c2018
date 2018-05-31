!classDefinition: #TicTacToeTest category: #TicTacToStep21!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 09:59:04'!
test01

	|game|
	
	game := TicTacToe new.
	
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:20:33'!
test02

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: game Os isEmpty.
	
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:50:55'!
test03

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: 1 equals: game Os size.
	self assert: (game Os includes: 2@2).
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 00:35:43'!
test04

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TurnO notOTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: game Os isEmpty.
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 00:36:27'!
test05

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putOAt: 3@3]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TurnX notXTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:18:20'!
test06

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:37:38'!
test07

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:45:04'!
test08

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	self
	should: [game putOAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert:  game Os isEmpty.

		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:12:12'!
test09

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 3@3.
	self
	should: [game putOAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 2 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: (game Xs includes: 3@3).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:24:06'!
test10

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 3@3.
	
		self deny: game OHasWon.
		self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:41:54'!
test11

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@3.
	game putXAt: 1@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:42:33'!
test12

	|game|
	
	game := TicTacToe new.

	game putXAt: 2@1.
	game putOAt: 1@1.
	game putXAt: 2@2.
	game putOAt: 3@1.
	game putXAt: 2@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:46:05'!
test13

	|game|
	
	game := TicTacToe new.

	game putXAt: 3@1.
	game putOAt: 1@1.
	game putXAt: 3@2.
	game putOAt: 2@1.
	game putXAt: 3@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:52:28'!
test14

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 2@1.
	game putOAt: 3@3.
	game putXAt: 3@1.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:03:39'!
test15

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 2@3.
	game putXAt: 3@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:04:20'!
test16

	|game|
	
	game := TicTacToe new.

	game putXAt: 3@1.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 1@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:07:03'!
test17

	|game|
	
	game := TicTacToe new.

	game putXAt: 3@1.
	game putOAt: 1@1.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
		self assert: game OHasWon.
		self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 03:28:30'!
test18

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@1.	
	game putXAt: 1@3.

	self 
		should: [ game putOAt: 3@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: game Os size.
			self assert: (game Os includes: 2@1).
			self assert: (game Os includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 03:19:22'!
test19

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 1@3.

	self 
		should: [ game putXAt: 3@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Over canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: game Xs size.
			self assert: (game Xs includes: 2@2).
			self assert: (game Xs includes: 2@1).
			self assert: (game Xs includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:25:55'!
test20

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 1@3.
	game putOAt: 3@1.
	game putXAt: 2@1.	
	game putOAt: 2@3.
	game putXAt: 1@2.	
	game putOAt: 3@2.
	game putXAt: 3@3.
	
	self assert: game isOver.
	self deny: game XHasWon. 
	self deny: game OHasWon. 
	self assert: game isTied
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 15:10:03'!
test21

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@2.	
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	game putXAt: 3@2.	
	game putOAt: 3@1.
	game putXAt: 3@3.
	
	self assert: game isOver.
	self assert: game XHasWon. 
	self deny: game OHasWon. 
	self deny: game isTied
! !


!classDefinition: #TicTacToe category: #TicTacToStep21!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs turn winner status'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToe methodsFor: 'values' stamp: 'sc 5/30/2018 18:29:16'!
Os
	^os copy.! !

!TicTacToe methodsFor: 'values' stamp: 'sc 5/30/2018 18:28:30'!
Xs
	^xs copy.! !


!TicTacToe methodsFor: 'querys' stamp: 'sc 5/30/2018 18:37:29'!
hasCompletedColumn: positions
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ].! !

!TicTacToe methodsFor: 'querys' stamp: 'sc 5/30/2018 18:43:30'!
hasCompletedRow: positions
	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ].! !

!TicTacToe methodsFor: 'querys' stamp: 'sc 5/30/2018 18:38:43'!
hasDownDiagonal: positions
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ].! !

!TicTacToe methodsFor: 'querys' stamp: 'sc 5/30/2018 18:38:57'!
hasUpDiagonal: positions
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ].! !

!TicTacToe methodsFor: 'querys' stamp: 'sc 5/31/2018 02:27:21'!
hasWin: positions
	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]].! !


!TicTacToe methodsFor: 'initialization' stamp: 'sc 5/31/2018 04:32:37'!
initialize
	os:= Set new.
	xs:= Set new.
	turn:=TurnX new.
	status:= Started new.! !


!TicTacToe methodsFor: 'update' stamp: 'sc 5/30/2018 18:40:13'!
markWithOAt:aPosition
	^turn markWithOAt: aPosition inGame: self.! !

!TicTacToe methodsFor: 'update' stamp: 'sc 5/31/2018 02:08:44'!
markWithOIn: aPosition
	"do someting with aPosition"
	os add: aPosition.
	turn := TurnX  new.! !

!TicTacToe methodsFor: 'update' stamp: 'sc 5/31/2018 02:08:31'!
markWithXAt:aPosition
	^turn markWithXAt: aPosition inGame: self.! !

!TicTacToe methodsFor: 'update' stamp: 'sc 5/31/2018 02:08:20'!
markWithXIn: aPosition
	"do someting with aPosition"
	xs add: aPosition.
	turn := TurnO  new.! !


!TicTacToe methodsFor: 'play' stamp: 'sc 5/31/2018 04:10:13'!
OHasWon
	^status OHasWon.! !

!TicTacToe methodsFor: 'play' stamp: 'sc 5/31/2018 04:10:43'!
XHasWon
	^status XHasWon.! !

!TicTacToe methodsFor: 'play' stamp: 'sc 5/31/2018 02:26:04'!
isOver
	^self XHasWon or: [ self OHasWon or: [ self isTied ]].! !

!TicTacToe methodsFor: 'play' stamp: 'sc 5/31/2018 02:25:14'!
isPlayingO
	turn isPlayingX.! !

!TicTacToe methodsFor: 'play' stamp: 'sc 5/31/2018 02:25:04'!
isPlayingX
	turn isPlayingX.! !

!TicTacToe methodsFor: 'play' stamp: 'sc 5/31/2018 02:26:20'!
isTied
	^xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]] ." and: [ self YHasWon not ]]]"! !

!TicTacToe methodsFor: 'play' stamp: 'sc 5/31/2018 04:48:11'!
putOAt: aPosition
	status playIfNotOver .
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	turn markWithOAt: aPosition inGame:self. 
	(self hasWin: os) ifTrue: [^status := WinnerO new].
	(os size =4 ) ifTrue: [ status := Tied new].
! !

!TicTacToe methodsFor: 'play' stamp: 'sc 5/31/2018 04:47:46'!
putXAt: aPosition
	status playIfNotOver .
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].	
	turn markWithXAt:aPosition inGame:self.
	(self hasWin: xs) ifTrue: [^status := WinnerX new].
	(xs size = 5) ifTrue: [ status := Tied new].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToStep21!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeStatus category: #TicTacToStep21!
Object subclass: #TicTacToeStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeStatus methodsFor: 'as yet unclassified' stamp: 'MG 5/28/2018 21:00:47'!
hasPlayerOWon
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'as yet unclassified' stamp: 'MG 5/28/2018 21:00:44'!
hasPlayerXWon
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'as yet unclassified' stamp: 'MG 5/28/2018 21:00:22'!
isOver
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'as yet unclassified' stamp: 'MG 5/28/2018 21:00:09'!
isPlayingO
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'as yet unclassified' stamp: 'MG 5/28/2018 21:00:03'!
isPlayingX
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'as yet unclassified' stamp: 'MG 5/28/2018 21:00:27'!
isTied
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'as yet unclassified' stamp: 'MG 5/28/2018 20:59:47'!
markWithOAt: aPosition
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'as yet unclassified' stamp: 'MG 5/28/2018 20:59:40'!
markWithXAt: aPosition
	self subclassResponsibility ! !


!classDefinition: #Over category: #TicTacToStep21!
TicTacToeStatus subclass: #Over
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!Over methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:49:47'!
isOver
	self subclassResponsibility .! !

!Over methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:49:58'!
playIfNotOver
 	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Over class' category: #TicTacToStep21!
Over class
	instanceVariableNames: ''!

!Over class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 03:29:14'!
canNotPlayWhenGameIsOverErrorMessage
	^'Can not play when game is over'.! !


!classDefinition: #Tied category: #TicTacToStep21!
Over subclass: #Tied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!Tied methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:13:29'!
OHasWon
	^false.! !

!Tied methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:13:23'!
XHasWon
	^false.! !

!Tied methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 03:00:30'!
isOver
	^true.! !

!Tied methodsFor: 'as yet unclassified' stamp: 'MG 5/28/2018 21:12:32'!
isTied
	^ True.! !

!Tied methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:37:27'!
layIfNotOver
 	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage.! !

!Tied methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:22:06'!
playIfNotOver
 	^false.! !


!classDefinition: #WinnerO category: #TicTacToStep21!
Over subclass: #WinnerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!WinnerO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:12:07'!
OHasWon
	^true.! !

!WinnerO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:11:50'!
XHasWon
	^false.! !

!WinnerO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 02:54:25'!
isOver
	^true.! !

!WinnerO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 03:15:59'!
isTied
	^ True.! !

!WinnerO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:23:58'!
playIfNotOver
 	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #WinnerX category: #TicTacToStep21!
Over subclass: #WinnerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!WinnerX methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:11:24'!
OHasWon
	^false.! !

!WinnerX methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:11:10'!
XHasWon
	^true.! !

!WinnerX methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 02:54:32'!
isOver
	^true.! !

!WinnerX methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 03:01:22'!
isTied
	^ True.! !

!WinnerX methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:23:48'!
playIfNotOver
 	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #Started category: #TicTacToStep21!
TicTacToeStatus subclass: #Started
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!Started methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:41:29'!
OHasWon
	^false.! !

!Started methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:41:39'!
XHasWon
	^false.! !

!Started methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 04:38:30'!
playIfNotOver
 	^false.! !


!classDefinition: #TurnO category: #TicTacToStep21!
TicTacToeStatus subclass: #TurnO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TurnO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 00:28:59'!
isPlayingO
	^true.! !

!TurnO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 02:00:33'!
isPlayingX
	^false. ! !

!TurnO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 01:52:32'!
markWithOAt: aPosition inGame: aGame
	^aGame markWithOIn: aPosition.! !

!TurnO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 01:59:20'!
markWithXAt: aPosition inGame: aGame
	^self error: self class notOTurnErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnO class' category: #TicTacToStep21!
TurnO class
	instanceVariableNames: ''!

!TurnO class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 00:22:55'!
notOTurnErrorMessage

	^'Not O turn'! !

!TurnO class methodsFor: 'as yet unclassified' stamp: 'sc 5/30/2018 23:59:37'!
notXTurnErrorMessage

	^'Not X turn'! !


!classDefinition: #TurnX category: #TicTacToStep21!
TicTacToeStatus subclass: #TurnX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TurnX methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 02:00:48'!
isPlayingO
	^false.! !

!TurnX methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 00:46:00'!
isPlayingX
	^true.! !

!TurnX methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 01:37:50'!
markWithOAt: aPosition inGame: aGame
	^self error: self class notXTurnErrorMessage.! !

!TurnX methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 01:52:17'!
markWithXAt: aPosition inGame: aGame
	^aGame markWithXIn: aPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnX class' category: #TicTacToStep21!
TurnX class
	instanceVariableNames: ''!

!TurnX class methodsFor: 'as yet unclassified' stamp: 'sc 5/30/2018 23:59:51'!
notOTurnErrorMessage

	^'Not O turn'! !

!TurnX class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 00:19:08'!
notXTurnErrorMessage

	^'Not X turn'.! !
