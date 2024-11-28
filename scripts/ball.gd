extends CharacterBody2D

var win_size : Vector2
const START_SPEED : int = 500
const ACCELERATION : int = 50
var speed : int
var direction : Vector2
const MAX_Y_VECTOR : float = 0.6

# Called whenever the node enters the scene tree for the first time
func _ready() -> void:
	win_size = get_viewport_rect().size
	
func new_ball() -> void:
	#randomize startposition and direction
	position.x = 0
	position.y = randi_range(-win_size.y / 2 +200, win_size.y / 2 - 200)
	speed = START_SPEED
	direction = random_direction()
	
# Called every frame. 'delta' is the elapsed time since the previous frame
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		# If ball hits paddle
		if collider == $"../Player" or collider == $"../CPU":
			speed += ACCELERATION
			direction = new_direction(collider)
		# If ball hits wall
		else:
			direction = direction.bounce(collision.get_normal())
	
func random_direction() -> Vector2:
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()

func new_direction(collider) -> Vector2:
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	# Flip the horisontal direction
	if direction.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (dist / (collider.p_height / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()
