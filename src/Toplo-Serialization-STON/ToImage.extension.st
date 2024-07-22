Extension { #name : #ToImage }

{ #category : #'*Toplo-Serialization-STON' }
ToImage >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	self userData at: #stonInnerImage ifPresent: [ :toInnerImage |
		self innerImage: toInnerImage.
		self userData removeKey: #stonInnerImage ]
]

{ #category : #'*Toplo-Serialization-STON' }
ToImage >> stonUserDataOn: aIdentityDictionary [

	super stonUserDataOn: aIdentityDictionary.
	aIdentityDictionary at: #stonInnerImage put: self innerImage
]
