Extension { #name : #ToLabel }

{ #category : #'*Toplo-Serializer' }
ToLabel >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	self userData at: #stonToLabelText ifPresent: [ :aText |
		self text: aText.
		self userData removeKey: #stonToLabelText ]
]

{ #category : #'*Toplo-Serializer' }
ToLabel >> stonUserDataOn: aIdentityDictionary [

	super stonUserDataOn: aIdentityDictionary.
	aIdentityDictionary
		at: #stonToLabelText
		put: self text.
]
