Extension { #name : #TToCheckable }

{ #category : #'*Toplo-Serialization-Stash' }
TToCheckable >> allSetterAndGettersOfTraitForMyStash: aToElement [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	settersAndGetters add: #checked.
	settersAndGetters add: #group.
	^ settersAndGetters
]
