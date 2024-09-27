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
ToSerializerTest >> testToButton6 [

	| origin |
	origin := ToButton new
		          beCheckable;
		          yourself.

	self test: origin on: [ :element | self assert: element isCheckable.
		self deny: element isChecked ]
]

{ #category : #tests }
ToSerializerTest >> testToButton7 [

	| origin |
	origin := ToButton new
		          beCheckable;
		check;
		          yourself.

	self test: origin on: [ :element | self assert: element isCheckable.
		self assert: element isChecked ]
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
ToSerializerTest >> testToLabel [

	| origin |
	origin := ToLabel new text: 'hello' asRopedText; yourself.

	self
		test: origin
		on: [ :element | self assert: element text asString equals: 'hello' ]
]

{ #category : #tests }
ToSerializerTest >> testToTabPane1 [

	| origin |
	origin := ToTabPane new.
	origin resizablePanes: true.
	1 to: 3 do: [ :index | | tab |
		tab := ToTab new.
		tab closable: true.
		tab labelText: 'Button ' , index asString.
		tab paneBuilder: [ :pane :theNoteBook |
			pane background: Color random ].
		origin addTab: tab ].

	self test: origin on: [ :element |
		self assert: element tabs size equals: 3 ]
]

{ #category : #tests }
ToSerializerTest >> testToTabPane2 [

	| origin |
	origin := ToTabPane new.
	origin resizablePanes: true.
	1 to: 100 do: [ :index |
		| tab |
		tab := ToTab new.
		tab closable: true.
		tab labelText: 'Button ' , index asString.
		tab paneBuilder: [ :pane :theNoteBook |
			pane background: Color random ].
		origin addTab: tab ].

	self
		test: origin
		on: [ :element | self assert: element tabs size equals: 100 ]
]

{ #category : #tests }
ToSerializerTest >> testToTabPane3 [

	| origin |
	origin := ToTabPane new.
	origin resizablePanes: true.
	1 to: 0 do: [ :index |
		| tab |
		tab := ToTab new.
		tab closable: true.
		tab labelText: 'Button ' , index asString.
		tab paneBuilder: [ :pane :theNoteBook |
			pane background: Color random ].
		origin addTab: tab ].

	self
		test: origin
		on: [ :element | self assert: element tabs size equals: 0 ]
]

{ #category : #tests }
ToSerializerTest >> testToTabPane4 [

	| origin |
	origin := ToTabPane new.
	origin resizablePanes: true.
	1 to: 3 do: [ :index |
		| tab |
		tab := ToTab new.
		tab closable: true.
		tab labelText: 'Button ' , index asString.
		tab paneBuilder: [ :pane :theNoteBook |
			pane background: Color random ].
		origin addTab: tab ].

	self test: origin on: [ :element |
		self assert: element tabs size equals: 3.
		self
			assert: element tabs first firstElement text asString
			equals: 'Button 1'.
		self
			assert: element tabs second firstElement text asString
			equals: 'Button 2'.
		self
			assert: element tabs third firstElement text asString
			equals: 'Button 3' ]
]

{ #category : #tests }
ToSerializerTest >> testToTabPane5 [

	| origin |
	origin := ToTabPane new.
	origin resizablePanes: true.
	1 to: 3 do: [ :index |
		| tab |
		tab := ToTab new.
		tab closable: true.
		tab labelText: 'Button ' , index asString.
		tab paneBuilder: [ :pane :theNoteBook | #test ].
		origin addTab: tab ].

	self test: origin on: [ :element |
		self assert: element tabs size equals: 3.
		self
			assert: (element tabs first paneBuilder value: nil value: nil)
			equals: #test.
		self
			assert: (element tabs second paneBuilder value: nil value: nil)
			equals: #test.
		self
			assert: (element tabs third paneBuilder value: nil value: nil)
			equals: #test ]
]

{ #category : #tests }
ToSerializerTest >> testTokens [

	| origin |
	origin := ToElement new
		          addTokenNamed: #hello withValue: #goodbye;
		          addTokenNamed: #titi withValue: #toto;
		          yourself.

	self test: origin on: [ :element |
		self assert: (element ensuredSkinManager tokenPropertyValue: #hello from: element) isNotNil.
		self assert: (element ensuredSkinManager tokenPropertyValue: #titi from: element) isNotNil.
		self assert: (element valueOfTokenNamed: #hello) value equals: #goodbye.
		self assert: (element valueOfTokenNamed: #titi) value equals: #toto ]
]
