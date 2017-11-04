extends "res://Global/StateMachine.gd"

func _ready():
	Player.PlayerSprites.connect("frame_changed", self, "roll_frame_changed")
	set_current_state("idle")
	
func idle_enter(): Player.PlayerSprites.set_animation("idle")
func idle_exit(): pass
func idle_update():
	if (Input.is_action_pressed("key_roll")):
		set_current_state("roll")
	elif (!Player.PlayerMovement.on_ground):
		set_current_state("jump")
	elif (_is_moving()):
		set_current_state("walk")
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func walk_enter(): Player.PlayerSprites.set_animation("walk")
func walk_exit(): pass
func walk_update():
	if (Input.is_action_pressed("key_roll")):
		set_current_state("roll")
	elif (!Player.PlayerMovement.on_ground):
		set_current_state("jump")
	elif (!_is_moving()):
		set_current_state("idle")
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func jump_enter(): Player.PlayerSprites.set_animation("jump")
func jump_exit(): pass
func jump_update():
	if (Player.PlayerMovement.on_ground):
		set_current_state("idle")
		
	Player.PlayerSprites.set_frame(sign(Player.PlayerMovement.velocity.y) + 1)
		
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func roll_enter(): 
	Player.PlayerSprites.set_frame(0)
	Player.PlayerSprites.set_animation("roll")
func roll_exit(): pass
func roll_update():
	Player.PlayerMovement.roll_update()
		
func roll_frame_changed():
	if (Player.PlayerSprites.get_frame() == 0):
		set_current_state("idle")
	
func _is_moving():
	if (Input.is_action_pressed("key_right") or
		Input.is_action_pressed("key_left")):
			return true
	return false