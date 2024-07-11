extends CanvasLayer

signal tenSecondsPassed

func _ready():
	Global.controlTimer = self;
	pass

var seconds = 0
var minutes = 0

## Verifica se o formato é válido, redefinindo os segundos quando forem iguais a 60, e adicionando 1 aos minutos
func _process(delta):
	if seconds > 59:
		minutes += 1
		seconds = 0
		
	# Define o formato em que o temporizador será exibido na tela
	if seconds < 10 and minutes < 10:
		$Label.text = "0" + str(minutes) + ":0" + str(seconds);
	elif minutes > 9 and seconds > 9:
		$Label.text = str(minutes) + ":" + str(seconds);
	elif minutes < 10 and seconds > 9:
		$Label.text = "0" + str(minutes) + ":" + str(seconds);
	else:
		$Label.text = str(minutes) + ":0" + str(seconds);
	
	
## Incrementa os segundos constantemente
func _on_timer_timeout():
	seconds += 1
	# caso tenha passado 10 segundos, emita o sinal
	if seconds % 10 == 0:
		emit_signal("tenSecondsPassed")
