Extension { #name : #ToSwitchIcon }

{ #category : #'*Toplo-Serialization-Stash' }
ToSwitchIcon >> stashChecked [
	<stashAccessors>
	^ { ([ :e | 'checked: ' , self checked printString ] -> self) onlySetOnStash }
]
