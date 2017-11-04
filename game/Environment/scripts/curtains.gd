extends Node


var raise = false
var minY; var maxY
var curtains
var rate = 4

func _ready():
	set_process(true)
	set_process_input(true)
	curtains = get_node("curtains_back")
	maxY = curtains.get_offset().y
	minY = -curtains.get_offset().y+128

func _input(event):
	if event.is_action_pressed("ui_up"):
		raise = !raise

func _process(delta):
	var off = curtains.get_offset()
	if raise:
		off.y = max(off.y-rate,minY)
	else :
		off.y = min(off.y+rate,maxY)
	curtains.set_offset(off)