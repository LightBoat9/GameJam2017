extends "res://Global/Object.gd"

onready var PlayerSprites = get_node("PlayerSprites") setget set_private, get_player_sprites

var PlayerGraphics = load("res://Player/Scripts/PlayerGraphics.gd").new() setget set_private, get_player_graphics
var PlayerMovement = load("res://Player/Scripts/PlayerMovement.gd").new() setget set_private, get_player_movement
var PlayerStateMachine = load("res://Player/Scripts/PlayerStateMachine.gd").new() setget set_private, get_player_state_machine

func _ready():
	add_child(PlayerGraphics)
	add_child(PlayerMovement)
	add_child(PlayerStateMachine)
	
func set_private(value):
	print("trying to assign " + str(value) + 
		" to a private variable, nothing changed")
	
func get_player_movement():
	return PlayerMovement
	
func get_player_graphics():
	return PlayerGraphics
	
func get_player_state_machine():
	return PlayerStateMachine
	
func get_player_sprites():
	return PlayerSprites