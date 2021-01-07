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
	entries := 'C:\Users\HHORNER\Personal\DayTwoData.txt' asFileReference contents lines. 
	result := sut solveFirst: entries.
	solution := 572.
	self assert: result equals: solution.
]
