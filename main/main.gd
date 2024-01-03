extends Node2D


var save_data: SaveData = preload("res://saves/save.tres")


func _ready() -> void:
	$HUD.best_seconds_alive = save_data.best_time
	$Player.died.connect(_on_player_died)


func _process(delta: float) -> void:
	$HUD.seconds_alive += delta


func _on_player_died() -> void:
	save_data.best_time = max($HUD.seconds_alive, save_data.best_time)
	ResourceSaver.save(save_data)

	$HUD.seconds_alive = 0
	$HUD.best_seconds_alive = save_data.best_time
