extends Control

@onready var start_game: AudioStreamPlayer = $PlayWrapperContainer/StartGame
@export var vignette_duration: float = 1.2

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		get_tree().root.set_input_as_handled()
		play_vignette()
		start_game.play()
		await start_game.finished
		get_tree().change_scene_to_file("res://Scenes/Game.tscn")
		
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ResourceLoader.load_threaded_request('res://Scenes/Game.tscn')
	var color_rect = $CanvasLayer/ColorRect
	color_rect.material.set_shader_parameter("progress", 1.0)


func play_vignette() -> void:
	var color_rect = $CanvasLayer/ColorRect
	var tween = create_tween()
	tween.tween_property(color_rect.material, "shader_parameter/progress", 0.0, vignette_duration)
