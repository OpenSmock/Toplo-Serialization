Extension { #name : #ToElement }

{ #category : #'*Toplo-Serialization' }
ToElement >> shouldSerializedChildren [
	"Toplo elements should not serialize children by default. Manage exeptions in subclasses."

	^ (self class == ToElement)
]
