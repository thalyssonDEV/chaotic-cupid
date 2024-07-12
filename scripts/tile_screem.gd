extends Control

func _ready():
	# da um foco no boão de start
	$Controls/startButton.grab_focus()

## função de clique no botão de start
func _on_start_button_pressed():
	# muda para a cena de level principal
	get_tree().change_scene_to_file("res://scenes/mainLevel.tscn");

## função para o butão de quit
func _on_quit_button_pressed():
	# finaliza a execução do jogo
	get_tree().quit();
