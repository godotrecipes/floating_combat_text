extends Node2D

@export var FCT : PackedScene

@export var travel = Vector2(0, -80)
@export var duration = 2.0
@export var spread = PI / 2

func show_value(value, crit=false):
	var fct = FCT.instantiate()
	add_child(fct)
	fct.show_value(str(value), travel, duration, spread, crit)
