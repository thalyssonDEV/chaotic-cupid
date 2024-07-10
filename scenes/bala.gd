extends Area2D

class_name Bala

@export_category("Propiety bala")
@export var speedShoot: float = 200.0;

func _ready() -> void:
	pass

func _process(delta) -> void:
	## chamada da função para mover a bala
	moveShoot(delta);
	
## função para mover a bala
func moveShoot(delta) -> void:
	## pega uma vetor RIGHT e manipula com a rotação
	var _direction = Vector2.RIGHT.rotated(rotation);
	## incrementa a posição do objeto baseado no valor de _direction * uma velocidade * delta
	global_position += _direction * speedShoot * delta;

## quando o objeto instanciado sair da area delimitada (area total da tela)
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();   # exclue a instância do objeto
