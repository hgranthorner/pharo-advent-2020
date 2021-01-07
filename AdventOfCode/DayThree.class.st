"
Solution for the day three puzzles.

Puzzle one: 

For example, suppose you have the following list:

1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc

Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a given letter must appear for the password to be valid. For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

In the above example, 2 passwords are valid. The middle password, cdefg, is not; it contains no instances of b, but needs at least 1. The first and third passwords are valid: they contain one a or nine c, both within the limits of their respective policies.

How many passwords are valid according to their policies?
"
Class {
	#name : #DayThree,
	#superclass : #Object,
	#category : #AdventOfCode
}

{ #category : #solutions }
DayThree >> solveFirst: input [
	| x max goRight char |
	max := input first count: [:_ | true].
	x := 1.
	goRight := 3.
	^ input count: [ :line |
		char := line at: x.
		x := x + goRight.
		x > max ifTrue: [ x := x - max ].
		char = $#
	].
]

{ #category : #solutions }
DayThree >> solveSecond: input moveRight: right moveDown: down [
	| x y max char trees line |
	max := input first count: [:_ | true].
	x := 1.
	y := 1.
	trees := 0.
	[ y <= (input count: [ :_ | true ]) ] whileTrue: [
		line := input at: y.
		char := line at: x.
		char = $# ifTrue: [ trees := trees + 1 ].
		y := y + down.
		x := x + right.
		x > max ifTrue: [ x := x - max ].
	].
	^ trees.
]
