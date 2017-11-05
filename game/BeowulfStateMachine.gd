extends "res://Global/StateMachine.gd"

func _ready():
	set_current_state("idle")
	
func idle_enter(): pass
func idle_exit(): pass
func idle_update(): pass