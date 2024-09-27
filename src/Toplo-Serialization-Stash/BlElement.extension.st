Extension { #name : #BlElement }

{ #category : #'*Toplo-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashAllStamps [

	<stashAccessors>
	self allStamps isEmpty ifTrue: [ ^ {  } ].
	^ self toStyleStore stampIndex allProperties collect: [ :assoc | | setter getter |
		setter := [ :element | 'addStamp: <1p> withValue:' expandMacrosWith: assoc value name ].
		getter := [ :element | assoc value value ].
		setter -> getter
		 ]

	
]

{ #category : #'*Toplo-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashAllTokens [

	<stashAccessors>
	self ensuredToStyleStore.
	self toStyleStore tokenPropertyIndex isEmpty ifTrue: [ ^ {  } ].
	^ self toStyleStore tokenPropertyIndex allProperties collect: [ :assoc | | setter getter |
		setter := [ :element | 'addTokenNamed: <1p> withValue:' expandMacrosWith: assoc value name ].
		getter := [ :element | assoc value value ].
		setter -> getter
		 ]

	
]

{ #category : #'*Toplo-Serialization-Stash' }
BlElement >> stashEnabled [

	<stashAccessors>
	self isEnabled ifTrue: [ ^ {  } ].
	^ { (#enabled: -> #isEnabled) }
]
