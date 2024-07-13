extends ProgressBar

func _ready() -> void:
	value = Global.health;
	Global.healthBar = self;
	
