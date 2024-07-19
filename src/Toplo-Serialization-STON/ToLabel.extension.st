Extension { #name : #ToLabel }

{ #category : #'*Toplo-Serialization-STON' }
ToLabel >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	self userData at: #stonToLabelText ifPresent: [ :aText |
		self text: aText.
		self userData removeKey: #stonToLabelText ]
]

{ #category : #'*Toplo-Serialization-STON' }
ToLabel >> stonUserDataOn: aIdentityDictionary [

	super stonUserDataOn: aIdentityDictionary.
	aIdentityDictionary
		at: #stonToLabelText
		put: self text.
]
