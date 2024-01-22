Extension { #name : #ToElement }

{ #category : #'*Toplo-Serializer' }
ToElement >> isLeaf [

	^ true.
]

{ #category : #'*Toplo-Serializer' }
ToElement >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	self userData at: #tooltipContent ifPresent: [ :anElement |
		self tooltipContent: anElement.
		self userData removeKey: #tooltipContent ].
	self userData at: #stonLabeledIcon ifPresent: [ :anElement |
		self labeledIcon label: anElement label.
		self labeledIcon icon: anElement icon.
		self labeledIcon interspace: anElement interspace.
		self labeledIcon iconContainerWidth: anElement iconContainerWidth.
		self labeledIcon iconContainerHeight: anElement iconContainerHeight.
		self labeledIcon flexible: anElement flexible.
		self labeledIcon orientation: anElement orientation.
		self labeledIcon direction: anElement direction.
		
		self userData removeKey: #stonLabeledIcon
		 ]
]

{ #category : #'*Toplo-Serializer' }
ToElement >> stonUserDataOn: aIdentityDictionary [

	super stonUserDataOn: aIdentityDictionary.
	"TToEnableable"
	self userData
		at: #enabled
		ifPresent: [ :id | aIdentityDictionary at: #enabled put: id ].

	"LabeledIcon"
	(self class usesTrait: TToElementWithLabeledIcon) ifTrue: [ aIdentityDictionary at: #stonLabeledIcon put: self labeledIcon ].

	"TToElementWithTooltip"
	self hasTooltip ifTrue: [
		aIdentityDictionary
			at: #tooltipContent
			put: (self rawTooltipWindowManager builder asContext tempAt: 3).
		self userData at: #tooltipPopupDelay ifPresent: [ :aDuration |
			aIdentityDictionary at: #tooltipPopupDelay put: aDuration ].
		self userData
			at: #closeTooltipWindowOnMouseLeave
			ifPresent: [ :aBoolean |
				aIdentityDictionary
					at: #closeTooltipWindowOnMouseLeave
					put: aBoolean ] ]
]
