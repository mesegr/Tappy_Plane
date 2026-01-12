extends Node


const PIPES = preload("res://Assets/pipes/Pipes.tscn")

@onready var pipes_holder: Node = $PipesHolder
@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lowe_spawn: Marker2D = $LoweSpawn
@onready var spawn_timer: Timer = $SpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var new_y: float = randf_range(upper_spawn.position.y,lowe_spawn.position.y)
	new_pipes.position = Vector2(upper_spawn.position.x, new_y)
	pipes_holder.add_child(new_pipes)

func _on_spawn_timer_timeout() -> void:
	spawn_pipes()
 
