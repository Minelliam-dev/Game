extends Node2D

@onready var game = $"game scene"
@onready var menu = $"menu"
@onready var player = $"game scene/player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	openMenu()


func openMenu() -> void:
	game.hide()
	player.Moving_allowed = false
	menu.show()
	
func startGame() -> void:
	game.show()
	player.Moving_allowed = true
	
	menu.hide()


func _on_button_pressed() -> void:
	get_tree().quit()


func _on_button_2_pressed() -> void:
	startGame()
