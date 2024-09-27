Extension { #name : #ToTab }

{ #category : #'*Toplo-Serialization-Stash' }
ToTab >> firstElement [

	| first |
	first := self children first.
	first == filler ifTrue: [ ^ nil ].
	^ first
]

{ #category : #'*Toplo-Serialization-Stash' }
ToTab >> firstElement: anElement [

	anElement ifNil: [ ^ self ].
	self addChild: anElement at: 1
]

{ #category : #'*Toplo-Serialization-Stash' }
ToTab >> stashElement [

	<stashAccessors>
	self firstElement ifNil: [ ^ {  } ].
	^ { (#firstElement: -> #firstElement) }
]

{ #category : #'*Toplo-Serialization-Stash' }
ToTab >> stashPaneBuilder [

	<stashAccessors>
	^ { #paneBuilder }
]
