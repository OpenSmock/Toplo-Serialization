Extension { #name : #ToCheckableGroup }

{ #category : #'*Toplo-Serialization-Stash' }
ToCheckableGroup >> stashAccessorsForCheckableGroup [

	<stashAccessors>
	^ { #registerAll: -> #registeredCheckables }
]
