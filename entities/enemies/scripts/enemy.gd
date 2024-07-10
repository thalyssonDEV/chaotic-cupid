extends CharacterBody2D

class_name Enemy

@export_category("Settings enemy")
@export var speed : float = 25.0;

## variável para ter uma referência ao player
@onready var player = null;
## referência ao nó d animações do inimigo
@onready var animation := get_node("AnimatedSprite2D");

func _ready() -> void:
	## pega a referência do player que está na global
	player = Global.playerNode;
	
	
func _process(delta) -> void:
	## chamada da função para o inimigo seguir o player
	followPlayer();
	move_and_slide()

## função para o inimigo seguir o player
func followPlayer() -> void:
	var _directionPlayer : Vector2 = position.direction_to(player.global_position);
	velocity = _directionPlayer * speed;
