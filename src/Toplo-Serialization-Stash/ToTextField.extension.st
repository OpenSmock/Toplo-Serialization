Extension { #name : #ToTextField }

{ #category : #'*Toplo-Serialization-Stash' }
ToTextField >> stashPlaceholder [

	<stashAccessors>
	self userData at: #placeholder ifAbsent: [ ^ {  } ].
	^ { ([ :e |
		   ' placeholderText: '''
		   , (BlTextNonPrintableCharacterPrinter print:
				    (self userData at: #placeholder) children first children first
					    text) , ''''] -> self) onlySetOnStash }
]
