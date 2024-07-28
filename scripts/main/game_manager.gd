extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("toggleFullscreen"):
		toggle_fullscreen()

func toggle_fullscreen():
	if get_window().mode != Window.MODE_FULLSCREEN:
		get_window().mode = Window.MODE_FULLSCREEN
	else:
		get_window().mode = Window.MODE_MAXIMIZED
