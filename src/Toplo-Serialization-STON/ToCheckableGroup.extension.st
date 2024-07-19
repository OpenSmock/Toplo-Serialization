Extension { #name : #ToCheckableGroup }

{ #category : #'*Toplo-Serialization-STON' }
ToCheckableGroup >> fromSton: stonReader [

	stonReader parseMapDo: [ :key :value |
		key = #checkingStrategy ifTrue: [ self checkingStrategy: value ] ]
]

{ #category : #'*Toplo-Serialization-STON' }
ToCheckableGroup >> stonOn: stonWriter [

	stonWriter writeObject: self streamMap: [ :dictionary |
		dictionary
			at: #checkingStrategy put: self checkingStrategy ]
]

{ #category : #'*Toplo-Serialization-STON' }
ToCheckableGroup >> stonProcessSubObjects: block [

	self
		instVarNamed: #checkingStrategy
		put: (block value: (self instVarNamed: #checkingStrategy)).
]
