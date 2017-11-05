extends Node2D

var is_dead = false

onready var BlinkTimer = get_node("BlinkTimer")
onready var HurtTimer = get_node("HurtTimer")
onready var DespawnTimer = get_node("DespawnTimer")

var StateMachine

func _ready():	
	var path = "res://BeowulfStateMachine.gd"
	StateMachine = (load(path).new())
	add_child(StateMachine)
	set_pos(Vector2(600, 250))