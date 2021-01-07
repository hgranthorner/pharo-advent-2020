"
Solution for the day one puzzles.

Puzzle one: given a list of integers and a target integer, find the two integers in the list that add up to the target. Return those two integers multiplied together.

Puzzle two: given a list of integers and a target integer, find the three integers in the list that add up to the target. Return those three integers multiplied together.
"
Class {
	#name : #DayOne,
	#superclass : #Object,
	#category : #AdventOfCode
}

{ #category : #solutions }
DayOne >> solveFirst: aCollection target: target [
	| sorted start end startEl endEl sum |
	sorted := aCollection asSortedCollection.
	start := 1.
	end := aCollection count: [ :each | true ].
	[ start < end ] whileTrue: [ 
		startEl := sorted at: start.
		endEl := sorted at: end.
		sum := startEl + endEl.
		sum ifEquals: target do: [ ^ startEl * endEl ].
		sum ifLessThan: target do: [ start := start + 1 ].
		sum ifGreaterThan: target do: [ end := end - 1 ].
	].
]

{ #category : #solutions }
DayOne >> solveSecond: entries target: target [ 
	| set start end firstIterator secondIterator sum |
	set := entries asSet.
	start := 1.
	end := entries count: [ :each | true ].
	start to: end do: [ :begin |
		firstIterator := begin.
		secondIterator := start + 1.
		firstIterator to: (end - 1) do: [ :first |
			secondIterator to: end do: [ :second |
				sum := (entries at: first) + (entries at: second).
				(set includes: (target - sum)) ifTrue: [ ^ (entries at: first) * (entries at: second) * (target - sum) ].
			].
		].
	].
]
