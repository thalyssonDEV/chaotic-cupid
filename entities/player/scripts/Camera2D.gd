extends Camera2D

# variáveis para realizar o tremor na camera
var agitationAmount : float = 0.0;
var agitationDuration : float = 0.0;
var agitationTimer : float = 0.0;

func _ready() -> void:
	Global.camera = self;

## função para receber parâmetros necessários para agitação da tela
func initAgitation(amount: float, timer:float):
	agitationAmount = amount;
	agitationTimer = timer;
	agitationDuration = agitationTimer;
	
func _process(delta) -> void:
	# se ainda estiver duração
	if agitationDuration > 0:
		agitationDuration -= delta;
		
		# pega valores aleatórios para x e y
		var _ofX = (randf() * 2 - 1) * agitationAmount;
		var _ofY = (randf() * 2 - 1) * agitationAmount;
		
		# aplica valores no offset da câmera
		offset = Vector2(_ofX, _ofY);
	else:
		offset = Vector2.ZERO;
