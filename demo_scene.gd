extends Node2D

@export var Unit : PackedScene

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().call_group("units", "take_damage", 100)


func _on_timer_timeout():
	var u = Unit.instantiate()
	$Units.add_child(u)
	if u.type == "mech":
		u.position.y = randi_range(400, 640)
	elif u.type == "ship":
		u.position.y = randi_range(40, 275)
