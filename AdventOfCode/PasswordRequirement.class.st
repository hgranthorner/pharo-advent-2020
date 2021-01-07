"
An object that contains the requirement of a password a la the day two puzzles.

Puzzle two:

Each policy actually describes two positions in the password, where 1 means the first character, 2 means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept of ""index zero""!) Exactly one of these positions must contain the given letter. Other occurrences of the letter are irrelevant for the purposes of policy enforcement.

Given the same example list from above:
"
Class {
	#name : #PasswordRequirement,
	#superclass : #Object,
	#instVars : [
		'min',
		'max',
		'letter'
	],
	#category : #AdventOfCode
}

{ #category : #'instance creation' }
PasswordRequirement class >> fromString: str [
	| req min max letter |
	req := self new.
	min := (str copyUpTo: $-) asNumber.
	max := ((str copyAfter: $-)  copyUpTo: Character space) asNumber.
	letter := (str copyAfter: Character space) copyUpTo: $:.
	req initializeWithMin: min max: max letter: letter.
	^ req.
]

{ #category : #initialization }
PasswordRequirement >> initializeWithMin: anInteger max: anInteger2 letter: aString [ 
	min := anInteger.
	max := anInteger2.
	letter := aString first.
]

{ #category : #validation }
PasswordRequirement >> validateByIndex: str [
	| first second |
	first := str at: min.
	second := str at: max.
	^ (first = letter) xor: (second = letter).
]

{ #category : #validation }
PasswordRequirement >> validateMinMax: password [
	| count |
	count := password count: [ :char | char = letter ].
	^ count between: min and: max.
]
