extends Control

@onready var resume = $MarginContainer/VBoxContainer/Resume
@onready var quit_to_menu  = $MarginContainer/VBoxContainer/QuitToMenu
@onready var quit_to_desktop = $MarginContainer/VBoxContainer/QuitToDesktop
@onready var main = $"../../"

func _on_resume_pressed():
	main.pauseMenu()

func _on_quit_to_menu_pressed():
	main.pauseMenu()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_to_desktop_pressed():
	get_tree().quit()
