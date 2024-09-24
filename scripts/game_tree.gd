extends Node2D
class_name Game_Tree

func _enter_tree() -> void:
	Globals.game_tree = self

func _ready() -> void:
	Globals.game_over.connect(tower_toppled)

func tower_toppled():
	if Globals.lost_game == false:
		Globals.lost_game = true
		#Slowmotion
		Engine.time_scale = 0.1
		#Tween Chromatic Aberration
		Globals.canvas.faze_aberration()
		#Shake Camera
		Globals.camera.apply_shake(20)
		#Drop the tower
		Globals.tower.topple()
