extends Node

var PlayerScore = 0
var OpponentScore = 0

func _on_Left_body_entered(body):
	score_achieved()
	OpponentScore += 1

func _on_Right_body_entered(body):
	score_achieved()
	PlayerScore += 1

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)
	open_menu()

func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup','start_ball')
	$CountdownLabel.visible = false

func score_achieved():
	$Ball.position = Vector2(640,360)
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
	$Player.position.x = 35
	$Opponent.position.x = 1280 - 35
	
func _on_Restart_pressed():
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$Player.position.x = 35
	$Opponent.position.x = 1280 - 35
	
func _on_Quit_pressed():
	get_tree().quit()
	
func _on_Continue_pressed():
	$VBoxContainer.visible = false
func open_menu():
	if Input.is_action_pressed("Menu"):
		$VBoxContainer.visible = true
