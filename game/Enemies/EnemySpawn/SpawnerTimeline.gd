extends "res://Global/Object.gd"

var stage = 0; var repeat = 0
var parent
var special

var OFFSET = {
	"ROLL" : 64,
	"NORM" : 128,
	"JUMP" : 256
}

enum ENEMY {MANMOTH, SPEARFISCHER}
enum SIDE {LEFT, RIGHT}

func _ready():
	parent = get_parent()

func spawn_current():
	return spawn_database()
	
func spawn_database():
	return 100
	print(stage)
	if (stage == 0): # Shoot easy, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 1, OFFSET["NORM"])
		stage += 1
		repeat = 1
		return 3
	elif (stage == 1): # Shoot medium, Repeats once
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 2, OFFSET["JUMP"])
		if (repeat > 0): repeat -= 1
		else: 
			stage +=1
			repeat = 2
		return 3
	elif (stage == 2): # Shoot hard, Repeats twice
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 3, OFFSET["ROLL"])
		if (repeat > 0): repeat -= 1
		else:
			stage += 1
			return 1.5
		return 3
	elif (stage == 3): # P1 : Shoot hard, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 3, OFFSET["ROLL"])
		stage += 1
		return 5
	elif (stage == 4): ## P2 : Roll easy, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 2, OFFSET["ROLL"])
		stage += 1
		return 1
	elif (stage == 5): # P1: Shoot hard, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 3, OFFSET["ROLL"])
		stage += 1
		return 5
	elif (stage == 6): ## P2: Roll medium, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 3, OFFSET["ROLL"])
		stage += 1
		return 1
	elif (stage == 7): # P1: Shoot hard, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 3, OFFSET["ROLL"])
		stage += 1
		return 5
	elif (stage == 8): ## P2: Roll hard, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 4, OFFSET["ROLL"])
		stage += 1
		return 1
	elif (stage == 9): # P1: Shoot hard, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 3, OFFSET["ROLL"])
		stage += 1
		return 1.5
	elif (stage == 10): ## P2: Roll hard, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 4, OFFSET["ROLL"])
		stage += 1
		return 100
	elif (stage == 11): ### P3: Jump easy, No repeat
		parent.spawn_enemy(ENEMY.MANMOTH, SIDE.RIGHT, 1, OFFSET["ROLL"])
		return 100