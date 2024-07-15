extends CanvasLayer

# variável de cena de destino
var destinyScene : PackedScene = null
# varíável de progresso de modulate
var progress : float = 0.0;

func _process(delta) -> void:
	# progresso vai de 0.0 a 1.0 em um timer de 0.02s
	progress = move_toward(progress, 1.0, 0.02);
	# altera o mudulate em a de acordo com o progress
	$ColorRect.modulate.a = progress;
	# quando finalizar o fadein
	if progress >= 1.0:
		# mude para a cena destino
		get_tree().change_scene_to_packed(destinyScene);
		# deleta a cena de fadeIn da cena
		queue_free();
