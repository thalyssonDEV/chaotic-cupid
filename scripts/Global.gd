extends Node2D

## referência ao player
var playerNode = null;

## lista de inimigos atingidos
var enemiesHit := [];

## referência ao level principal
var mainLevel = null

## referência ao controlador de tempo
var controlTimer = null

var difficulties = {
	"spawn_enemies_amount" : 4 
}
