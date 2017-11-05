extends "res://Global/Object.gd"

var StateMachine
var is_dead = false

func _ready():
	add_to_group("enemy")
	
func death():
	queue_free()