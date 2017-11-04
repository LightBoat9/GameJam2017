extends "res://Global/StateMachine.gd"

var STATE = ["idle", "walk", ]

func _ready():
	set_current_state(STATE[STATE.find("idle")])
	
func idle_enter(): Player.PlayerSprites.set_animation("idle")
func idle_exit(): pass
func idle_update():
	if (_is_moving()):
		set_current_state(STATE[STATE.find("walk")])
	if (!Player.PlayerMovement.on_ground):
		pass
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func walk_enter(): Player.PlayerSprites.set_animation("walk")
func walk_exit(): pass
func walk_update():
	if (!_is_moving()):
		set_current_state(STATE[STATE.find("idle")])
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func _is_moving():
	if (Input.is_action_pressed("key_right") or
		Input.is_action_pressed("key_left")):
			return true
	return false