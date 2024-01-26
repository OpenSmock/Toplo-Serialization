Class {
	#name : #BaselineOfToploSerialization,
	#superclass : #BaselineOf,
	#category : #BaselineOfToploSerialization
}

{ #category : #baselines }
BaselineOfToploSerialization >> baseline: spec [

	<baseline>
	spec for: #common do: [ "dependencies"
		self dependency: spec.

		"project packages"
		spec
			package: 'Toplo-Serialization'
			 ]
]

{ #category : #baselines }
BaselineOfToploSerialization >> dependency: spec [

	spec
		baseline: 'Ston'
		with: [ spec repository: 'github://svenvc/ston/repository' ].

	spec
		baseline: #BlocSerialization
		with: [
		spec repository: 'github://OpenSmock/Bloc-Serialization:main/src' ].

	spec baseline: 'Toplo' with: [ spec repository: 'github://pharo-graphics/Toplo:main/src' ].


]
