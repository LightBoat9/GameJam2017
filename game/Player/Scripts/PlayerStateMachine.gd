extends "res://Global/StateMachine.gd"

var STATE = ["idle"]

func _ready():
	set_current_state(STATE[0])
	
func idle_enter(): pass
func idle_exit(): pass
func idle_update():
	get_parent().PlayerMovement.update()