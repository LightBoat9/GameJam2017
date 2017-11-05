extends "res://Global/Object.gd"

onready var SpawnTimer = get_node("SpawnTimer")

var Manmoth = load("res://Enemies/Manmoth/EnemyManmoth.tscn")

var OFFSET = 128

enum ENEMY {MANMOTH}
enum SIDE {LEFT, RIGHT}

var RIGHT_SPAWN =  Vector2(864, 225)
var LEFT_SPAWN =  Vector2(-64, 225)

func _ready():
	SpawnTimer.start()
	SpawnTimer.connect("timeout", self, "spawn_timeout")
	
func spawn_timeout():
	spawn_enemy(ENEMY.MANMOTH, SIDE.LEFT, 2, OFFSET)
	
func spawn_enemy(type, side, num, OFFSET):
	for i in range(num):
		var inst
		if (type == ENEMY.MANMOTH):
			inst = Manmoth.instance()
			
		if (side == SIDE.LEFT):
			inst.set_pos(Vector2(LEFT_SPAWN.x - (OFFSET * i), LEFT_SPAWN.y))
			inst.set_dir(1)
		elif (side == SIDE.RIGHT):
			inst.set_pos(Vector2(RIGHT_SPAWN.x + (OFFSET * i), RIGHT_SPAWN.y))
			inst.set_dir(-1)
		
		Game.add_child(inst)
	