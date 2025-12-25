extends RigidBody2D


var applied_force = 0.0
var rotation_speed = 180.0

#@onready var synchronizer = %MultiplayerSynchronizer

func _enter_tree() -> void:
	#if is_multiplayer_authority():
	#	set_multiplayer_authority(str(name).to_int())
	print(multiplayer.get_unique_id(),  ": Setting Authority of object", self.name, " to: ", str(name))
	set_multiplayer_authority(str(name).to_int())
	#print("The authority is now:", get_multiplayer_authority())
	#%MultiplayerSynchronizer.root_path = str(get_parent().name)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

	#synchronizer.set_multiplayer_authority(str(name).to_int())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		#wdprint("multiplayer_authority: ", get_multiplayer_authority(), ", but we are: ", multiplayer.get_unique_id())
	
		if Input.is_action_pressed("apply_force"):
			apply_central_force(Vector2(0, -5000000.0 * delta).rotated(global_rotation))
		if Input.is_action_pressed("turn_left"):
			global_rotation = rotate_toward(global_rotation, global_rotation + PI/4.0, -delta * 6.5)
		elif Input.is_action_pressed("turn_right"):
			global_rotation = rotate_toward(global_rotation, global_rotation + PI/4.0, delta * 6.5)
	
	else:
		pass
