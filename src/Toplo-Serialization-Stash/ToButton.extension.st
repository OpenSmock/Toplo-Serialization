Extension { #name : #ToButton }

{ #category : #'*Toplo-Serialization-Stash' }
ToButton >> stashToButtonCheckable [

	<stashAccessors>
	self isCheckable ifFalse: [ ^ {  } ].
	^ { (#beCheckable -> self) onlySetOnStash }
]
