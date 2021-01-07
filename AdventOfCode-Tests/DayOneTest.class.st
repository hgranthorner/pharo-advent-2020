"
A DayOneTest is a test class for testing the behavior of DayOne
"
Class {
	#name : #DayOneTest,
	#superclass : #TestCase,
	#instVars : [
		'sut'
	],
	#category : #'AdventOfCode-Tests'
}

{ #category : #running }
DayOneTest >> setUp [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	super setUp.
	sut := DayOne new.
]

{ #category : #tests }
DayOneTest >> testSolveFirst [
	"test the solve first implementor"
	| entries target solution result |
	entries := #(1721
979
366
299
675
1456).
	target := 2020.
	result := sut solveFirst: entries target: target.
	solution := 514579.
	self assert: result equals: solution.
	entries := #(
979
299
366
675
1456
1721).
	self assert: result equals: solution.
]

{ #category : #tests }
DayOneTest >> testSolveFirstAgain [
	"test the solve first implementor"
	| entries target solution result |
	entries := #(1721
675
979
299
366
1456).
	target := 2020.
	result := sut solveFirst: entries target: target.
	solution := 514579.
	self assert: result equals: solution.
]

{ #category : #tests }
DayOneTest >> testSolveSecond [
	| entries target solution result |
	entries := #(1721
979
366
299
675
1456).
	target := 2020.
	result := sut solveSecond: entries target: target.
	solution := 241861950.
	self assert: result equals: solution.
]
