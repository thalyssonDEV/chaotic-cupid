extends ProgressBar

var bg_color_red : StyleBoxFlat = preload("res://assets/themes/bg_color_red.tres");
var bg_color_green : StyleBox = preload("res://assets/themes/bg_color_green.tres");

func _ready() -> void:
	value = Global.health;
	Global.healthBar = self;
