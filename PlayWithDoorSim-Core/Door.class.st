Class {
	#name : #Door,
	#superclass : #Object,
	#instVars : [
		'knob',
		'closed'
	],
	#category : #'PlayWithDoorSim-Core'
}

{ #category : #examples }
Door class >> example [
	"Door example"
	| door |
	(SystemWindow windowsIn: ActiveWorld satisfying: [:w | w model isKindOf: Transcript class])
		ifEmpty: [Transcript open] ifNotEmpty: [:ws | ws anyOne activate].
	door := Door new.
	Transcript clear; show: 'door is a Door...'.
	door knob turn.
	Transcript crShow: 'door knob turn. door canBeOpen. => '; show: door canBeOpen.
	door knob unturn.
	Transcript crShow: 'door knob unturn. door canBeOpen. => '; show: door canBeOpen.
	door push.
	Transcript crShow: 'door push; isOpen. => '; show: door isOpen.
	door knob turn. door push.
	Transcript crShow: 'door knob turn. door push; isOpen. => '; show: door isOpen.
	door pull.
	Transcript crShow: 'door pull; isClose. => '; show: door isClose.
	Transcript crShow: 'door canBeOpen. => '; show: door canBeOpen
	
"door is a Door...
door knob turn. door canBeOpen. => true
door knob unturn. door canBeOpen. => false
door push; isOpen. => false
door knob turn. door push; isOpen. => true
door pull; isClose. => true
door canBeOpen. => false"
]

{ #category : #testing }
Door >> canBeOpen [
	^ self isOpen or: [ knob isLatched not ]
]

{ #category : #initialization }
Door >> initialize [
	knob := Knob newFor: self.
	closed := true
]

{ #category : #testing }
Door >> isClose [
	^ closed
]

{ #category : #testing }
Door >> isOpen [
	^ closed not
]

{ #category : #accessing }
Door >> knob [
	^ knob
]

{ #category : #accessing }
Door >> pull [
	closed := true.
	knob unturn
]

{ #category : #accessing }
Door >> push [
	self canBeOpen ifTrue: [ closed := false ]
]
