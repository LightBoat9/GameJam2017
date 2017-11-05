extends "res://Enemies/Enemy.gd"

onready var Sprites = get_node("Sprites")
onready var HitBox = get_node("HitBox")

onready var HurtTimer = get_node("HurtTimer")
	
func _ready():
	var path = "res://Enemies/SpearFischer/Scripts/SpearFischerStateMachine.gd"
	StateMachine = (load(path).new())
	add_child(StateMachine)
	
func set_dir(value):
	StateMachine.dir = value
	get_node("SpearFischerSprites").set_flip_h(value == 1)