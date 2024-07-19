Extension { #name : #ToLabeledIcon }

{ #category : #'*Toplo-Serialization-STON' }
ToLabeledIcon >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	self userData at: #stonToLabel ifPresent: [ :toLabel |
		self label: toLabel.
		self userData removeKey: #stonToLabel ].
	self userData at: #stonToImage ifPresent: [ :toImage |
		self icon: toImage.
		self userData removeKey: #stonToImage ]
]

{ #category : #'*Toplo-Serialization-STON' }
ToLabeledIcon >> stonUserDataOn: aIdentityDictionary [

	super stonUserDataOn: aIdentityDictionary.
	aIdentityDictionary at: #stonToLabel put: self label.
	aIdentityDictionary at: #stonToImage put: self icon.
]
