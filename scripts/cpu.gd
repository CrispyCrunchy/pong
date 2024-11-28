extends StaticBody2D

var ball_pos : Vector2
var distance : int
var move_by : int
var win_height : int
var p_height

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = 124
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Move paddle towards ball
	ball_pos = $"../Ball".position
	distance = position.y - ball_pos.y
	
	if abs(distance) > get_parent().PADDLE_SPEED * delta:
		move_by = get_parent().PADDLE_SPEED * delta * (distance / abs(distance))
	else:
		move_by = distance
	
	position.y -= move_by
	
	# Limit paddle movement to within borders.
	position.y = clamp(position.y, -win_height / 2 + 110, win_height / 2 - 110)