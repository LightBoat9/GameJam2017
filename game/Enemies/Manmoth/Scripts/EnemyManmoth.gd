extends "res://Enemies/Enemy.gd"

onready var ManmothSprites = get_node("ManmothSprites")
onready var ManmothHitbox = get_node("ManmothHitbox")
onready var HurtTimer = get_node("HurtTimer")

func _ready():
	var path = "res://Enemies/Manmoth/Scripts/ManmothStateMachine.gd"
	StateMachine = (load(path).new())
	add_child(StateMachine)
	
func set_dir(value):
	StateMachine.dir = value
	get_node("ManmothSprites").set_flip_h(value == 1)