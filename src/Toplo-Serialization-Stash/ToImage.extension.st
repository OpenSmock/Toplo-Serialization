Extension { #name : #ToImage }

{ #category : #'*Toplo-Serialization-Stash' }
ToImage >> stashAccessorsForInnerImage [

	<stashAccessors>
	self innerImage ifNil: [ ^ {  } ].
	^ {
		  #innerImage.
		  [ :e |
		  'innerImageDo: [ :i | i id: <1p> ]' expandMacrosWith:
			  self innerImage id ] onlySetOnStash }
]
