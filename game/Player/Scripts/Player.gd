extends "res://Global/Object.gd"

onready var PlayerSprites = get_node("PlayerSprites") setget set_private
onready var PlayerMask = get_node("PlayerMask") setget set_private
onready var PlayerArea = get_node("PlayerArea") setget set_private
onready var HurtTimer = get_node("HurtTimer") setget set_private

var PlayerGraphics = load("res://Player/Scripts/PlayerGraphics.gd").new() setget set_private
var PlayerMovement = load("res://Player/Scripts/PlayerMovement.gd").new() setget set_private
var PlayerStateMachine = load("res://Player/Scripts/PlayerStateMachine.gd").new() setget set_private

func _ready():
	add_child(PlayerGraphics)
	add_child(PlayerMovement)
	add_child(PlayerStateMachine)
	
func set_private(value):
	print("trying to assign " + str(value) + 
		" to a private variable, nothing changed")