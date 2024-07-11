extends Node2D

## referência ao player
var playerNode = null;

## lista de inimigos atingidos
var enemiesHit := [];

## referência ao level principal
var mainLevel = null

## referência ao controlador de tempo
var controlTimer = null

## variável que define a velocidade do inimigo
var speedEnemy : float = 25.0;

## variável que define a velocidade do inimigo
var quantiiesyEnemies : int = 4;

#var difficulties = {
	#"spawn_enemies_amount" : 4,
	#"velocity" : 200.0
#}
var difficults = {
	"minute1" : {
		"quantiiesyEnemies" : 4,
		"velocityEnemy" : 25.0
	},
	"minute2" : {
		"quantiiesyEnemies" : 8,
		"velocityEnemy" : 50.0
	},
	"minute3" : {
		"quantiiesyEnemies" : 12,
		"velocityEnemy" : 75.0
	},
	"minute4" : {
		"quantiiesyEnemies" : 18,
		"velocityEnemy" : 100.0
	}
}
