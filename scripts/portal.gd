extends Area2D

const MOEDAS_NECESSARIAS = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var cena = get_tree().current_scene.scene_file_path

		if Global.moedas < MOEDAS_NECESSARIAS:
			print("Faltam moedas: ", Global.moedas, "/", MOEDAS_NECESSARIAS)
		elif cena == "res://levels/fase_1.tscn":
			get_tree().change_scene_to_file.call_deferred("res://levels/fase_2.tscn")
		elif cena == "res://levels/fase_2.tscn":
			get_tree().change_scene_to_file.call_deferred("res://levels/fase_1.tscn")
		else:
			print("Portal em uma cena sem destino definido: ", cena)
	
