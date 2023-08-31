Class {
	#name : #DoorWithCloser,
	#superclass : #Door,
	#instVars : [
		'delay',
		'delayedPull'
	],
	#category : #'PlayWithDoorSim-Core'
}

{ #category : #examples }
DoorWithCloser class >> example [
	"DoorWithCloser example"
	| door |
	(SystemWindow windowsIn: ActiveWorld satisfying: [:w | w model isKindOf: Transcript class])
		ifEmpty: [Transcript open] ifNotEmpty: [:ws | ws anyOne activate].
	door := DoorWithCloser new.
	Transcript cr; crShow: 'door is a DoorWithCloser with ', door delaySec printString, ' seconds delay...'.
	door knob turn. door push.
	Transcript crShow: 'door knob turn. door push; isOpen. => '; show: door isOpen.
	Transcript crShow: '0.1 second after'.
	0.1 seconds asDelay wait.
	Transcript show: ', door isOpen. => '; show: door isOpen.
	Transcript crShow: '0.4 seconds after'.
	0.3 seconds asDelay wait.
	Transcript show: ', door isClose. => '; show: door isClose.
	door knob turn. door push; delaySec: 0.6.
	Transcript crShow: 'door knob turn. door push; delaySec: 0.6; isOpen. => '; show: door isOpen.
	Transcript crShow: '0.4 second after'.
	0.4 seconds asDelay wait.
	Transcript show: ', door isClose. => '; show: door isClose.
	Transcript crShow: '0.7 seconds after'.
	0.3 seconds asDelay wait.
	Transcript show: ', door isClose. => '; show: door isClose
	
"door is a DoorWithCloser with 0.3 seconds delay...
door knob turn. door push; isOpen. => true
0.1 second after, door isOpen. => true
0.4 seconds after, door isClose. => true
door knob turn. door push; delaySec: 0.6; isOpen. => true
0.4 second after, door isClose. => false
0.7 seconds after, door isClose. => true"
]

{ #category : #accessing }
DoorWithCloser >> delaySec [
	^ delay asMilliSeconds / 1.0e3
]

{ #category : #accessing }
DoorWithCloser >> delaySec: num [
	delay := num seconds.
	self execDelayedPull
]

{ #category : #accessing }
DoorWithCloser >> execDelayedPull [
	self isOpen ifTrue: [
		delayedPull ifNotNil: [ delayedPull terminate ].
		delayedPull := [ delay asDelay wait. self pull ] fork
	]
]

{ #category : #initialization }
DoorWithCloser >> initialize [
	super initialize.
	delay := 0.3 seconds.
	delayedPull := nil
]

{ #category : #accessing }
DoorWithCloser >> push [
	super push.
	self execDelayedPull
]
