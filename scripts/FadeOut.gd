extends CanvasLayer

# variável que guarda o progresso de fade
var progress : float = 1.0;

func _ready() -> void:
	# ativa a visibilidade do nó
	visible = true;
	
func _process(delta) -> void:
	# progresso vai de 1.0 á 0.0 em um tempo de 0.05s
	progress = move_toward(progress, 0.0, 0.05);
	$ColorRect.modulate.a = progress;
	# finaliza o progresso e finalmente muda para a cena
	if progress <= 0.0:
		queue_free();
