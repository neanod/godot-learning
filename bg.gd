extends ParallaxBackground

var move_k = Vector2(-0.5, -0.1)
var move_k2 = 0.04


var mouse_pos = Vector2(0, 0)
const camera_offset = Vector2(0, 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delta = mouse_pos * move_k - scroll_offset - camera_offset
	scroll_offset += delta * move_k2 + camera_offset
	
func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos = event.position



func _on_button_1_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	
