Extension { #name : #ToElement }

{ #category : #'*Toplo-Serialization' }
ToElement >> isLeaf [

	^ true.
]

{ #category : #'*Toplo-Serialization' }
ToElement >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	self userData at: #tooltipContent ifPresent: [ :anElement |
		self tooltipContent: anElement.
		self userData removeKey: #tooltipContent ].
	self userData at: #stonLabeledIcon ifPresent: [ :anElement |
		anElement icon ifNotNil: [ :toIcon | toIcon parent ifNotNil: [ :toParent | toParent removeChild: toIcon]. self labeledIcon icon: toIcon ].
		anElement label ifNotNil: [ :toLabel | toLabel parent ifNotNil: [ :toParent | toParent removeChild: toLabel]. self labeledIcon label: toLabel ].
		self labeledIcon interspace: anElement interspace.
		self labeledIcon iconContainerWidth: anElement iconContainerWidth.
		self labeledIcon iconContainerHeight: anElement iconContainerHeight.
		self labeledIcon flexible: anElement flexible.
		self labeledIcon orientation: anElement orientation.
		self labeledIcon direction: anElement direction.
		self userData removeKey: #stonLabeledIcon ]
]

{ #category : #'*Toplo-Serialization' }
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
