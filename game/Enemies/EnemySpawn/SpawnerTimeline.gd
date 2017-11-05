extends Node

var stage = 0; var repeat = 0
var parent

var OFFSET = 128

enum ENEMY {MANMOTH, SPEARFISCHER}
enum SIDE {LEFT, RIGHT}

func _ready():
	parent = get_parent()

func spawn_current():
	return spawn_database()
	
func spawn_database():
	print(stage)
	if stage==0: 
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 1, OFFSET)
		stage+=1; repeat = 1
		return 3
	elif stage==1: 
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 2, OFFSET+32*repeat)
		if (repeat>0): repeat -=1
		else: stage +=1
		return 2
	elif stage==2:
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 3, 80); stage +=1
		return 8
	elif stage==3:
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 4, 64);
		return 12