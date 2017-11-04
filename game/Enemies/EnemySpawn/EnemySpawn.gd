extends "res://Global/Object.gd"

onready var SpawnTimer = get_node("SpawnTimer")

var Manmoth = load("res://Enemies/Manmoth/EnemyManmoth.tscn")

func _ready():
	SpawnTimer.start()
	SpawnTimer.connect("timeout", self, "spawn_enemy")
	
func spawn_enemy():
	var inst = Manmoth.instance()
	inst.set_pos(get_pos())
	Game.add_child(inst)
	