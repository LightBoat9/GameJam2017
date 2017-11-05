extends KinematicBody2D

onready var SpearSprite = get_node("Sprite")

var velocity = Vector2()
var GRAVITY = 1

func _ready():
	set_process(true)
	
func _process(delta):
	velocity.y += GRAVITY
	SpearSprite.set_rot(-atan2(velocity.y, velocity.x))
	move(velocity)