Extension { #name : #ToElement }

{ #category : #'*Toplo-Serialization-STON' }
ToElement >> stonPostReferenceResolution [

	super stonPostReferenceResolution.
	self userData at: #tooltipContent ifPresent: [ :anElement |
		self tooltipContent: anElement.
		self userData removeKey: #tooltipContent ].
]

{ #category : #'*Toplo-Serialization-STON' }
ToElement >> stonUserDataOn: aIdentityDictionary [

	super stonUserDataOn: aIdentityDictionary.
	"TToEnableable"
	self userData
		at: #enabled
		ifPresent: [ :id | aIdentityDictionary at: #enabled put: id ].

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
