Trait {
	#name : #TDoorWithStopper,
	#category : #'PlayWithDoorSim-Core'
}

{ #category : #accessing }
TDoorWithStopper >> beStopperedOff [
	self stoppered: false
]

{ #category : #accessing }
TDoorWithStopper >> beStopperedOn [
	self stoppered: true
]

{ #category : #accessing }
TDoorWithStopper >> pull [
	self stoppered ifFalse: [super pull]
]

{ #category : #accessing }
TDoorWithStopper >> push [
	self stoppered: false. super push
]
