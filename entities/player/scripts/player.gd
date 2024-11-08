extends CharacterBody2D

class_name Player;

@export_category("Settings player")
@export var speed: float = 100.0;

## referência ao nó de animações do player
@onready var animation := get_node("AnimatedSprite2D") as AnimatedSprite2D;

## referência a cena da bala
const SHOOT_SCENE = preload("res://scenes/shoot.tscn");

func _ready() -> void:
	# informa a global que esta classe é o player
	Global.playerNode = self;
	
func _process(delta) -> void:
	# chamada da função de movimentação
	move(delta);
	move_and_slide();
	
	# chamada da função para realizar as animações do player
	enableAnimations();
	
	# chamada da função para atirar
	shoot();
	
## função para atirar
func shoot() -> void:
	# variável que checa se foi solicitado um tirp
	var _isShoot = Input.is_action_just_pressed("shoot");
	
	# se solicitou para atirar
	if _isShoot:
		# guarda referência de uma instância de Bala 
		var _shoot = SHOOT_SCENE.instantiate();
		# adiciona essa instância como filha de "Shoots"
		get_parent().get_node("Shoots").add_child(_shoot);
		# define a posição de nascimento da bala
		_shoot.global_position = self.global_position;
		# pega a direção da bala como a direção do mouse, quando clicada
		_shoot.look_at(get_global_mouse_position())


## função para ativar as animações
func enableAnimations() -> void:
	# variável booleana para checar se o player está parado
	var _isIdle: bool = velocity == Vector2.ZERO;
	# variável booleana para checar se o player está correndo para a direita
	var _isLookingRight: bool = get_local_mouse_position().x > 0;
	
	animation.flip_h = false if _isLookingRight else true;
	
	# se o player não estiver parado
	if !_isIdle:
		animation.play("walk");
	else:   # se o player estiver parado
		animation.play("idle");

## função responsável por efetuar a movimentação do player
func move(delta) -> void:
	#	 pega os valores (-1 ou +1) para o vetor em ambos os eixos, baseado nos inputs
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized() * speed;
	

## função para remover vida do player
func _on_kill_zone_body_entered(body):
	# verificando se o corpo que entrou é de um inimigo
	if is_instance_of(body, Enemy):
		# damage flash effect
		var _tween = get_tree().create_tween(); # cria um tween
		_tween.tween_property(animation, "modulate", Color(100,0,0), 0.1);
		_tween.tween_property(animation, "modulate", Color(1,1,1), 0.3);
		
		# se o player estiver com 50% de sua vida padrão
		if Global.health <= 50:
			Global.healthBar.modulate = Color(100, 0, 1);
		
		# decrementa a vida do player em -10
		Global.health -= 10;
		# atualiza o valor do healhBar
		Global.healthBar.value = Global.health;

