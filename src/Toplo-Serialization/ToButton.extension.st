Extension { #name : #ToButton }

{ #category : #'*Toplo-Serialization' }
ToButton >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	self userData at: #stonLabeledIcon ifPresent: [ :anElement |
		(self class slotNamed: #labeledIcon) write: anElement to: self.
		self addChild: anElement.
		self userData removeKey: #stonLabeledIcon ]
]

{ #category : #'*Toplo-Serialization' }
ToButton >> stonUserDataOn: aIdentityDictionary [

	super stonUserDataOn: aIdentityDictionary.

	"LabeledIcon"
	(self class usesTrait: TToElementWithLabeledIcon) ifTrue: [
		aIdentityDictionary at: #stonLabeledIcon put: self labeledIcon ]
]
