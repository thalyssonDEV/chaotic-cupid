extends CanvasLayer

class_name Message

# referêcia ao label de texto
@onready var label = get_node("Label") as Label;
# referência ao timer de mensagem
@onready var timerOfTheMessage = get_node("Timer") as Timer;

# dicionário de mensagens de erros e acertos
var messages : Dictionary = {
	"correctUnion" : [
		"💘 Amor à primeira vista!",
		"💘 Você uniu um casal perfeito!",
		"💘 Cupido arrasou!",
		"💘 Louca paixão!"
	],
	"wrongUnion" : [
		"❌ Ops, tente novamente!",
		"❌ Esse não é o par certo!",
		"❌ Cuidado, você errou!",
		"❌ Possue um outro amor"
	]
}

func _ready() -> void:
	#Global.shootNode.unionCorrect.connect(emitMessage)
	Global.message = self;


## função para exibir uma mensagem aleatória de um vetorde mensagens
func emitMessage(list : Array) -> void:
	randomize();
	# pega valor aleatório no range do letor
	var _index = randi_range(0, list.size() -1);
	# pega a mensagem referente a posição do index aleatório sorteado
	var _message = list[_index];
	# joga o conteúdo da mensagem no campo de texto do label
	label.text = _message;
	# ativa a visibilidade do label
	label.visible = true;
	timerOfTheMessage.start();
	

## função executada quando o tempo da mensagem chegar ao fim
func _on_timer_timeout():
	# desabilita a visibilidade do label
	label.visible = false;
