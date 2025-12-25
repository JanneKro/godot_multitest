extends RigidBody2D

func _enter_tree() -> void:
	print(multiplayer.get_unique_id(),  ": Setting Authority of object", self.name, " to: ", str(name))
	set_multiplayer_authority(str(name).to_int())

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		if Input.is_action_pressed("apply_force"):
			apply_central_force(Vector2(0, -5000000.0 * delta).rotated(global_rotation))
		if Input.is_action_pressed("turn_left"):
			global_rotation = rotate_toward(global_rotation, global_rotation + PI/4.0, -delta * 6.5)
		elif Input.is_action_pressed("turn_right"):
			global_rotation = rotate_toward(global_rotation, global_rotation + PI/4.0, delta * 6.5)
	
	else:
		pass
