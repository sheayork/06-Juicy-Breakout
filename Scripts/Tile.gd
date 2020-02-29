extends StaticBody2D

var points = 1
onready var _target = position

onready var t = $Timer

func _ready():
	position.y = -30
	var time = rand_range(0,2.5)
	t.set_wait_time(time)
	t.start()
	yield(t,"timeout")
	$Tween.interpolate_property(self, "position", position, _target, 5.0, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()
