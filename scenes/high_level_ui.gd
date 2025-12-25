extends Control
var world_scene = preload("res://scenes/world.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_server_pressed() -> void:
	HighLevelNetworkHandler.start_server()
	%MultiplayerSpawner.spawn_world()


func _on_client_pressed() -> void:
	HighLevelNetworkHandler.start_client()
