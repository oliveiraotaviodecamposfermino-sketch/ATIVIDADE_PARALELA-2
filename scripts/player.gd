extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -250.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Pulo
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movimento horizontal
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		anim.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	_atualizar_animacao(direction)
	move_and_slide()


func _atualizar_animacao(direction: float) -> void:
	if not is_on_floor():
		anim.play("Jump")
	elif direction != 0:
		anim.play("Run")
	else:
		anim.play("Idle")
