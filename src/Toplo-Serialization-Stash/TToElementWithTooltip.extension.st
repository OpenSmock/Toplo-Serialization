Extension { #name : #TToElementWithTooltip }

{ #category : #'*Toplo-Serialization-Stash' }
TToElementWithTooltip >> allSetterAndGettersOfTraitForMyStash: aToElement [

	self hasTooltip ifFalse: [ ^ {  } ].
	^ { #tooltipBuilder. #closeTooltipWindowOnMouseLeave . #tooltipPopupDelay }
]
