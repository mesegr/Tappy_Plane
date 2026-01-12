extends CharacterBody2D

var _gravity: float = ProjectSettings.get('physics/2d/default_gravity')
var _jumped: bool = false

const JumpPower: float = -350

@onready var tappy_sprite: AnimatedSprite2D = $TappySprite

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('jump'):
		_jumped = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	velocity.y += _gravity * delta
	
	if _jumped:
		velocity.y = JumpPower
		_jumped = false
		
	if is_on_floor() or is_on_ceiling(): 
		die()
	
	move_and_slide()
	
func die() -> void:
	set_physics_process(false)
	tappy_sprite.stop()
	
