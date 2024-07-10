extends CharacterBody2D

class_name Enemy

@export_category("Settings enemy")
@export var speed : float = 25.0;
@export var compatible : EnemyResource;

## variável que controla o movimento do inimigo
var canMove : bool = true;
## variável para ter uma referência ao player
@onready var player = null;
## referência ao nó de animações do inimigo
@onready var animation := get_node("AnimatedSprite2D");
## referência ao collisionShape2D do inimigo
@onready var colision := get_node("CollisionShape2D") as CollisionShape2D;

func _ready() -> void:
	# pega a referência do player que está na global
	player = Global.playerNode;
	
func _process(delta) -> void:
	# chamada da função para o inimigo seguir o player
	followPlayer();
	# se o objeto poder se mover
	if canMove:
		move_and_slide();
	
	# chamada da função para realizar as animações do inimigo
	enableAnimation();

## função que realiza as animações de acordo com o estado atual do inimigo
func enableAnimation() -> void:
	# variável booleana para checar se o player está correndo para a direita
	var _isWalkToRight: bool = velocity.x > 0;
	
	# se o player estiver correndo para direita
	if _isWalkToRight and animation != null:
		# direção do inimigo aponta para direita
		animation.flip_h = false;
		animation.play("walk");
	else:
		# direção do inimigo aponta para a esquerda
		animation.flip_h = true;
		animation.play("walk");

## função para o inimigo seguir o player
func followPlayer() -> void:
	# se o player não poder se mover:
	if !canMove:
		velocity = Vector2.ZERO;
		return;
	# pega a direção do player e armazena na variável
	var _directionPlayer : Vector2 = position.direction_to(player.global_position);
	# joga a direção do player multiplicada pela velocidade do inimigo em velocity
	velocity = _directionPlayer * speed;
