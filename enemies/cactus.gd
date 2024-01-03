class_name Cactus
extends Area2D


const STARTING_POSITION = Vector2(493, 366)
const STARTING_SPEED = 100

@export var player: Player
@export var speed: int = STARTING_SPEED
@export var acceleration: int = 20


func _ready() -> void:
	player.died.connect(_reset)


func _process(delta: float) -> void:
	if player:
		global_position = global_position.move_toward(player.global_position, speed * delta)
	speed += acceleration * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()


func _reset() -> void:
	global_position = STARTING_POSITION
	speed = STARTING_SPEED
