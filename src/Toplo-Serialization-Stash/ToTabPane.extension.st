Extension { #name : #ToTabPane }

{ #category : #'*Toplo-Serialization-Stash' }
ToTabPane >> stashAddAllTabs: aCollectionOfTabs [

	aCollectionOfTabs do: [ :each | self addTab: each ].
]

{ #category : #'*Toplo-Serialization-Stash' }
ToTabPane >> stashTabs [

	<stashAccessors>
	^ { #stashAddAllTabs: -> #tabs }
]
