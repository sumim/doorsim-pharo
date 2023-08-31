Class {
	#name : #Knob,
	#superclass : #Object,
	#instVars : [
		'door',
		'latched'
	],
	#category : #'PlayWithDoorSim-Core'
}

{ #category : #'as yet unclassified' }
Knob class >> newFor: door [ ^self new setDoor: door; yourself
]

{ #category : #initialization }
Knob >> initialize [
	latched := true
]

{ #category : #accessing }
Knob >> isLatched [
	^ latched
]

{ #category : #private }
Knob >> setDoor: myDoor [
	door := myDoor
]

{ #category : #accessing }
Knob >> turn [
	latched := false
]

{ #category : #accessing }
Knob >> unturn [
	door isClose ifTrue: [latched := true]
]
