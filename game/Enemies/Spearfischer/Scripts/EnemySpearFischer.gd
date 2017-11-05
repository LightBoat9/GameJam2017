extends "res://Enemies/Enemy.gd"

onready var SpearFischerCollision = get_node("SpearFischerCollision")
onready var SpearFischerSprites = get_node("SpearFischerSprites")
onready var SpearFischerHitbox = get_node("SpearFischerHitbox")
onready var HurtTimer = get_node("HurtTimer")

var is_dead = false

var StateMachine = (
	load("res://Enemies/SpearFischer/Scripts/SpearFischerStateMachine.gd").new()) #setget set_private
	
func _ready():
	add_child(StateMachine)