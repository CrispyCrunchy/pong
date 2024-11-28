extends StaticBody2D

var win_height : int
var p_height : int

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = 124
	
# called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("move_down"):
		position.y += get_parent().PADDLE_SPEED * delta

	# Limit paddle movement to within borders.
	position.y = clamp(position.y, -win_height / 2 + 110, win_height / 2 - 110)
