!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/26/2017 15:10:54'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TicTacToe new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:35'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TicTacToe new.
	
	game markAll: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:31'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TicTacToe new.

	game markAll: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:28'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:23'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:19'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:16'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:12'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:08'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:04'!
test10XWinsWhenCompletesRowNumber1

	game _ TicTacToe new.

	game markAll: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:59'!
test11XWinsWhenCompletesRowNumber2

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:54'!
test12XWinsWhenCompletesRowNumber3

	game _ TicTacToe new.

	game markAll: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:50'!
test13XWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:45'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:41'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:35'!
test16OWinsWhenCompletesARow

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:31'!
test17OWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:25'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:20'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:15'!
test20OCanNotPlayWhenXWon

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:12'!
test21XCanNotPlayWhenOWon

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:08'!
test22GameCanEndUpTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:01'!
test23XCanWinOnLastEmptyPosition

	game _ TicTacToe new.

	game markAll: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:41:58'!
test24CanNotPlayWhenGameIsTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JG 5/12/2018 13:23:11'!
test25CanNotMarkOutsideBoard

	game _ TicTacToe new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:49:43'!
test26OCanNotMarkWhenGameIsOver

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !


!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:29'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #TicTacToeTestObserver category: #TicTacToe!
TestCase subclass: #TicTacToeTestObserver
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:23:33'!
test01ConsolePlayXNextO
	|console game stringAcc|
	game _ TicTacToe new.
	console := TicTacToeConsole with:game.
	game markWithXAt: 2@2.
	stringAcc _ ''.
	stringAcc := stringAcc, 'X marcó en 2@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.

	self assert: (console board = stringAcc).! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:24:01'!
test02ConsoleTwoPlays
	|console game stringAcc|
	game _ TicTacToe new.
	console := TicTacToeConsole with:game.
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	stringAcc _ ''.
	stringAcc := stringAcc, 'X marcó en 2@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 1@1'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	self assert: (console board = stringAcc).! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:24:34'!
test03ConsoleThreePlays
	|console game stringAcc|
	game _ TicTacToe new.
	console := TicTacToeConsole with:game.
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	stringAcc _ ''.
	stringAcc := stringAcc, 'X marcó en 2@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 1@1'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X marcó en 1@3'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.
	self assert: (console board =stringAcc ).! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:25:13'!
test04ConsoleWinnerX
	|console game stringAcc |
	game _ TicTacToe new.
	console := TicTacToeConsole with:game.
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	game markWithOAt: 1@2.
	game markWithXAt: 3@1.
	stringAcc _ ''.
	stringAcc := stringAcc, 'X marcó en 2@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 1@1'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X marcó en 1@3'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 1@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X marcó en 3@1'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Juego terminado - Ganó X!!'.
	self assert: (console board =stringAcc ).! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:25:38'!
test05ConsoleWinnerO
	|console game stringAcc |
	game _ TicTacToe new.
	console := TicTacToeConsole with:game.
	game markWithXAt: 1@2.
	game markWithOAt: 2@2.
	game markWithXAt: 1@3.
	game markWithOAt: 1@1.
	game markWithXAt: 2@3.
	game markWithOAt: 3@3.
	stringAcc _ ''.
	stringAcc := stringAcc, 'X marcó en 1@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 2@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X marcó en 1@3'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.	
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 1@1'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X marcó en 2@3'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.	
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 3@3'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Juego terminado - Ganó O!!'.
	self assert: (console board =stringAcc ).
! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:25:59'!
test06ConsoleTied
	|console game stringAcc |
	game _ TicTacToe new.
	console := TicTacToeConsole with:game.
	game markWithXAt: 1@2.
	game markWithOAt: 2@2.
	game markWithXAt: 1@3.
	game markWithOAt: 1@1.
	game markWithXAt: 3@3.
	game markWithOAt: 2@3.
	game markWithXAt: 2@1.
	game markWithOAt: 3@1.
	game markWithXAt: 3@2.
	stringAcc _ ''.
	stringAcc := stringAcc, 'X marcó en 1@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 2@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X marcó en 1@3'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.	
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 1@1'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X marcó en 3@3'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.	
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 2@3'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X marcó en 2@1'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando O'.	
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O marcó en 3@1'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Jugando X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X marcó en 3@2'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Estado: Juego terminado - Empate'.
	self assert: (console board =stringAcc ).! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:27:20'!
