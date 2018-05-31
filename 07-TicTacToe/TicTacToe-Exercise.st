!classDefinition: #TicTacToeTest category: #'TicTacToe-Exercise'!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:46:05'!
test01EmptyGameHasNoPlays
	| game |
	game _ TicTacToe new.
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:47:39'!
test02AfterXPlaysFirstTimeIsOnePlay
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:48:27'!
test03OCanPlayAfterX
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self
		assert: 1
		equals: game Os size.
	self assert: (game Os includes: 2 @ 2).! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:50:11'!
test04XCantPlayTwoTimesInARow
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TurnO notOTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:51:40'!
test05OCantPlayTwoTimesInARow
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putOAt: 3 @ 3 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TurnX notXTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:53:01'!
test06XCantMarkSameSpotTwice
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:53:42'!
test07XCantMarkASpotMarkedByO
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:54:33'!
test08OCantMarkASpotMarkedByX
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		should: [ game putOAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:55:22'!
test09OCantMarkSameSpotTwice
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 3 @ 3.
	self
		should: [ game putOAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: (game Xs includes: 3 @ 3).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 15:58:58'!
test10NoWinnerWhenTwoPlaysEach
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 3.
	self deny: game OHasWon.
	self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:00:14'!
test11XWonHorizontalFirstLine
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 3.
	game putXAt: 1 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:01:01'!
test12XWonHorizontalMiddleLine
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:03:04'!
test13XWonHorizontalLastLine
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 3 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:02:48'!
test14XWonVerticalFirstLine
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 3.
	game putXAt: 3 @ 1.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:04:03'!
test15XWonDiagonalDown
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 2 @ 3.
	game putXAt: 3 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:04:42'!
test16XWonDiagonalUp
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 1 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:05:31'!
test17OWonDiagonalUp
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 3.
	game putOAt: 1 @ 3.
	self assert: game OHasWon.
	self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:06:54'!
test18CantPlayWhenXHasWon
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	self
		should: [ game putOAt: 3 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Os size.
			self assert: (game Os includes: 2 @ 1).
			self assert: (game Os includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:09:41'!
test19CantPlayWhenOHasWon
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 3.
	self
		should: [ game putXAt: 3 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: Over canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 3
				equals: game Xs size.
			self assert: (game Xs includes: 2 @ 2).
			self assert: (game Xs includes: 2 @ 1).
			self assert: (game Xs includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:10:11'!
test20GameIsTied
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 2 @ 3.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 2.
	game putXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game XHasWon.
	self deny: game OHasWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'MG 5/31/2018 16:11:37'!
test21GameIsOverWhenThereIsAWinner
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	game putXAt: 3 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 3 @ 3.
	self assert: game isOver.
	self assert: game XHasWon.
	self deny: game OHasWon.
	self deny: game isTied.! !


!classDefinition: #TicTacToe category: #'TicTacToe-Exercise'!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs turn winner status'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

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

!classDefinition: 'TicTacToe class' category: #'TicTacToe-Exercise'!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeStatus category: #'TicTacToe-Exercise'!
Object subclass: #TicTacToeStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

!TicTacToeStatus methodsFor: 'values' stamp: 'MG 5/28/2018 21:00:47'!
hasPlayerOWon
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'values' stamp: 'MG 5/28/2018 21:00:44'!
hasPlayerXWon
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'values' stamp: 'MG 5/28/2018 21:00:22'!
isOver
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'values' stamp: 'MG 5/28/2018 21:00:09'!
isPlayingO
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'values' stamp: 'MG 5/28/2018 21:00:03'!
isPlayingX
	self subclassResponsibility ! !

!TicTacToeStatus methodsFor: 'values' stamp: 'MG 5/28/2018 21:00:27'!
isTied
	self subclassResponsibility ! !


!classDefinition: #Over category: #'TicTacToe-Exercise'!
TicTacToeStatus subclass: #Over
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

!Over methodsFor: 'values' stamp: 'sc 5/31/2018 14:54:22'!
OHasWon
	self subclassResponsibility .! !

!Over methodsFor: 'values' stamp: 'sc 5/31/2018 14:54:41'!
XHasWon
	self subclassResponsibility .! !

!Over methodsFor: 'values' stamp: 'sc 5/31/2018 14:55:28'!
isOver
	self subclassResponsibility .! !

!Over methodsFor: 'values' stamp: 'sc 5/31/2018 14:55:36'!
isTied
	^ false.! !

!Over methodsFor: 'values' stamp: 'sc 5/31/2018 14:55:45'!
playIfNotOver
 	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Over class' category: #'TicTacToe-Exercise'!
Over class
	instanceVariableNames: ''!

!Over class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 03:29:14'!
canNotPlayWhenGameIsOverErrorMessage
	^'Can not play when game is over'.! !


!classDefinition: #Tied category: #'TicTacToe-Exercise'!
Over subclass: #Tied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

!Tied methodsFor: 'values' stamp: 'sc 5/31/2018 14:57:31'!
OHasWon
	^false.! !

!Tied methodsFor: 'values' stamp: 'sc 5/31/2018 14:57:44'!
XHasWon
	^false.! !

!Tied methodsFor: 'values' stamp: 'sc 5/31/2018 14:57:55'!
isOver
	^true.! !

!Tied methodsFor: 'values' stamp: 'sc 5/31/2018 14:57:37'!
isTied
	^true.! !

!Tied methodsFor: 'values' stamp: 'sc 5/31/2018 14:58:02'!
playIfNotOver
 	^false.! !


!classDefinition: #WinnerO category: #'TicTacToe-Exercise'!
Over subclass: #WinnerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

!WinnerO methodsFor: 'values' stamp: 'sc 5/31/2018 14:59:56'!
OHasWon
	^true.! !

!WinnerO methodsFor: 'values' stamp: 'sc 5/31/2018 15:00:04'!
XHasWon
	^false.! !

!WinnerO methodsFor: 'values' stamp: 'sc 5/31/2018 15:00:11'!
isOver
	^true.! !

!WinnerO methodsFor: 'values' stamp: 'sc 5/31/2018 15:00:26'!
isTied
	^false.! !

!WinnerO methodsFor: 'values' stamp: 'sc 5/31/2018 15:00:38'!
playIfNotOver
 	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #WinnerX category: #'TicTacToe-Exercise'!
Over subclass: #WinnerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

!WinnerX methodsFor: 'values' stamp: 'sc 5/31/2018 15:01:14'!
OHasWon
	^false.! !

!WinnerX methodsFor: 'values' stamp: 'sc 5/31/2018 15:01:22'!
XHasWon
	^true.! !

!WinnerX methodsFor: 'values' stamp: 'sc 5/31/2018 15:01:30'!
isOver
	^true.! !

!WinnerX methodsFor: 'values' stamp: 'sc 5/31/2018 15:01:41'!
isTied
	^false.! !

!WinnerX methodsFor: 'values' stamp: 'sc 5/31/2018 15:01:50'!
playIfNotOver
 	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #Started category: #'TicTacToe-Exercise'!
TicTacToeStatus subclass: #Started
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

!Started methodsFor: 'values' stamp: 'sc 5/31/2018 14:56:14'!
OHasWon
	^false.! !

!Started methodsFor: 'values' stamp: 'sc 5/31/2018 14:56:24'!
XHasWon
	^false.! !

!Started methodsFor: 'values' stamp: 'sc 5/31/2018 14:56:31'!
isOver
	^false.! !

!Started methodsFor: 'values' stamp: 'sc 5/31/2018 14:56:39'!
isTied
	^false.! !

!Started methodsFor: 'values' stamp: 'sc 5/31/2018 14:56:47'!
playIfNotOver
 	^false.! !


!classDefinition: #TurnO category: #'TicTacToe-Exercise'!
TicTacToeStatus subclass: #TurnO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

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

!classDefinition: 'TurnO class' category: #'TicTacToe-Exercise'!
TurnO class
	instanceVariableNames: ''!

!TurnO class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 00:22:55'!
notOTurnErrorMessage

	^'Not O turn'! !

!TurnO class methodsFor: 'as yet unclassified' stamp: 'sc 5/30/2018 23:59:37'!
notXTurnErrorMessage

	^'Not X turn'! !


!classDefinition: #TurnX category: #'TicTacToe-Exercise'!
TicTacToeStatus subclass: #TurnX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Exercise'!

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

!classDefinition: 'TurnX class' category: #'TicTacToe-Exercise'!
TurnX class
	instanceVariableNames: ''!

!TurnX class methodsFor: 'as yet unclassified' stamp: 'sc 5/30/2018 23:59:51'!
notOTurnErrorMessage

	^'Not O turn'! !

!TurnX class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 00:19:08'!
notXTurnErrorMessage

	^'Not X turn'.! !
