extends Control

func _ready() -> void:
	$Controls/Label.text = "Score total: " + str(Global.score);

## função para voltar para o menu principal
func _on_main_menu_pressed():
	# muda para a cena de menu inicial
	Global.changeScene("mainMenu");

## função para finalizar o jogo
func _on_quit_pressed():
	# finaliza a execução do jogo
	get_tree().quit();
