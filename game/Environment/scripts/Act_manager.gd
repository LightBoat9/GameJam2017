extends Node2D

var acts = []
var current

func _ready():
	acts.append(get_node("Act1"))
	acts.append(get_node("Act2"))
	current = 0
	
	for act in acts:
		act.hide()
	acts[current].show()

func act_next():
	acts[current].hide()
	current+=1
	if current>=acts.size(): current = 0
	acts[current].show()