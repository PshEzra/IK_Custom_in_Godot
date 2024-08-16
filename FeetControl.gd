extends Area2D

var mouse_inside : bool = false
var mouse_click : bool = false

func _unhandled_input(event):
	if event is InputEventMouseButton && mouse_inside:
		mouse_click = !mouse_click

func _process(delta):
	if mouse_click:
		global_position = get_viewport().get_mouse_position()

func _on_mouse_entered():
	mouse_inside = true

func _on_mouse_exited():
	mouse_inside = false
