Extension { #name : #TToEnableable }

{ #category : #'*Toplo-Serialization-Stash' }
TToEnableable >> allSetterAndGettersOfTraitForMyStash: aToElement [

	aToElement isEnabled ifTrue: [ ^ {  } ].
	^ { #enabled: -> #isEnabled }
]
