extends "res://entities/AbstractState.gd"


func handle_input(event:InputEvent):
	

func update(delta:float):
	parent._handle_cannon_actions()
	parent._handle_deacceleration()
	parent._apply_movement()
	
