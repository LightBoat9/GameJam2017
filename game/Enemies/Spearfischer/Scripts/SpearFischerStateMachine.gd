extends "res://Global/StateMachine.gd"

var velocity
var jumpHeight = 64

onready var SPRITE_HEIGHT = get_parent().SpearFischerHitbox.get_texture().get_height()
onready var FLOOR_HEIGHT = 70
onready var ROOF_HEIGHT = 0
onready var screen_top = 0 - ROOF_HEIGHT + SPRITE_HEIGHT/2
onready var screen_bot = get_viewport_rect().size.y - SPRITE_HEIGHT/2 - FLOOR_HEIGHT

func _ready():
	var pos = get_parent().get_pos()
	pos.y = screen_bot
	get_parent().set_pos(pos)
	set_current_state("leap")

func leap_enter():
	velocity = get_trajectory(-64,64,30)
	print(get_parent().get_pos(),velocity)
func leap_update():
	get_parent().move(velocity)
	var pos = get_parent().get_pos()
	pos.y = min(pos.y, screen_bot)
	if pos.y >= screen_bot: set_current_state("idle")
	get_parent().set_pos(pos)
	velocity.y+=1
func leap_exit():
	print(get_parent().get_pos())

func idle_enter(): pass
func idle_update(): pass
func idle_exit(): pass

func get_trajectory(length, height, time):
	return Vector2(length/time, -(height/time + time/2))