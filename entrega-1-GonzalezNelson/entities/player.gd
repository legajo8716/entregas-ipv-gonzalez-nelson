extends Sprite

export (float) var speed:float=200


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	var direction:int=0
#	if Input.is_action_pressed("move_left"):
#		direction = -1
#	elif Input.is_action_pressed("move_rigth"):
#		direction = 1
#	position.x += direction*speed*delta
func _process(delta):
	var direction:Vector2=Vector2(int(Input.is_action_pressed("move_rigth"))-int(Input.is_action_pressed("move_left")),int(Input.is_action_pressed("move_down"))-int(Input.is_action_pressed("move_up")))
	position +=direction*speed*delta
