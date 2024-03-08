Extension { #name : #TToElementWithPlaceholder }

{ #category : #'*Toplo-Serialization' }
TToElementWithPlaceholder >> isLeaf [

	self deprecated:'use shouldSerializedChildren with inverted boolean'.
	^ false
]

{ #category : #'*Toplo-Serialization' }
TToElementWithPlaceholder >> shouldSerializedChildren [

	^ true
]
