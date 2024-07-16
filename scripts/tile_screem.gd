extends Control

func _ready():
	# para a música da partida
	Global.trackGame.stop();
	# da um foco no boão de start
	$Controls/startButton.grab_focus()

## função de clique no botão de start
func _on_start_button_pressed():
	# toca o som de click
	Global.clickSound.play();
	# muda para a cena de level principal
	Global.changeScene("mainLevel");

## função para o butão de quit
func _on_quit_button_pressed():
	# toca o som de click
	Global.clickSound.play();
	# finaliza a execução do jogo
	get_tree().quit();