test07ViewPlayXNextO
	|view game stringAcc|
	game _ TicTacToe new.
	view _ TicTacToeView with:game.
	game markWithXAt: 2@2.
	stringAcc := ''.
	stringAcc := stringAcc, ' | | '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, ' |X| '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, ' | | '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Playing O'.
	self assert: (view board =stringAcc ).

! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:27:45'!
test08ViewTwoPlays
	|view game stringAcc|
	game _ TicTacToe new.
	view _ TicTacToeView with:game.
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	stringAcc := ''.
	stringAcc := stringAcc, ' | | '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, ' |X| '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O| | '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Playing X'.
	self assert: (view board =stringAcc ).

! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:28:16'!
test09ViewThreePlays
	|view game stringAcc|
	game _ TicTacToe new.
	view _ TicTacToeView with:game.
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	stringAcc := ''.
	stringAcc := stringAcc, 'X| | '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, ' |X| '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O| | '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Playing O'.
	self assert: (view board =stringAcc ).

! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:28:40'!
test10ViewWonX
	|view game stringAcc|
	game _ TicTacToe new.
	view _ TicTacToeView with:game.
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	game markWithOAt: 1@2.
	game markWithXAt: 3@1.
	stringAcc := ''.
	stringAcc := stringAcc, 'X| | '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O|X| '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O| |X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X Won'.
	self assert: (view board =stringAcc ).

! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:28:52'!
test11ViewWonO
	|view game stringAcc|
	game _ TicTacToe new.
	view _ TicTacToeView with:game.
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	game markWithOAt: 3@1.
	game markWithXAt: 1@2.
	game markWithOAt: 2@1.
	stringAcc := ''.
	stringAcc := stringAcc, 'X| | '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X|X| '.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O|O|O'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O Won'.
	self assert: (view board =stringAcc ).

! !

!TicTacToeTestObserver methodsFor: 'testing' stamp: 'sc 6/4/2018 01:29:01'!
test12ViewTied
	|view game stringAcc|
	game _ TicTacToe new.
	view _ TicTacToeView with:game.
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	game markWithOAt: 3@1.
	game markWithXAt: 2@1.
	game markWithOAt: 2@3.
	game markWithXAt: 1@2.
	game markWithOAt: 3@2.
	game markWithXAt: 3@3.
	stringAcc := ''.
	stringAcc := stringAcc, 'X|O|X'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'X|X|O'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, '-----'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'O|X|O'.
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, 'Empate'.
	self assert: (view board =stringAcc ).

! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'initialization' stamp: 'MG 6/2/2018 01:58:52'!
initialize
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	state _ PlayingX for: self.
	observers _ Set new.! !


!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:39'!
markAll: positions

	positions do: [ :aPosition | self markAt: aPosition ]! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:23'!
markAt: aPosition

	^state markAt: aPosition ! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:30:17'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:24:49'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.! !


!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:41:25'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	state := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self
	! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'MG 6/2/2018 01:51:59'!
markWithOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	observers collect: [ :anObserver |
		anObserver markWithOAt: aPosition ].
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'MG 6/2/2018 01:52:18'!
markWithXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	observers collect: [ :anObserver |
		anObserver markWithXAt: aPosition ].
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'sc 6/3/2018 19:19:35'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ 
		self markWinner: winnerState. 
		^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [
		self markTied. 
		^ GameTied ].
	self markNextPlaying: nextPlayingState.
	^ nextPlayingState.! !


!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TicTacToe methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TicTacToe methodsFor: 'game over testing - private' stamp: 'sc 6/2/2018 19:59:16'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3.! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'sc 6/2/2018 19:59:27'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'sc 6/2/2018 19:59:40'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'sc 6/2/2018 19:59:50'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'sc 6/2/2018 20:00:00'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'sc 6/2/2018 20:00:13'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'sc 6/2/2018 20:00:23'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'sc 6/2/2018 20:00:35'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'sc 6/2/2018 20:01:10'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !


