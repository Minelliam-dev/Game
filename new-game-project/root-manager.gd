extends Node2D

@onready var game = $"game scene"
@onready var menu = $"menu"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game.hide()
	menu.show()


func openMenu() -> void:
	game.hide()
	menu.show()
	
func startGame() -> void:
	game.show()
	menu.hide()


func _on_button_pressed() -> void:
	get_tree().quit()


func _on_button_2_pressed() -> void:
	startGame()
