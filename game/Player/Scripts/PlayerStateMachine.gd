extends "res://Global/StateMachine.gd"

var STATE = ["idle", "walk", ]

func _ready():
	set_current_state(STATE[STATE.find("idle")])
	
func idle_enter(): pass
func idle_exit(): pass
func idle_update():
	if (is_moving()): 
		set_current_state(STATE[STATE.find("walk")])
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func walk_enter(): pass
func walk_exit(): pass
func walk_update():
	if (!is_moving()):
		set_current_state(STATE[STATE.find("idle")])
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func is_moving():
	if (Input.is_action_pressed("key_right") or
		Input.is_action_pressed("key_left")):
			return true
	return false