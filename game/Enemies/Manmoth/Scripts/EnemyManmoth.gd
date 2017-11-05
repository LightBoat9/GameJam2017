extends "res://Enemies/Enemy.gd"

onready var ManmothSprites = get_node("ManmothSprites")
onready var ManmothHitbox = get_node("ManmothHitbox")
onready var HurtTimer = get_node("HurtTimer")

var is_dead = false

var StateMachine = (
	load("res://Enemies/Manmoth/Scripts/ManmothStateMachine.gd").new()) setget set_private
	
func _ready():
	add_child(StateMachine)
	
func set_private(value):
	print("trying to assign " + str(value) + 
		" to a private variable, nothing changed")
	
func set_dir(value):
	StateMachine.dir = value
	get_node("ManmothSprites").set_flip_h(value == 1)
	
func death():
	queue_free()