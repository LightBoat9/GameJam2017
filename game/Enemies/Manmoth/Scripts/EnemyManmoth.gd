extends "res://Global/Object.gd"

onready var ManmothCollision = get_node("ManmothCollision")

var ManmothStateMachine = (
	load("res://Enemies/Manmoth/Scripts/ManmothStateMachine.gd").new()) setget set_private, get_manmoth_state_machine
	
func _ready():
	add_child(ManmothStateMachine)
	
func set_private(value):
	print("trying to assign " + str(value) + 
		" to a private variable, nothing changed")
	
func get_manmoth_state_machine():
	return ManmothStateMachine
