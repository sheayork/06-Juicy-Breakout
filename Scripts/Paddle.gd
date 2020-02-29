extends KinematicBody2D

var _target = position 

onready var _shape = $ColorRect.get_rect().size
onready var _view = get_viewport().get_visible_rect().size

func _ready():
	set_process(true)
	position.y = .30
	$Tween.interpolate_property(self, "position", position, _target, 1, Tween.TRANS_CIRC, Tween.EASE_OUT)
	$Tween.start()

func _physics_process(delta):
	var shape = $ColorRect.get_rect().size
	var view = get_viewport().get_visible_rect().size
	var target = get_viewport().get_mouse_position().x
	if target < shape.x / 2:
		target = shape.x / 2
	if target > view.x - shape.x / 2:
		target = view.x - shape.x / 2
	position = Vector2(target, position.y)
	
	if _target != position.x:
		var x = position.x + ((target - position.x)*0.2)
		var w = 1 + (distort_x + (abs(target - position.x) / _view.x))
		var h = 1 - (1/distory_y) + (abs(target - position.x) / _view.y)
