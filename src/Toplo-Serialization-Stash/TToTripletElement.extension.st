Extension { #name : #TToTripletElement }

{ #category : #'*Toplo-Serialization-Stash' }
TToTripletElement >> stashAccessorsForTToTripletElement [

	<stashAccessors>

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self endAlignment ifNotNil: [ settersAndGetters add: #endAlignment ].
	self endElement ifNotNil: [ settersAndGetters add: #endElement ].
	self endFlexible ifTrue: [ settersAndGetters add: #endFlexible ].
	self endInterspace = 0 ifFalse: [
		settersAndGetters add: #endInterspace ].

	self flexible ifTrue: [ settersAndGetters add: #flexible ].
	self middleElement ifNotNil: [ settersAndGetters add: #middleElement ].

	self startAlignment ifNotNil: [
		settersAndGetters add: #startAlignment ].
	self startElement ifNotNil: [ settersAndGetters add: #startElement ].
	self startFlexible ifTrue: [ settersAndGetters add: #startFlexible ].
	self startInterspace = 0 ifFalse: [
		settersAndGetters add: #startInterspace ].

	^ settersAndGetters
]
