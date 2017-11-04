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
	move(velocity)
	
func calc_velocity():
	velocity.x = MOVESPEED * dir
	velocity.y += GRAVITY