extends MultiplayerSpawner

var world_scene = preload("res://scenes/world.tscn")
	
@export var network_player: PackedScene

func _ready() -> void:
	multiplayer.peer_connected.connect(spawn_player)

func spawn_player(id: int) -> void:
	if !multiplayer.is_server(): return
	
	var player: Node = network_player.instantiate()
	player.name = str(id)

	print_debug("Trying to find World at spawn_path: ", spawn_path)
	get_node(spawn_path).get_node("World/Players").call_deferred("add_child", player)
	#get_node("Game").find_child("World").call_deferred("add_child", player)

func spawn_world() -> void:
	if !multiplayer.is_server(): return
	
	var world: Node = world_scene.instantiate()
	get_node(spawn_path).call_deferred("add_child", world)
