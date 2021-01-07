"
A DayTwoTest is a test class for testing the behavior of DayTwo
"
Class {
	#name : #DayTwoTest,
	#superclass : #TestCase,
	#instVars : [
		'sut'
	],
	#category : #'AdventOfCode-Tests'
}

{ #category : #running }
DayTwoTest >> setUp [
	super setUp.
	sut := DayTwo new.
]

{ #category : #tests }
DayTwoTest >> testSolveFirst [
	"test the solve first implementor"
	| entries solution result |
	entries := #(
'1-3 a: abcde'
'1-3 b: cdefg'
'2-9 c: ccccccccc').
	result := sut solveFirst: entries.
	solution := 2.
	self assert: result equals: solution.
]
