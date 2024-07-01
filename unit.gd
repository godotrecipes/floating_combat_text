extends Area2D

@export var health = 75
@export var speed = 100
var dir
var spawns = [0, -50, 1192]
var type

func _ready():
	type = "mech" if randi() % 2 else "ship"
	var tex = $AnimatedSprite2D.sprite_frames.get_frame_texture(type, 0)
	var s = RectangleShape2D.new()
	s.size = tex.get_size()
	$CollisionShape2D.shape = s
	dir = pow(-1, randi() % 2)
	speed *= dir
	$AnimatedSprite2D.flip_h = dir < 0
	position.x = spawns[dir]
	$AnimatedSprite2D.play(type)
	
func _process(delta):
	position.x += speed * delta
	
	
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("clicked")
			var dmg = randi() % 10 + 1
			var crit = true if randi() % 100 < 10 else false
			if crit:
				dmg *= 2
			take_damage(dmg)
			$FCTManager.show_value(dmg, crit)
			
func take_damage(value):
	health -= value
	if health <= 0:
		$CollisionShape2D.disabled = true
		speed = 0
		$AnimatedSprite2D.play("explode")
		await $AnimatedSprite2D.animation_finished
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
