Extension { #name : #ToLabel }

{ #category : #'*Toplo-Serialization-Stash' }
ToLabel >> stashAccessorsForText [

	<stashAccessors>
	| accessors |
	accessors := OrderedCollection with: #text.
	self isMultiLine ifTrue:[
		accessors add: #multiLine: -> #isMultiLine
	].
	^ accessors
]
