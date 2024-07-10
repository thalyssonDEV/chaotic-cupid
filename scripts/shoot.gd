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

## quando um corpo colidir com a bala
func _on_body_entered(body):
	## referência a lisat de inimigos atingidos
	var _listEnemies = Global.enemiesHit;
	## se o corpo for uma instância da classe Enemy
	if is_instance_of(body, Enemy):
		## apaga a instância da bala
		queue_free();
		## paraliza o inimigo:
		body.canMove = false;
		## guarda na lista de inimigos atingidos o inimigo atual
		_listEnemies.append(body);
		
		## se ja tiverem dois inimigos atingidos
		if len(_listEnemies) == 2:
			## checagem se os inimigos da lista são compatíveis
			var _theTwoEnemiesIsCompatible: bool = _listEnemies[0].compatible.identity == _listEnemies[1].compatible.identity;
			
			## se forem compatíevis
			if _theTwoEnemiesIsCompatible:
				## eleimina os inimigos atingidos da partida
				for enemy in _listEnemies:
					enemy.queue_free();
				## limpa a lista de inimigos atingidos
				_listEnemies.clear();
				return
			
			## volta a movimentação dos inimigos atingidos novamente
			for enemy in _listEnemies:
				enemy.canMove = true;
			## limpa a lista de inimigos atingidos
			_listEnemies.clear();
			
		
