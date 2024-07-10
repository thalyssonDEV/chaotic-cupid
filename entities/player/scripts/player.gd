extends CharacterBody2D

class_name Player;

@export_category("Settings player")
@export var speed: float = 100.0;

## referência ao nó de animações do player
@onready var animation := get_node("AnimatedSprite2D") as AnimatedSprite2D;

func _ready() -> void:
	## informa a global que esta classe é o player
	Global.playerNode = self;
	

func _process(delta) -> void:
	## chamada da função de movimentação
	move(delta);
	move_and_slide();
	
	## chamada da função para realizar as animações do player
	enableAnimations();
	

## função para ativar as animações
func enableAnimations() -> void:
	## variável booleana para checar se o player está parado
	var _isIdle: bool = velocity == Vector2.ZERO;
	## variável booleana para checar se o player está correndo para a direita
	var _isWalkToRight: bool = velocity.x > 0;
	
	## se o player não estiver parado
	if !_isIdle:
		## chaca se está andando para a direita
		if _isWalkToRight:
			animation.flip_h = false;   # direção do player: direita
			animation.play("walk");
		else:
			animation.flip_h = true;    # direção do player: esquerda
			animation.play("walk");
	else:   # se não estiver parado
		animation.play("idle");

## função responsável por efetuar a movimentação do player
func move(delta) -> void:
	## pega os valores (-1 ou +1) para o vetor em ambos os eixos, baseado nos inputs
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized() * speed;
	
