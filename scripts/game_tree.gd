extends Node2D
class_name Game_Tree

func _enter_tree() -> void:
	Globals.game_tree = self

func tower_toppled():
	#Drop the tower
	#Shake Camera
	#Tween Chromatic Aberration
	#Slowmotion
	pass
