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
var speedEnemy : float = 75.0;

## variável que define a velocidade do inimigo
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
