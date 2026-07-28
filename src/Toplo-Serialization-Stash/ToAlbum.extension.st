Extension { #name : #ToAlbum }

{ #category : #'*Toplo-Serialization-Stash' }
ToAlbum >> stashPlaceholder [

	<stashAccessors>
	self userData at: #placeholder ifAbsent: [ ^ {  } ].
	^ { ([ :e |
		   ' placeholderText: '''
		   , (BlTextNonPrintableCharacterPrinter print:
				    (self userData at: #placeholder) children first children first
					    text) , '''' ] -> self) onlySetOnStash }
]

{ #category : #'*Toplo-Serialization-Stash' }
ToAlbum >> stashUseScrollbar [

	<stashAccessors>
	^ { ([ :e | 'useScrollbar: ' , self useScrollbar printString ]
	   -> self) onlySetOnStash }
]
