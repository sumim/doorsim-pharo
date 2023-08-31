Class {
	#name : #DoorWithStopper,
	#superclass : #Door,
	#traits : 'TDoorWithStopper',
	#classTraits : 'TDoorWithStopper classTrait',
	#instVars : [
		'stoppered'
	],
	#category : #'PlayWithDoorSim-Core'
}

{ #category : #examples }
DoorWithStopper class >> example [
	"DoorWithStopper example"
	| door |
	(SystemWindow windowsIn: ActiveWorld satisfying: [:w | w model isKindOf: Transcript class])
		ifEmpty: [Transcript open] ifNotEmpty: [:ws | ws anyOne activate].
	door := DoorWithStopper new.
	Transcript cr; crShow: 'door is a DoorWithStopper...'.
	door knob turn. door push.
	Transcript crShow: 'door knob turn. door push; isOpen. => '; show: door isOpen.
	door beStopperedOn; pull.
	Transcript crShow: 'door beStopperedOn; pull; isClose. => '; show: door isClose.
	door beStopperedOff; pull.
	Transcript crShow: 'door beStopperedOff; pull; isClose. => '; show: door isClose.
	door knob turn. door push.
	Transcript crShow: 'door knob turn. door push; isOpen. => '; show: door isOpen.
	door beStopperedOn; pull.
	Transcript crShow: 'door beStopperedOn; pull; isClose. => '; show: door isClose.
	door push; pull.
	Transcript crShow: 'door push; pull; isClose. => '; show: door isClose
	
"door is a DoorWithStopper...
door knob turn. door push; isOpen. => true
door beStopperedOn; pull; isClose. => false
door beStopperedOff; pull; isClose. => true
door knob turn. door push; isOpen. => true
door beStopperedOn; pull; isClose. => false
door push; pull; isClose. => true"
]

{ #category : #accessing }
DoorWithStopper >> stoppered [
	^ stoppered
]

{ #category : #accessing }
DoorWithStopper >> stoppered: bool [
	stoppered := bool
]
