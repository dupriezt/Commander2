"
I am a command allowing to rename a contact.
"
Class {
	#name : #CmRenameContactCommand,
	#superclass : #CmContactBookCommand,
	#category : #'Commander2-ContactBook-Commands'
}

{ #category : #converting }
CmRenameContactCommand >> asSpecCommand [
	"Here we define the additional information the command will need to know
	 when used in the Spec framework.
	"
	^ super asSpecCommand
		shortcutKey: $r meta;
		yourself
]

{ #category : #hooks }
CmRenameContactCommand >> canBeRun [
	^ self context isContactSelected
]

{ #category : #hooks }
CmRenameContactCommand >> execute [
	self selectedContact name: self context newName.
	self contactBookPresenter updateView
]

{ #category : #initialization }
CmRenameContactCommand >> initialize [
	super initialize.
	self
		basicName: 'Rename'; "This is the name of the command that will be shown to the user."
		basicDescription: 'Rename the selected contact.'. "This is the description of the command that will be shown to the user."
]
