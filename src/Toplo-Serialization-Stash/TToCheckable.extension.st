Extension { #name : #TToCheckable }

{ #category : #'*Toplo-Serialization-Stash' }
TToCheckable >> stashAccessorsForTToCheckable [

	<stashAccessors>
	| settersAndGetters |
	self isCheckable ifFalse: [ ^ {  } ].
	settersAndGetters := OrderedCollection new.
	settersAndGetters add: #initializeCheckable onlySetOnStash.
	self checked ifTrue: [ settersAndGetters add: #checked ].
	self group ifNotNil: [ settersAndGetters add: #group ].
	^ settersAndGetters
]
