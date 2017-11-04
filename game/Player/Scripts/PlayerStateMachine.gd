extends "res://Global/StateMachine.gd"

var STATE = ["idle", "walk", "jump"]

func _ready():
	set_current_state(STATE[STATE.find("idle")])
	
func idle_enter(): Player.PlayerSprites.set_animation("idle")
func idle_exit(): pass
func idle_update():
	if (!Player.PlayerMovement.on_ground):
		set_current_state(STATE[STATE.find("jump")])
	elif (_is_moving()):
		set_current_state(STATE[STATE.find("walk")])
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func walk_enter(): Player.PlayerSprites.set_animation("walk")
func walk_exit(): pass
func walk_update():
	if (!Player.PlayerMovement.on_ground):
		set_current_state(STATE[STATE.find("jump")])
	elif (!_is_moving()):
		set_current_state(STATE[STATE.find("idle")])
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func jump_enter(): Player.PlayerSprites.set_animation("jump")
func jump_exit(): pass
func jump_update():
	if (Player.PlayerMovement.on_ground):
		set_current_state(STATE[STATE.find("idle")])
		
	Player.PlayerSprites.set_frame(sign(Player.PlayerMovement.velocity.y) + 1)
		
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func _is_moving():
	if (Input.is_action_pressed("key_right") or
		Input.is_action_pressed("key_left")):
			return true
	return false