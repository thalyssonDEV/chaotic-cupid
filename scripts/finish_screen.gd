extends Control

func _ready() -> void:
	$Label.text = "Score total: " + str(Global.score);

## função para voltar para o menu principal
func _on_main_menu_pressed():
	# muda para a cena de menu inicial
	get_tree().change_scene_to_file("res://scenes/tile_screem.tscn");

## função para finalizar o jogo
func _on_quit_pressed():
	# finaliza a execução do jogo
	get_tree().quit();
