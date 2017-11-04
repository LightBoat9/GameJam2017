extends "res://Global/Object.gd"

onready var ManmothCollision = get_node("ManmothCollision")
onready var ManmothSprites = get_node("ManmothSprites")

var StateMachine = (
	load("res://Enemies/Manmoth/Scripts/ManmothStateMachine.gd").new()) setget set_private
	
func _ready():
	add_child(StateMachine)
	
func set_private(value):
	print("trying to assign " + str(value) + 
		" to a private variable, nothing changed")
