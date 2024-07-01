extends Label

func show_value(value, travel, duration, spread, crit=false):
	text = value
	var movement = travel.rotated(randf_range(-spread/2, spread/2))
	pivot_offset = size / 2
	var tw = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT).set_parallel()
	tw.tween_property(self, "position", position + movement, duration)
	if crit:
		modulate = Color(1, 0, 0)
		tw.tween_property(self, "scale", scale, 0.4).from(scale*2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	await tw.finished
	queue_free()
	
