Class {
	#name : #ToSerializerTest,
	#superclass : #BlocSerializationTests,
	#category : #'Toplo-Serialization-Tests'
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
		self assert: element shouldSerializedChildren.
		self assert: element id equals: #b1.
		self assert: element childrenCount equals: 1.
		self assert: (element childAt: 1) id equals: #b2 ]
]

{ #category : #tests }
ToSerializerTest >> testIsLeaf2 [

	| b1 b2 |
	b1 := ToElementWithLeafForTesting new
		      id: #b1;
		      yourself.
	b2 := ToElement new
		      id: #b2;
		      yourself.
	b1 addChild: b2.

	[ :element |
	self deny: element shouldSerializedChildren.
	self assert: element id equals: #b1.
	self assert: element childrenCount equals: 0 ] value:
		b1 serialize materializeAsBlElement
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
		self assert: element shouldSerializedChildren.
		self assert: element id equals: #b1.
		self assert: element childrenCount equals: 1.
		self assert: (element childAt: 1) id equals: #b2 ]
]

{ #category : #tests }
ToSerializerTest >> testIsLeaf4 [

	| b1 b2 element |
	b1 := ToElement new
		      id: #b1;
		      yourself.
	b2 := BlElement new
		      id: #b2;
		      yourself.
	b1 addChild: b2.

	self assert: b1 shouldSerializedChildren.
	self assert: b1 id equals: #b1.
	self assert: b1 childrenCount equals: 1.

	element := b1 serializeThenMaterialize.
	self assert: element shouldSerializedChildren.
	self assert: element id equals: #b1.
	self assert: element childrenCount equals: 1.
]

{ #category : #tests }
ToSerializerTest >> testLocalTheme1 [

	| origin |
	origin := BlElement new localTheme: ToBeeTheme new; yourself.

	self test: origin on: [ :element |
		self assert: element localTheme class equals: ToBeeTheme ]
]

{ #category : #tests }
ToSerializerTest >> testLocalTheme2 [

	| parent origin |
	origin := BlElement new
		          localTheme: ToBeeDarkTheme new;
		          yourself.
	parent := BlElement new
		          localTheme: ToBeeTheme new;
		          yourself.
	parent addChild: origin.

	self test: origin on: [ :element |
		self assert: element localTheme class equals: ToBeeDarkTheme ]
]

{ #category : #tests }
ToSerializerTest >> testStamps [

	| origin |
	origin := ToElement new
		          addStamp: #noValue;
		          addStamp: #withValue withValue: #toto;
		          yourself.

	self
		test: origin
		on: [ :element | self assert: (element hasStamp: #noValue).
			self assert: (element hasStamp: #withValue).
			self assert: (element valueOfStamp: #noValue) value equals: true.
			self assert: (element valueOfStamp: #withValue) value equals: #toto ]
]

{ #category : #tests }
ToSerializerTest >> testToAlbum [

	| origin placeholderString |
	placeholderString := 'Enter text...'.
	origin := ToAlbum new
		          placeholderString: placeholderString;
		          useScrollbar: true;
		          yourself.
	self test: origin on: [ :element |
			| text |
			text := (element userData at: #placeholder) children first.
			self
				assert: (BlTextNonPrintableCharacterPrinter print: text text)
				equals: 'Enter text...'.
			self assert: element useScrollbar ]
]

{ #category : #tests }
ToSerializerTest >> testToButton1 [

	| origin |
	origin := ToButton new
		          labelText: 'hello';
		          iconImage: (self iconNamed: #class);
		          yourself.

	self test: origin on: [ :element |
		self assert: element labelText asString equals: 'hello'.
		self
			assert: element iconImage background image bits
			equals: (self iconNamed: #class) bits ]
]

{ #category : #tests }
ToSerializerTest >> testToButton2 [

	| origin |
	origin := ToButton new
		          labelText: 'hello';
		          yourself.

	self test: origin on: [ :element |
		self assert: element labelText asString equals: 'hello'.
		self assert: element icon equals: nil ]
]

{ #category : #tests }
ToSerializerTest >> testToButton3 [

	| origin |
	origin := ToButton new
		          iconImage: (self iconNamed: #class);
		          yourself.

	self test: origin on: [ :element |
		self assert: element label equals: nil.
		self
			assert: element iconImage background image bits
			equals: (self iconNamed: #class) bits ]
]

{ #category : #tests }
ToSerializerTest >> testToButton4 [

	| origin |
	origin := ToButton new.

	self test: origin on: [ :element |
		self assert: element label equals: nil.
		self
			assert: element icon
			equals: nil ]
]

{ #category : #tests }
ToSerializerTest >> testToButton5 [

	| origin |
	origin := ToButton new.

	self test: origin on: [ :element |
		self deny: element isCheckable ]
]

{ #category : #tests }
ToSerializerTest >> testToCheckbox1 [

	| origin |
	origin := ToCheckbox new
		          labelText: 'hello';
		          yourself.

	self test: origin on: [ :element |
		self assert: element labelText asString equals: 'hello'.
		self assert: element checked equals: false ]
]

{ #category : #tests }
ToSerializerTest >> testToCheckbox2 [

	| origin |
	origin := ToCheckbox new
		          labelText: 'hello';
		          check;
		          yourself.

	self test: origin on: [ :element |
		self assert: element labelText asString equals: 'hello'.
		self assert: element isChecked ]
]

{ #category : #tests }
ToSerializerTest >> testToCheckbox3 [

	| button1 button2 button3 pane |
	pane := ToPane new.
	button1 := ToCheckbox new
		           id: #button1;
		           labelText: 'button1';
		           yourself.
	button2 := ToCheckbox new
		           id: #button2;
		           labelText: 'button2';
		           yourself.
	button3 := ToCheckbox new
		           id: #button3;
		           labelText: 'button3';
		           yourself.
	pane addChildren: {
			button1.
			button2.
			button3 }.
	button2 check.

	self test: pane on: [ :element |
		self assert: element childrenCount equals: 3.
		self assert: (element childAt: 1) id equals: #button1.
		self assert: (element childAt: 2) id equals: #button2.
		self assert: (element childAt: 3) id equals: #button3.
		self assert: (element childAt: 1) isUnchecked.
		self assert: (element childAt: 2) isChecked.
		self assert: (element childAt: 3) isUnchecked ]
]

{ #category : #tests }
ToSerializerTest >> testToCheckbox4 [

	| button1 button2 button3 pane group |
	pane := ToPane new.
	group := ToCheckableGroup new.
	button1 := ToCheckbox new
		           id: #button1;
		           labelText: 'button1';
		           registerInGroup: group;
		           yourself.
	button2 := ToCheckbox new
		           id: #button2;
		           labelText: 'button2';
		           registerInGroup: group;
		           yourself.
	button3 := ToCheckbox new
		           id: #button3;
		           labelText: 'button3';
		           registerInGroup: group;
		           yourself.
	pane addChildren: {
			button1.
			button2.
			button3 }.
	button2 check.

	self test: pane on: [ :element |
		self assert: element childrenCount equals: 3.
		self assert: (element childAt: 1) id equals: #button1.
		self assert: (element childAt: 2) id equals: #button2.
		self assert: (element childAt: 3) id equals: #button3.
		self assert: (element childAt: 1) isUnchecked.
		self assert: (element childAt: 2) isChecked.
		self assert: (element childAt: 3) isUnchecked.
		self assert: (element childAt: 1) group isNotNil.
		self
			assert: (element childAt: 1) group
			equals: (element childAt: 2) group.
		self
			assert: (element childAt: 2) group
			equals: (element childAt: 3) group.
		self
			assert: (element childAt: 1) group registeredCheckables size
			equals: 3.
		self assert:
			((element childAt: 1) group registeredCheckables includes:
				 (element childAt: 1)).
		self assert:
			((element childAt: 1) group registeredCheckables includes:
				 (element childAt: 2)).
		self assert:
			((element childAt: 1) group registeredCheckables includes:
				 (element childAt: 3)) ]
]

{ #category : #tests }
ToSerializerTest >> testToIconicButton [

	| origin |
	origin := ToIconicButton new
		          iconImage: (ToMaterialDesignIconProvider innerImageNamed:
					           'outlined_keyboardarrowright');
		          yourself.
	self test: origin on: [ :element |
			self assert: (element isKindOf: ToIconicButton).
			self assert: element innerImage isNotNil ]
]

{ #category : #tests }
ToSerializerTest >> testToImage1 [

	| origin |
	origin := ToImage new.

	self
		test: origin
		on: [ :element |
		self assert: element innerImage id equals: #emptyImage ]
]

{ #category : #tests }
ToSerializerTest >> testToImage2 [

	| origin |
	origin := ToImage inner: (ToSandBox pathCheckSVG).

	self
		test: origin
		on: [ :element | self assert: element innerImage id equals: #svgPath ]
]

{ #category : #tests }
ToSerializerTest >> testToLabel [

	| origin |
	origin := ToLabel new text: 'hello' asRopedText; yourself.

	self
		test: origin
		on: [ :element | 
			self assert: element text asString equals: 'hello'.
	].
		
]

{ #category : #tests }
ToSerializerTest >> testToLabelMultiLine [

	| origin |
	origin := ToLabel new text: 'hello' asRopedText; yourself.
	origin beMultiLine.
	self
		test: origin
		on: [ :element | 
			self assert: element isMultiLine 
	].
	origin beMonoLine.
	self
		test: origin
		on: [ :element | 
			self deny: element isMultiLine 
	].
		
]

{ #category : #tests }
ToSerializerTest >> testToListElement [

	| origin |
	origin := ToListElement new
		          useScrollbar: true;
		          useInfiniteLayout: true;
		          beVertical;
		          withRowNumbers;
		          yourself.
	self test: origin on: [ :element |
			self assert: element useScrollbar.
			self assert: element useInfiniteLayout.
			self assert: element isVertical.
			self assert: element toConfiguration rowNumbers ]
]

{ #category : #tests }
ToSerializerTest >> testToRadioButton1 [

	| origin |
	origin := ToRadioButton new
		          labelText: 'hello';
		          yourself.

	self test: origin on: [ :element |
			self assert: element labelText asString equals: 'hello'.
			self assert: element icon equals: nil ]
]

{ #category : #tests }
ToSerializerTest >> testToRadioButton2 [

	| origin |
	origin := ToRadioButton new
		          iconImage: (self iconNamed: #class);
		          yourself.

	self test: origin on: [ :element |
			self assert: element label equals: nil.
			self
				assert: element iconImage background image bits
				equals: (self iconNamed: #class) bits ]
]

{ #category : #tests }
ToSerializerTest >> testToRadioButton3 [

	| origin |
	origin := ToRadioButton new.

	self test: origin on: [ :element |
			self assert: element label equals: nil.
			self assert: element icon equals: nil ]
]

{ #category : #tests }
ToSerializerTest >> testToRadioButton4 [

	| origin |
	origin := ToRadioButton new.

	self test: origin on: [ :element | self assert: element isCheckable ]
]

{ #category : #tests }
ToSerializerTest >> testToTextFieldPlaceholder [

	| origin textElement |
	origin := ToTextField new placeholderText: 'Enter text...'.

	self test: origin on: [ :element |
			textElement := (element userData at: #placeholder) children first.
			self
				assert:
				(BlTextNonPrintableCharacterPrinter print: textElement text)
				equals: 'Enter text...' ].
]

{ #category : #tests }
ToSerializerTest >> testToTextFieldWrappingMode [

	| origin |
	origin := ToTextField new
		          width: 150;
		          wrappingMode: true;
		          yourself.
	self test: origin on: [ :element |
			element forceLayout.
			self assert: element width equals: 150.
			self assert: element wrappingMode ]
]

{ #category : #tests }
ToSerializerTest >> testToToggleButton1 [

	| origin |
	origin := ToToggleButton new
		          labelText: 'hello';
		          yourself.

	self test: origin on: [ :element |
			self assert: element labelText asString equals: 'hello'] 
]

{ #category : #tests }
ToSerializerTest >> testToToggleButton2 [

	| origin |
	origin := ToButton new.

	self test: origin on: [ :element |
			self assert: element label equals: nil.
			self assert: element icon equals: nil ]
		
]

{ #category : #tests }
ToSerializerTest >> testToToggleButton3 [

	| origin |
	origin := ToToggleButton new
		          icon:
			          (ToImage new innerImage: (self iconNamed: #solidMenu));
		          yourself.

	self test: origin on: [ :element |
			self assert: element label equals: nil.
			self
				assert: element iconImage background image bits
				equals: (self iconNamed: #solidMenu) bits ].  
]