!TicTacToe methodsFor: 'observers' stamp: 'sc 6/3/2018 19:19:52'!
markNextPlaying:nextPlayingState
	observers collect:[:anObserver | anObserver markNextPlaying: nextPlayingState].
! !

!TicTacToe methodsFor: 'observers' stamp: 'sc 6/3/2018 19:17:29'!
markTied
	observers collect: [:anObserver | anObserver markTied].! !

!TicTacToe methodsFor: 'observers' stamp: 'sc 6/3/2018 19:16:04'!
markWinner:winnerState
	observers collect: [:anObserver | anObserver markWinner: winnerState].! !

!TicTacToe methodsFor: 'observers' stamp: 'MG 6/2/2018 00:41:25'!
registerObserver: anObserver
	observers add: anObserver.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeObserver category: #TicTacToe!
Object subclass: #TicTacToeObserver
	instanceVariableNames: 'board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeObserver methodsFor: 'as yet unclassified' stamp: 'sc 6/3/2018 19:22:32'!
initializeWith: aGame
	self subclassResponsibility .! !

!TicTacToeObserver methodsFor: 'as yet unclassified' stamp: 'sc 6/3/2018 19:22:39'!
markNextPlaying: aPlaying
	self subclassResponsibility .! !

!TicTacToeObserver methodsFor: 'as yet unclassified' stamp: 'sc 6/3/2018 19:22:47'!
markTied
	self subclassResponsibility .! !

!TicTacToeObserver methodsFor: 'as yet unclassified' stamp: 'sc 6/3/2018 19:22:53'!
markWinner: winnerState
	self subclassResponsibility .! !

!TicTacToeObserver methodsFor: 'as yet unclassified' stamp: 'sc 6/3/2018 19:23:03'!
markWithOAt: aPosition
	self subclassResponsibility .! !

!TicTacToeObserver methodsFor: 'as yet unclassified' stamp: 'sc 6/3/2018 19:23:10'!
markWithXAt: aPosition
	self subclassResponsibility .! !


!classDefinition: #TicTacToeConsole category: #TicTacToe!
TicTacToeObserver subclass: #TicTacToeConsole
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsole methodsFor: 'initialize' stamp: 'sc 6/4/2018 01:35:48'!
initializeWith: aGame 
	board := OrderedCollection new.
	aGame registerObserver: self.! !


!TicTacToeConsole methodsFor: 'view' stamp: 'sc 6/4/2018 01:36:16'!
board
	|stringAcc|
	stringAcc _ ''.
	(1 to: (board size -1)) do: [ :indice | stringAcc := stringAcc, (board at:indice) asString . stringAcc := stringAcc, (String with: Character lf)].
	stringAcc := stringAcc, (board at:board size) asString. 
	^stringAcc.! !

!TicTacToeConsole methodsFor: 'view' stamp: 'sc 6/4/2018 01:36:34'!
markNextPlaying: aPlaying
	board addLast: ('Estado: Jugando ', (aPlaying playing asString) ).! !

!TicTacToeConsole methodsFor: 'view' stamp: 'sc 6/4/2018 01:36:39'!
markTied
	board addLast: 'Estado: Juego terminado - Empate'.
	! !

!TicTacToeConsole methodsFor: 'view' stamp: 'sc 6/4/2018 01:36:45'!
markWinner: winnerState
	board addLast: 'Estado: Juego terminado - Ganó ', (winnerState playing asString), '!!'.
	! !

!TicTacToeConsole methodsFor: 'view' stamp: 'sc 6/4/2018 01:36:51'!
markWithOAt: aPosition
	board addLast: 'O marcó en ' , aPosition asString.! !

!TicTacToeConsole methodsFor: 'view' stamp: 'sc 6/4/2018 01:36:56'!
markWithXAt: aPosition
	board addLast: 'X marcó en ' , aPosition asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeConsole class' category: #TicTacToe!
TicTacToeConsole class
	instanceVariableNames: ''!

!TicTacToeConsole class methodsFor: 'initialize' stamp: 'sc 5/31/2018 19:12:30'!
with: aGame
	^self new initializeWith:aGame.
! !


