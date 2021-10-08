extends "res://entities/AbstractState.gd"

func enter():
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	return


func handle_input(event:InputEvent):
	pass


func update(delta:float):
	parent.velocity.x=parent.velocity.x*8
	
	parent._handle_cannon_actions()
	parent._handle_move_input()
	parent._apply_movement()
	if parent.move_direction == 0:
		emit_signal("finished", "idle")
	
