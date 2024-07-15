extends Node2D

## dicionário de inimigos
var enemies :Dictionary = {
	"enemyRed" : preload("res://entities/enemies/enemy1(red)/enemy_red.tscn"),
	"enemyGreen": preload("res://entities/enemies/enemy2(green)/enemy_green.tscn"),
	"enemyPurble": preload("res://entities/enemies/enemy3(purple)/enemy_purple.tscn")
}

# referência a label de quantiade limite de limites de erros
@onready var labelLimitErros = get_node("Labels/LabelErros") as Label;
# referência ao label de score
@onready var labelScore = get_node("Labels/LabelScore") as Label;
# referência ao label de vida
@onready var labelLife = get_node("Labels/LabelLife") as Label;

# minuto atual do jogp
var currentMinute: = 0;

func _ready() -> void:
	# pega referência ao grupo dos inimigos	
	var _groupeEnemies = get_node("Enemies");
	# se esse no de inimigos possuir filhos
	if _groupeEnemies.get_children().size() > 0:
		# remove cada um deles da cena
		for child in _groupeEnemies.get_children():
			_groupeEnemies.remove_child(child);
			child.queue_free();
	# reseta o limite de erros
	Global.limitOfErros = 10;
	# reseta a vida
	Global.health = 100;
	# restaura a vida total no healthBar
	Global.healthBar.value = Global.health;
	# reseta o score
	Global.score = 0;
	Global.mainLevel = self;
	# conecetando sinal tebSeondsPassed com a função de instanciar inimigos
	Global.controlTimer.tenSecondsPassed.connect(spawnEnemies);
	# conectando o sinal oneSecondPasses com a função de mudar as propiedades
	Global.controlTimer.oneMinutePassed.connect(changePropieties);
	
func _process(delta) -> void:
	# verificando se uma das condições de morte ocorreram
	if Global.controlTimer.minutes == 6 or Global.health <= 0 or Global.limitOfErros <= 0:
		# muda para a cena de tela final
		get_tree().change_scene_to_file("res://scenes/finish_screen.tscn");
	# se a quantidade limite de erros for menor que 3
	if Global.limitOfErros <= 3:
		# muda a cor da font para vermelha, para alertar o player
		labelLimitErros.add_theme_color_override("font_color", Color(1, 0, 0));
	# colocando no label informação da quantidade de liite de erros
	labelLimitErros.text = "Limit erros: " + str(Global.limitOfErros);
	# colocando no label a informação referent ao score do player
	labelScore.text =  "Score: " + str(Global.score);

## função que altera as propieades de dificuldades do jogo
func changePropieties() -> void:
	# referência ao dicionário de dificuldades da global
	var _dict : Dictionary = Global.difficults;
	# incrementa o minuto
	currentMinute += 1
	# vetor de chaves do dicionário de propriedades de dificuldades
	var _vectorKeys = Global.difficults.keys();
	# quantidade de inimigos vai ser um informação que tem no dicionário de dificuldade de acordo com o minuto atual
	Global.quantiiesyEnemies = _dict.get(_vectorKeys[currentMinute]).get("quantiiesyEnemies");
	# a velocidade dos inimigos vai ser um informação que tem no dicionário de dificuldade de acordo com o minuto atual
	Global.speedEnemy = _dict.get(_vectorKeys[currentMinute]).get("velocityEnemy");
	print("cheanged proprienties")

## função que instancia uma serie de inimigos baseado 
func spawnEnemies() -> void:
	var _amount = Global.quantiiesyEnemies;
	for enemy in range(_amount):
		spawnerEnemy();

## função para instanciar inimigos na tela do jogo
func spawnerEnemy() -> void:
	randomize();
	# vetor de chaves do dicionário de inimigos
	var _keys = enemies.keys();
	# pega index aleatório em um range de 0 ao tamanho do vetor - 1 (ja que se inicia em 0)
	var _index = randi_range(0, len(_keys) - 1);
	# guarda referência da instância de um inimigo
	var _instanceEnemy = enemies.get(_keys[_index]).instantiate();
	# define a posição de nascimento como uma versão aleatória no limite da dimensão da tela
	_instanceEnemy.position = Vector2(randf_range(-247, 270), randf_range(-135, 190));
	# continue procurando uma posição se a posição sorteada for a do player
	while (_instanceEnemy.position == Global.playerNode.position):
		# pega uma outra posição
		_instanceEnemy.position = Vector2(randf_range(-247, 270), randf_range(-135, 190))
	# adiciona a instância como filha da cena
	get_node("Enemies").add_child(_instanceEnemy);
	
	
	
