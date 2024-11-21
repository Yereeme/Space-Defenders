extends Node2D

#Youtube Tutorial URL: https://www.youtube.com/watch?v=-UuPEaaZkV0
#Creating Laser Shot

var laser_scene := load("res://Players/Laser.tscn")

func shoot():
	var laser = laser_scene.instantiate()
	laser.global_position = self.global_position
	get_node("/root/Game").add_child(laser)
