extends Node2D



func _on_button_2_pressed():
	get_tree().quit()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://levels/lobby.tscn")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://autors.tscn")
