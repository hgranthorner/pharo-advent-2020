"
An object that contains the requirement of a password a la the day two puzzles.
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
PasswordRequirement >> validate: password [
	| count |
	count := password count: [ :char | char = letter ].
	^ count between: min and: max.
]
