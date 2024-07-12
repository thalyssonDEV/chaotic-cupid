extends Area2D

class_name Bala

@export_category("Propiety bala")
@export var speedShoot: float = 200.0;

func _ready() -> void:
	Global.shootNode = self;

func _process(delta) -> void:
	# chamada da função para mover a bala
	moveShoot(delta);
	
## função para mover a bala
func moveShoot(delta) -> void:
	# pega uma vetor RIGHT e manipula com a rotação
	var _direction = Vector2.RIGHT.rotated(rotation);
	# incrementa a posição do objeto baseado no valor de _direction * uma velocidade * delta
	global_position += _direction * speedShoot * delta;

## quando o objeto instanciado sair da area delimitada (area total da tela)
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();   # exclue a instância do objeto

##corpo colidir com a bala
func _on_body_entered(body):
	# referência a lisat de inimigos atingidos
	var _listEnemies = Global.enemiesHit;
	# se o corpo for uma instância da classe Enemy
	if is_instance_of(body, Enemy):
		# apaga a instância da bala
		queue_free();
		# paraliza o inimigo:
		body.canMove = false;
		# remove a camada layer da colisão do inimigo, assim não é possivel atirar nele novamente
		body.collision_layer = 0;
		# guarda na lista de inimigos atingidos o inimigo atual
		_listEnemies.append(body);
		
		# se ja tiverem dois inimigos atingidos
		if len(_listEnemies) == 2:
			# checagem se os inimigos da lista são compatíveis
			var _theTwoEnemiesIsCompatible: bool = _listEnemies[0].compatible.identity == _listEnemies[1].compatible.identity;
			
			# se forem compatíevis
			if _theTwoEnemiesIsCompatible:
				# incrementa o score
				Global.score += 3;
				# define a cor do label da mensagem como verde
				Global.message.label.add_theme_color_override("font_color", Color(0,1,0))
				# chama a função de emitir mensagem passando o array de mensagens de erro
				Global.message.emitMessage(Global.message.messages.get("correctUnion"));
				# para cada um dos dois inimigos da lista
				for enemy in _listEnemies:
					# a propriedade isDeath fica valendo true
					enemy.isDeath = true;
				# limpa a lista de inimigos atingidos
				_listEnemies.clear();
				return
			
			# caso não tenha sido a união correta
			# chama função de tremer a camera
			Global.camera.initAgitation(0.9, 0.6);
			# define a cor do label da mensagem como vermelha
			Global.message.label.add_theme_color_override("font_color", Color(1,0,0));
			# chama a função de emitir mensagem passando o array de mensagens de acerto
			Global.message.emitMessage(Global.message.messages.get("wrongUnion"));
			# decrementa a quantidade limite de erros
			Global.limitOfErros -= 1;
			# volta a movimentação dos inimigos atingidos novamente
			for enemy in _listEnemies:
				## adiciona novamente a camada de layer
				enemy.collision_layer = 2;
				enemy.canMove = true;
				enemy.isDeath = false;
			# limpa a lista de inimigos atingidos
			_listEnemies.clear();
			
		
