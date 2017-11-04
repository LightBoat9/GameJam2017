extends "res://Global/Object.gd"

onready var PlayerSprite = get_node("PlayerSprite") setget set_private, get_player_sprite

var PlayerMovement = load("res://Player/Scripts/PlayerMovement.gd").new() setget set_private, get_player_movement
var PlayerStateMachine = load("res://Player/Scripts/PlayerStateMachine.gd").new() setget set_private, get_player_state_machine

func _ready():
	add_child(PlayerMovement)
	add_child(PlayerStateMachine)
	
func set_private(value):
	print("trying to assign " + str(value) + 
		" to a private variable, nothing changed")
	
func get_player_movement():
	return PlayerMovement
	
func get_player_state_machine():
	return PlayerStateMachine
	
func get_player_sprite():
	return PlayerSprite