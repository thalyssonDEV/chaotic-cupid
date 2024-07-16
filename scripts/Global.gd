extends Node2D

# SOUNDS
@onready var trackGame = get_node("TrackGame");
@onready var clickSound = get_node("ClickMouse");
@onready var errorSound = get_node("ErrorSound");
@onready var correctSound = get_node("CorrectSound");

# preloado da cena de fadeIn
var fadeIn = preload("res://scenes/fade_in.tscn");

# referência ao player
var playerNode = null;

# lista de inimigos atingidos
var enemiesHit := [];

# referência ao level principal
var mainLevel = null;

# referência ao controlador de tempo
var controlTimer = null;

# referência a classe de bala
var shootNode = null;

# referência a classe de mensagens
var message = null;

# referência a câmera do jogo
var camera = null;

# referência ao healthBar do player
var healthBar = null

# variável que define a quantidade de erros que o player pode fazer
var limitOfErros : int = 10;

# variável que recebe a informação do score
var score : int = 0;

# variável que recebe a informação de vida do player
var health : int = 100;

# variável que define a velocidade do inimigo
var speedEnemy : float = 25.0;

# variável que define a velocidade do inimigo
var quantiiesyEnemies : int = 4;

## dicionário com as propieades de dificuldades baseado no minuto em que a partida se encontra
var difficults = {
	"minute1" : {
		"quantiiesyEnemies" : 4,
		"velocityEnemy" : 25.0
	},
	"minute2" : {
		"quantiiesyEnemies" : 6,
		"velocityEnemy" : 25.0
	},
	"minute3" : {
		"quantiiesyEnemies" : 6,
		"velocityEnemy" : 50.0
	},
	"minute4" : {
		"quantiiesyEnemies" : 8,
		"velocityEnemy" : 50.0
	},
	"minute5" : {
		"quantiiesyEnemies" : 10,
		"velocityEnemy" : 70.0
	}
}

## Dicionário das principais cenas do jogo
var scenes : Dictionary = {
	"mainMenu" : preload("res://scenes/tile_screem.tscn"),
	"mainLevel" : preload("res://scenes/mainLevel.tscn"),
	"finishScreen": preload("res://scenes/finish_screen.tscn")
}

## função para mudar de uma cena para outra, porém com transação
func changeScene(destinyScene:String) -> void:
	# variável que guarda uma instância de fadein
	var _fadeinInstance = fadeIn.instantiate();
	# a cena destino é baseada no valor do diconário que tem por chave o dastinyScene
	_fadeinInstance.destinyScene = scenes.get(destinyScene);
	# instancia a cena
	add_child(_fadeinInstance);


func _on_track_game_finished():
	trackGame.play();
