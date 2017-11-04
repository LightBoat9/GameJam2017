extends "res://Global/StateMachine.gd"

var PlayerArrow = load("res://Player/Arrow/PlayerArrow.tscn")
var arrow_offset = Vector2(24, -12)

var invin = false

func _ready():
	Player.HurtTimer.connect("timeout", self, "hurt_timout")
	Player.PlayerArea.connect("body_enter", self, "hit_enemy")
	Player.PlayerSprites.connect("frame_changed", self, "frame_changed")
	set_current_state("idle")
	
func idle_enter(): Player.PlayerSprites.set_animation("idle")
func idle_exit(): pass
func idle_update():
	if (!Player.PlayerMovement.on_ground):
		set_current_state("jump")
	elif (Input.is_action_pressed("key_roll")):
		set_current_state("roll")
	elif(Input.is_action_pressed("key_shoot")):
		set_current_state("shoot")
	elif (_is_moving()):
		set_current_state("walk")
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func walk_enter(): Player.PlayerSprites.set_animation("walk")
func walk_exit(): pass
func walk_update():
	if (!Player.PlayerMovement.on_ground):
		set_current_state("jump")
	elif (Input.is_action_pressed("key_roll")):
		set_current_state("roll")
	elif(Input.is_action_pressed("key_shoot")):
		set_current_state("shoot")
	elif (!_is_moving()):
		set_current_state("idle")
	
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func jump_enter(): Player.PlayerSprites.set_animation("jump")
func jump_exit(): pass
func jump_update():
	if (Player.PlayerMovement.on_ground):
		set_current_state("idle")
	
	var y = Player.PlayerMovement.velocity.y
	if (y < -2):
		Player.PlayerSprites.set_frame(0)
	elif (y > 2):
		Player.PlayerSprites.set_frame(2)
	else:
		Player.PlayerSprites.set_frame(1)
		
	Player.PlayerMovement.update()
	Player.PlayerGraphics.update()
	
func roll_enter(): 
	Player.PlayerSprites.set_frame(0)
	Player.PlayerSprites.set_animation("roll")
	invin = true
func roll_exit():
	invin = false
func roll_update():
	Player.PlayerMovement.roll_update()
		
func shoot_enter():
	Player.PlayerSprites.set_frame(0)
	Player.PlayerSprites.set_animation("shoot")
	Player.PlayerMovement.stop_moving()
func shoot_exit(): pass
func shoot_update(): pass
	
func hurt_enter():
	Player.PlayerSprites.set_frame(0)
	Player.PlayerSprites.set_animation("hurt")
	Player.HurtTimer.start()
	Player.PlayerMovement.knockback()
func hurt_exit(): pass
func hurt_update():
	Player.PlayerMovement.kockback_update()
	
func frame_changed():
	var a = Player.PlayerSprites.get_animation()
	if (a == "shoot"):
		if (Player.PlayerSprites.get_frame() == 1):
			spawn_player_arrow()
	if (a == "roll" || a == "shoot"):
		if (Player.PlayerSprites.get_frame() == 0):
			set_current_state("idle")
	
func spawn_player_arrow():
	var inst = PlayerArrow.instance()
	inst.dir = Player.PlayerGraphics.dir
	inst.set_pos(Vector2(Player.get_pos().x + 
				(arrow_offset.x * Player.PlayerGraphics.dir), 
				Player.get_pos().y + arrow_offset.y))
	Game.add_child(inst)
	
func _is_moving():
	if (Input.is_action_pressed("key_right") or
		Input.is_action_pressed("key_left")):
			return true
	return false
	
func hit_enemy(body):
	if (body.is_in_group("enemy") && not invin):
		invin = true
		set_current_state("hurt")
		
func hurt_timout():
	set_current_state("idle")