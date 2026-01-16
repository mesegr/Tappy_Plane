extends Control

@onready var start_game: AudioStreamPlayer = $PlayWrapperContainer/StartGame


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		start_game.play()
		await
		get_tree().change_scene_to_file("res://Scenes/Game.tscn")
		
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ResourceLoader.load_threaded_request('res://Scenes/Game.tscn')
