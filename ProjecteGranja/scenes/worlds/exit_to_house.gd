extends Area2D

@export var target_scene := "res://scenes/test/test_sence_house_tilemap.tscn"
@export var spawn_id := "Spawn_house_entrance"

func _on_body_entered(body: Node2D) -> void:
	print("Entró:", body.name)
	print("Cambiando escena a:", target_scene)

	GameManager.next_spawn = spawn_id
	var err = get_tree().change_scene_to_file(target_scene)
	print("Resultado change_scene:", err)
