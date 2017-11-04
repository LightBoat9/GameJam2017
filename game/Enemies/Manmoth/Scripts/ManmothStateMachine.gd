extends "res://Global/StateMachine.gd"

var MOVESPEED = 5
var dir = -1

func _ready():
	set_current_state("walk")
	
func walk_enter(): pass
func walk_exit(): pass
func walk_update():
	get_parent().move(Vector2(MOVESPEED * dir, 0))
	
func hurt_enter(): get_parent().ManmothSprites.set_animation("hurt")
func hurt_exit(): pass
func hurt_update(): pass
