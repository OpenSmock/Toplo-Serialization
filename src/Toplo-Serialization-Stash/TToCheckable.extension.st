Extension { #name : #TToCheckable }

{ #category : #'*Toplo-Serialization-Stash' }
TToCheckable >> allSetterAndGettersOfTraitForMyStash: aToElement [

	| settersAndGetters |
	self isCheckable ifFalse: [ ^ {  } ].
	settersAndGetters := OrderedCollection new.
	settersAndGetters add: #checked.
	settersAndGetters add: #group.
	^ settersAndGetters
]
