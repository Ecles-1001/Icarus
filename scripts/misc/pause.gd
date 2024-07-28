extends Node

@onready var pause_panel = %PausePanel

func _ready():
	pass

func _input(_event):
	if Input.is_action_just_pressed("pause"):
		if pause_panel.visible == false:
			get_viewport().set_input_as_handled()
			get_tree().paused = true
			pause_panel.visible = true
	
	elif Input.is_action_just_pressed("pause"):
		if pause_panel.visible == true:
			get_viewport().set_input_as_handled()
			get_tree().paused = false
			pause_panel.visible = false


func _on_resume_button_pressed():
	get_tree().paused = false
	pause_panel.visible = false

func _on_main_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main/main_menu.tscn")

func _on_close_game_button_pressed():
	get_tree().quit()

func _on_reset_pressed():
	get_tree().reload_current_scene()
