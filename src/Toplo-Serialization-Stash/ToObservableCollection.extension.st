Extension { #name : #ToObservableCollection }

{ #category : #'*Toplo-Serialization-Stash' }
ToObservableCollection >> asStashObject [

	^ StashCollection new
		  object: collection;
		  classType: collection class;
		  yourself
]
