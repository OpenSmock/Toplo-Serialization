Extension { #name : #TToCheckable }

{ #category : #'*Toplo-Serialization-Stash' }
TToCheckable >> stashAccessorsForTToCheckable [

	<stashAccessors>
	| settersAndGetters |
	self class == ToTab ifTrue: [ ^ {  } ].
	self isCheckable ifFalse: [ ^ {  } ].
	
	settersAndGetters := OrderedCollection new.
	
	self class == ToToggleButton ifFalse: [ settersAndGetters add: #initializeCheckable onlySetOnStash ].
	self checked ifTrue: [ settersAndGetters add: #checked ].
	self group ifNotNil: [ settersAndGetters add: #group ].
	^ settersAndGetters
]
