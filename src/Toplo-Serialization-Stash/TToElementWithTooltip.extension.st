Extension { #name : #TToElementWithTooltip }

{ #category : #'*Toplo-Serialization-Stash' }
TToElementWithTooltip >> stashAccessorsForTToElementWithTooltip [

	<stashAccessors>

	self hasTooltip ifFalse: [ ^ {  } ].
	^ { #tooltipBuilder. #closeTooltipWindowOnMouseLeave.
	  #tooltipPopupDelay }
]
