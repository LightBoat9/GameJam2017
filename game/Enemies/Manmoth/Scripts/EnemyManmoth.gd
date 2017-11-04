extends "res://Global/Object.gd"

onready var ManmothArea = get_node("ManmothArea")

var ManmothStateMachine = (
	load("res://Enemies/Manmoth/Scripts/ManmothStateMachine.gd").new()) setget set_private, get_manmoth_state_machine
	
func _ready():
	add_child(ManmothStateMachine)
	ManmothArea.connect("body_enter", self, "player_enter")
	
func set_private(value):
	print("trying to assign " + str(value) + 
		" to a private variable, nothing changed")
	
func get_manmoth_state_machine():
	return ManmothStateMachine
		
func player_enter(body):
	if (body == Player):
		pass
