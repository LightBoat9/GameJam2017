extends "res://Global/Object.gd"

onready var SpawnTimer = get_node("SpawnTimer")

var Manmoth = load("res://Enemies/Manmoth/EnemyManmoth.tscn")
var TimeLine = load("res://Enemies/EnemySpawn/SpawnerTimeline.gd").new()

var OFFSET = 128

enum ENEMY {MANMOTH, SPEARFISCHER}
enum SIDE {LEFT, RIGHT}

var RIGHT_SPAWN =  Vector2(800, 305)
var LEFT_SPAWN =  Vector2(0, 305)

func _ready():
	SpawnTimer.start()
	SpawnTimer.connect("timeout", self, "spawn_timeout")
	add_child(TimeLine)

func spawn_timeout():
	var time = TimeLine.spawn_current()
	SpawnTimer.set_wait_time(time)

func spawn_enemy(type, side, num, OFFSET):
	var inst
	for i in range(num):
		if (type == ENEMY.MANMOTH):
			inst = Manmoth.instance()
		
		Game.add_child(inst)
		
		if (side == SIDE.LEFT):
			inst.set_pos(Vector2(LEFT_SPAWN.x - (OFFSET * i), LEFT_SPAWN.y))
			inst.set_dir(1)
		elif (side == SIDE.RIGHT):
			inst.set_pos(Vector2(RIGHT_SPAWN.x + (OFFSET * i), RIGHT_SPAWN.y))
			inst.set_dir(-1)
		
		inst = null
	return inst