!classDefinition: #TicTacToeView category: #TicTacToe!
TicTacToeObserver subclass: #TicTacToeView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeView methodsFor: 'view' stamp: 'sc 6/4/2018 00:53:32'!
board
	|stringAcc lastRow|
	stringAcc _ ''.
	(3 to: 2 by:(-1)) do: [ :row |
		(1 to: 2) do: [ :column|	
			stringAcc := stringAcc, (board at:(((column -1)* 3) + row)).
			stringAcc := stringAcc, '|'
		]. 
		stringAcc := stringAcc, (board at:(((3 -1)* 3) + row)).
		stringAcc := stringAcc, (String with: Character lf).
		stringAcc := stringAcc, '-----'.
		stringAcc := stringAcc, (String with: Character lf).
	].
	lastRow _ 1.
	(1 to: 2) do: [ :column |
		stringAcc := stringAcc, (board at:(((column -1)* 3) + lastRow)).
		stringAcc := stringAcc, '|'
	]. 
	stringAcc := stringAcc, (board at:(((3 -1)* 3) + lastRow)).
	stringAcc := stringAcc, (String with: Character lf).
	stringAcc := stringAcc, (board at:10) asString.
	^stringAcc.! !

!TicTacToeView methodsFor: 'view' stamp: 'sc 6/4/2018 00:48:12'!
markNextPlaying: aPlaying
	board at:10 put:'Playing ', (aPlaying playing asString).! !

!TicTacToeView methodsFor: 'view' stamp: 'sc 6/4/2018 01:04:22'!
markTied
	board at:10 put: 'Empate'.! !

!TicTacToeView methodsFor: 'view' stamp: 'sc 6/4/2018 00:44:14'!
markWinner: winnerState
	board at:10 put:(winnerState playing asString), ' Won'.! !

!TicTacToeView methodsFor: 'view' stamp: 'MG 6/2/2018 11:49:51'!
markWithOAt: aPosition
	board at: 
		((((aPosition x) -1) * 3) + (aPosition y))
		put: 'O'.! !

!TicTacToeView methodsFor: 'view' stamp: 'MG 6/2/2018 11:50:04'!
markWithXAt: aPosition
	board at: 
		((((aPosition x) -1) * 3) + (aPosition y))
		put: 'X'.! !


!TicTacToeView methodsFor: 'initialization' stamp: 'sc 6/4/2018 01:30:54'!
initializeWith: aGame
	board := Dictionary new: 10.
	(1 to:9)do: [ :i | board at:i put:' '].
	aGame registerObserver: self.
		"(String with: Character lf),
		' | | ', (String with: Character lf),
		'-----', (String with: Character lf),
		' | | ', (String with: Character lf),
		'-----', (String with: Character lf),
		' | | ', (String with: Character lf)."! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeView class' category: #TicTacToe!
TicTacToeView class
	instanceVariableNames: ''!

!TicTacToeView class methodsFor: 'as yet unclassified' stamp: 'sc 6/3/2018 19:55:21'!
with:aGame
	^self new initializeWith:aGame.! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:31'!
markAt: aPosition

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:09'!
markAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayerOWon class' category: #TicTacToe!
PlayerOWon class
	instanceVariableNames: ''!

!PlayerOWon class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 20:57:00'!
playing
	^'O'.! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayerXWon class' category: #TicTacToe!
PlayerXWon class
	instanceVariableNames: ''!

!PlayerXWon class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 20:56:46'!
playing
	^'X'.! !


!classDefinition: #PlayingState category: #TicTacToe!
TicTacToeState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!classDefinition: #PlayingO category: #TicTacToe!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:13'!
markAt: aPosition

	^game markWithOAt: aPosition ! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!PlayingO methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 20:41:14'!
playing
	^'O'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingO class' category: #TicTacToe!
PlayingO class
	instanceVariableNames: ''!

!PlayingO class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 20:52:57'!
playing
	^'O'.! !


!classDefinition: #PlayingX category: #TicTacToe!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:17'!
markAt: aPosition

	^game markWithXAt: aPosition ! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingX class' category: #TicTacToe!
PlayingX class
	instanceVariableNames: ''!

!PlayingX class methodsFor: 'as yet unclassified' stamp: 'sc 5/31/2018 20:52:46'!
playing
	^'X'.! !
