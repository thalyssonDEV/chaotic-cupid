extends CharacterBody2D

class_name Player;

@export_category("Settings player")
@export var speed: float = 100.0;

func _ready():
	pass
	
	
func _process(delta):
	## chamada da função de movimentação
	move(delta);
	move_and_slide();
	

## função responsável por efetuar a movimentação do player
func move(delta):
	## pega os valores (-1 ou +1) para o vetor em ambos os eixos, baseado nos inputs
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * delta * speed;
	
