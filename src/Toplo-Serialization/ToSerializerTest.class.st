Class {
	#name : #ToSerializerTest,
	#superclass : #BlocSerializationTests,
	#category : #'Toplo-Serialization'
}

{ #category : #tests }
ToSerializerTest >> testEnabled1 [

	| origin |
	origin := ToElement new.

	self test: origin on: [ :element |
		self assert: element isEnabled equals: true ]
]

{ #category : #tests }
ToSerializerTest >> testEnabled2 [

	| origin |
	origin := ToElement new enabled: true; yourself.

	self
		test: origin
		on: [ :element | self assert: element isEnabled equals: true ]
]

{ #category : #tests }
ToSerializerTest >> testEnabled3 [

	| origin |
	origin := ToElement new
		          enabled: false;
		          yourself.

	self
		test: origin
		on: [ :element | self assert: element isEnabled equals: false ]
]

{ #category : #tests }
ToSerializerTest >> testIsLeaf1 [

	| b1 b2 |
	b1 := BlElement new
		      id: #b1;
		      yourself.
	b2 := BlElement new
		      id: #b2;
		      yourself.
	b1 addChild: b2.

	self test: b1 on: [ :element |
		self assert: element isLeaf equals: false.
		self assert: element id equals: #b1.
		self assert: element childrenCount equals: 1.
		self assert: (element childAt: 1) id equals: #b2 ]
]

{ #category : #tests }
ToSerializerTest >> testIsLeaf2 [

	| b1 b2 |
	b1 := ToElement new
		      id: #b1;
		      yourself.
	b2 := ToElement new
		      id: #b2;
		      yourself.
	b1 addChild: b2.

	  [ :element |
		self assert: element isLeaf equals: true.
		self assert: element id equals: #b1.
		self assert: element childrenCount equals: 0 ] value: b1 serialize materializeAsBlElement 
]

{ #category : #tests }
ToSerializerTest >> testIsLeaf3 [

	| b1 b2 |
	b1 := ToPane new
		      id: #b1;
		      yourself.
	b2 := BlElement new
		      id: #b2;
		      yourself.
	b1 addChild: b2.

	self test: b1 on: [ :element |
		self assert: element isLeaf equals: false.
		self assert: element id equals: #b1.
		self assert: element childrenCount equals: 1.
		self assert: (element childAt: 1) id equals: #b2 ]
]

{ #category : #tests }
ToSerializerTest >> testToButton [

	| origin |
	origin := ToButton new
		          labelText: 'hello';
		          yourself.

	self
		test: origin
		on: [ :element | self assert: element labelText asString equals: 'hello' ]
]

{ #category : #tests }
ToSerializerTest >> testToLabel [

	| origin |
	origin := ToLabel new text: 'hello' asRopedText; yourself.

	self
		test: origin
		on: [ :element | self assert: element text asString equals: 'hello' ]
]

{ #category : #tests }
ToSerializerTest >> testTooltip1 [

	| origin |
	origin := ToElement new.

	self
		test: origin
		on: [ :element | self assert: element hasTooltip equals: false ]
]

{ #category : #tests }
ToSerializerTest >> testTooltip2 [

	| origin tooltip |
	tooltip := BlElement new id: #tooltip; yourself.
	origin := ToElement new tooltipContent: tooltip; yourself.

	self
		test: origin
		on: [ :element | self assert: element hasTooltip.
			element newTooltipWindowEvent: nil.
			self assert: element hasOpenedTooltip.
			self assert: ((element currentTooltipWindow childAt: 1 ) childAt: 1) id equals: #tooltip
			]
]

{ #category : #tests }
ToSerializerTest >> testTooltip3 [

	| origin |
	origin := ToElement new
		          tooltipText: 'hello tooltip';
		          yourself.

	self test: origin on: [ :element |
		self assert: element hasTooltip.
		element newTooltipWindowEvent: nil.
		self assert: element hasOpenedTooltip.
		self
			assert: ((element currentTooltipWindow childAt: 1) childAt: 1) text asString
			equals: 'hello tooltip' ]
]

{ #category : #tests }
ToSerializerTest >> testTooltip4 [

	| origin |
	origin := ToElement new
		          tooltipText: 'hello tooltip';
		          closeTooltipWindowOnMouseLeave: false;
		          yourself.

	self test: origin on: [ :element |
		self assert: element hasTooltip.
		self deny: element closeTooltipWindowOnMouseLeave. ]
]

{ #category : #tests }
ToSerializerTest >> testTooltip5 [

	| origin |
	origin := ToElement new
		          tooltipText: 'hello tooltip';
		          tooltipPopupDelay: 5;
		          yourself.

	self test: origin on: [ :element |
		self assert: element hasTooltip.
		self assert: element tooltipPopupDelay equals: 5 ]
]
