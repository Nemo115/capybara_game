extends Node
'''
All Global variables are put here
'''

signal game_over

var spawner: Spawner
var tower: Tower
var camera: Game_Camera
var game_tree: Game_Tree
var canvas: Canvas

var score: int = 0

var lost_game: bool = false
