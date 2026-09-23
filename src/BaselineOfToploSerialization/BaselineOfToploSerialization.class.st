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
		self dependency: spec.

		"project packages"
		spec package: 'Toplo-Serialization-STON'.
		spec package: 'Toplo-Serialization-Stash'.
		spec package: 'Toplo-Serialization' with: [
			spec requires:
				#( 'Toplo' 'BlocSerialization' 'Toplo-Serialization-STON'
				   'Toplo-Serialization-Stash' ) ].
		spec
			package: 'Toplo-Serialization-Tests'
			with: [ spec requires: #( 'Toplo-Serialization' ) ] ]
]

{ #category : #baselines }
BaselineOfToploSerialization >> dependency: spec [

	spec
		baseline: #BlocSerialization
		with: [
		spec repository: 'github://OpenSmock/Bloc-Serialization:main/src' ].
	
	"Graphic librairies: this section should be removed when librairies will be integrated in Pharo"
	spec
		baseline: 'Album'
		with: [ spec repository: 'github://ThalesGroup/Album:dev' ].

	spec
		baseline: 'Toplo'
		with: [ spec repository: 'github://ThalesGroup/Toplo:dev' ]
]
