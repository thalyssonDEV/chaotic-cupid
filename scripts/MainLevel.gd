extends Node2D

## dicionário de inimigos
var enemies :Dictionary = {
	"enemyRed" : preload("res://entities/enemies/enemy1(red)/enemy_red.tscn"),
	"enemyGreen": preload("res://entities/enemies/enemy2(green)/enemy_green.tscn"),
	"enemyPurble": preload("res://entities/enemies/enemy3(purple)/enemy_purple.tscn")
}

var cont: = 0;

func _ready() -> void:
	Global.mainLevel = self;
	# conecetando sinal tebSeondsPasses com a função de instanciar inimigos
	Global.controlTimer.tenSecondsPassed.connect(spawnEnemies)

#func _process(delta) -> void:
	#conditionToSpawner();

## função que instancia uma serie de inimigos baseado em uma disiculdade
func spawnEnemies() -> void:
	var _amount = Global.difficulties.get("spawn_enemies_amount")
	for enemy in range(_amount):
		spawnerEnemy();

## função para instanciare inimigos na tela do jogo
func spawnerEnemy() -> void:
	randomize();
	# vetor de chaves do dicionário de inimigos
	var _keys = enemies.keys();
	# peag index aleatório em um range de 0 ao tamanho do vetor - 1 (ja que se inicia em 0)
	var _index = randi_range(0, len(_keys) - 1);
	# guarda referência da instância de um inimigo
	var _instanceEnemy = enemies.get(_keys[_index]).instantiate();
	# define a posição de nascimento como uma versão aleatória no limite da dimensão da tela
	_instanceEnemy.position = Vector2(randf_range(-247, 270), randf_range(-135, 190));
	# adiciona a instância como filha da cena
	get_node("Enemies").add_child(_instanceEnemy);
	
	
	