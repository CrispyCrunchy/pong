extends Node2D

@onready var pause_menu = $Camera2D/pause_menu
var paused = false
var score := [0, 0]# 0:Player, 1:CPU
const PADDLE_SPEED : int = 400

func _on_ball_timer_timeout() -> void:
	$Ball.new_ball()
	
func _on_score_left_body_entered(_body: Node2D) -> void:
	score[1] += 1
	$HUD/CPUScore.text = str(score[1])
	$BallTimer.start()

func _on_score_right_body_entered(_body: Node2D) -> void:
	score[0] += 1
	$HUD/PlayerScore.text = str(score[0])
	$BallTimer.start()

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
