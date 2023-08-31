Class {
	#name : #DoorWithCloserStopper,
	#superclass : #DoorWithCloser,
	#traits : 'TDoorWithStopper @ {#basicBeStopperedOff->#beStopperedOff}',
	#classTraits : 'TDoorWithStopper classTrait',
	#instVars : [
		'stoppered'
	],
	#category : #'PlayWithDoorSim-Core'
}

{ #category : #examples }
DoorWithCloserStopper class >> example [
	"DoorWithCloserStopper example"
	| door |
	(SystemWindow windowsIn: ActiveWorld satisfying: [:w | w model isKindOf: Transcript class])
		ifEmpty: [Transcript open] ifNotEmpty: [:ws | ws anyOne activate].
	door := DoorWithCloserStopper new.
	Transcript cr; crShow: 'door is a DoorWithStopperCloser with ', door delaySec printString, ' seconds delay...'.
	door knob turn. door push.
	Transcript crShow: 'door knob turn. door push; isOpen. => '; show: door isOpen.
	door beStopperedOn.
	Transcript crShow: 'door beStopperedOn. then 0.4 seconds after'.
	0.4 seconds asDelay wait.
	Transcript show: ', door isOpen. => '; show: door isOpen.
	door beStopperedOff.
	Transcript crShow: 'door beStopperedOff. then 0.4 seconds after'.
	0.4 seconds asDelay wait. door push.
	Transcript show: ', door isClose. => '; show: door isClose.
	door knob turn. door push.
	Transcript crShow: 'door knob turn. door push; isOpen. => '; show: door isOpen.
	door beStopperedOn.
	Transcript crShow: 'door beStopperedOn. then 0.4 seconds after'.
	0.4 seconds asDelay wait.
	Transcript show: ', door isOpen. => '; show: door isOpen.
	door push.
	Transcript crShow: 'door push. then 0.4 seconds after'.
	0.4 seconds asDelay wait. door push.
	Transcript show: ', door isClose. => '; show: door isClose

"door is a DoorWithStopperCloser with 0.3 seconds delay...
door knob turn. door push; isOpen. => true
door beStopperedOn. then 0.4 seconds after, door isOpen. => true
door beStopperedOff. then 0.4 seconds after, door isClose. => true
door knob turn. door push; isOpen. => true
door beStopperedOn. then 0.4 seconds after, door isOpen. => true
door push. then 0.4 seconds after, door isClose. => true"
]

{ #category : #accessing }
DoorWithCloserStopper >> beStopperedOff [
	self basicBeStopperedOff. self execDelayedPull
]

{ #category : #accessing }
DoorWithCloserStopper >> stoppered [
	^ stoppered
]

{ #category : #accessing }
DoorWithCloserStopper >> stoppered: bool [
	stoppered := bool
]
