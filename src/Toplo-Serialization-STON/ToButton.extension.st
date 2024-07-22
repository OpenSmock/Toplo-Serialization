Extension { #name : #ToButton }

{ #category : #'*Toplo-Serialization-STON' }
ToButton >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	
	"LabeledIcon"
	self userData at: #stonLabeledIcon ifPresent: [ :anElement |
		(self class slotNamed: #labeledIcon) write: anElement to: self.
		self addChild: anElement.
		self userData removeKey: #stonLabeledIcon ].
	
	"Checkable"
	self userData at: #stonIsCheckable ifAbsent: [ ^ self ].
	self beCheckable.
	self userData at: #stonChecked ifPresent: [ :aCheckValue |
		self checked: aCheckValue.
		self userData removeKey: #stonChecked ].
	self userData at: #stonGroup ifPresent: [ :aGroup |
		aGroup register: self.
		self userData removeKey: #stonGroup ]
]

{ #category : #'*Toplo-Serialization-STON' }
ToButton >> stonUserDataOn: aIdentityDictionary [

	super stonUserDataOn: aIdentityDictionary.

	"LabeledIcon"
	(self class usesTrait: TToElementWithLabeledIcon) ifTrue: [
		aIdentityDictionary at: #stonLabeledIcon put: self labeledIcon ].

	"Checkable"
	self isCheckable ifFalse: [ ^ self ].
	aIdentityDictionary at: #stonIsCheckable put: self isCheckable.
	aIdentityDictionary at: #stonChecked put: self isChecked.
	self group ifNotNil: [
		aIdentityDictionary at: #stonGroup put: self group ]
]
