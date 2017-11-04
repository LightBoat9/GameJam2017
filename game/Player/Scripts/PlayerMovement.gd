extends "res://Global/Object.gd"

var parent

var MOVESPEED = 0.2
var MAXSPEED = 2

var GRAVITY = 0.4
var MAXGRAVITY = 10

var JUMP_HEIGHT = 64
var JUMP = sqrt(GRAVITY * JUMP_HEIGHT)

onready var SPRITE_WIDTH = Player.PlayerMask.get_texture().get_width()
onready var SPRITE_HEIGHT = Player.PlayerMask.get_texture().get_height()
onready var screen_left = 0
onready var screen_right = get_viewport_rect().size.x - SPRITE_WIDTH
onready var screen_top = 0
onready var FLOOR_HEIGHT = 0
onready var screen_bot = get_viewport_rect().size.y - SPRITE_HEIGHT - FLOOR_HEIGHT

var on_ground = false

var velocity = Vector2()

func update():
	calc_velocity()
	Player.move(velocity)
	stop_outside_room()
	jumping()
	
func calc_velocity():
	var input = (Input.is_action_pressed("key_right") - 
				Input.is_action_pressed("key_left"))
	
	velocity.x = lerp(velocity.x, MAXSPEED * input, MOVESPEED)
	
	if (!on_ground): velocity.y += GRAVITY
	velocity.y = min(velocity.y, MAXGRAVITY)
	
func stop_outside_room():
	var pos = Player.get_pos()
	pos.x = clamp(pos.x + velocity.x, screen_left, screen_right)
	pos.y = clamp(pos.y + velocity.y, screen_top, screen_bot)
	on_ground = pos.y == screen_bot
	if (on_ground): velocity.y = 0
	Player.set_pos(pos)
	
func jumping():
	if (on_ground && Input.is_action_pressed("key_jump")):
		velocity.y = -JUMP
		on_ground = false