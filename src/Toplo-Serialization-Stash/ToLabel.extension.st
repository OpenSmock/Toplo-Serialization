Extension { #name : #ToLabel }

{ #category : #'*Toplo-Serialization-Stash' }
ToLabel >> stashAccessorsForText [

	<stashAccessors>
	^ { ([ :e | 'text: (<1p>)' expandMacrosWith: e text asString ]) onlySetOnStash }
]
