extends KinematicBody2D

onready var ArrowSprite = get_node("ArrowSprite")

var velocity = Vector2(0,-1)
var MOVESPEED = 15
var GRAVITY = 0.05

var dir = 1

func _ready():
	ArrowSprite.set_flip_h(dir == -1)
	set_process(true)
	
func _process(delta):
	calc_velocity()
	outside_view()
	move(velocity)
	
func calc_velocity():
	velocity.x = MOVESPEED * dir
	velocity.y += GRAVITY
	
func outside_view():
	var p = get_pos()
	var s = get_viewport_rect().size
	if (p.x > s.x || p.x < 0):
		queue_free()