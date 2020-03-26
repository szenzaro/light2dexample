extends "res://Chracter/TemplateCharacter.gd"

var motion:Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	update_movement()
	move_and_slide(motion)
	
func update_movement()->void:

	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("move_up") && !Input.is_action_pressed("move_down"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)
	if Input.is_action_pressed("move_down") && !Input.is_action_pressed("move_up"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED)
	if Input.is_action_pressed("move_left") && !Input.is_action_pressed("move_right"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0)
	if Input.is_action_pressed("move_right") && !Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)
	
	motion.x = lerp(motion.x , 0, FRICTION)
	motion.y = lerp(motion.y , 0, FRICTION)
	

