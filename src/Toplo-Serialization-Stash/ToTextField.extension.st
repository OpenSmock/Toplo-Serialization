Extension { #name : #ToTextField }

{ #category : #'*Toplo-Serialization-Stash' }
ToTextField >> stashWrappingMode [
	<stashAccessors>
	self wrappingMode ifNil: [ ^ {  } ].
	^ { ([ :e | 'wrappingMode: ' , self wrappingMode printString ] -> self) onlySetOnStash }
]
