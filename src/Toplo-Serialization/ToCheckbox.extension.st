Extension { #name : #ToCheckbox }

{ #category : #'*Toplo-Serialization' }
ToCheckbox >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	self userData at: #stonChecked ifPresent: [ :aCheckValue |
		self checked: aCheckValue.
		self userData removeKey: #stonChecked ].
	self userData at: #stonGroup ifPresent: [ :aGroup |
		aGroup add: self.
		self userData removeKey: #stonGroup ]
]

{ #category : #'*Toplo-Serialization' }
ToCheckbox >> stonUserDataOn: aIdentityDictionary [

	super stonUserDataOn: aIdentityDictionary.
	aIdentityDictionary at: #stonChecked put: self checked.
	self group ifNotNil: [ aIdentityDictionary at: #stonGroup put: self group. ]
]
