Extension { #name : #ToBasicListElement }

{ #category : #'*Toplo-Serialization-Stash' }
ToBasicListElement >> stashRowNumbers [
	<stashAccessors>
	self toConfiguration rowNumbers ifFalse: [ ^ {  } ].
	^ { ([ :e | 'withRowNumbers' ] -> self) onlySetOnStash }
]

{ #category : #'*Toplo-Serialization-Stash' }
ToBasicListElement >> stashUseInfiniteLayout [
	<stashAccessors>
	^ { ([ :e | 'useInfiniteLayout: ' , self useInfiniteLayout printString ] -> self) onlySetOnStash }
]

{ #category : #'*Toplo-Serialization-Stash' }
ToBasicListElement >> stashUseScrollbar [
	<stashAccessors>
	^ { ([ :e | 'useScrollbar: ' , self useScrollbar printString ] -> self) onlySetOnStash }
]
