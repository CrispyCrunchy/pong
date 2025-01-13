extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_1_player_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/1_player.tscn")

func _on_2_player_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/2_player.tscn")

func _on_quit_button_3_pressed() -> void:
	get_tree().quit()
