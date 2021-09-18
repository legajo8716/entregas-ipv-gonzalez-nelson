extends Sprite
onready var cannon :Sprite=$Cannon #llama a cannon una sola vez
var speed = 200 #Pixeles

func _physics_process(delta):
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var mouse_position:Vector2=get_global_mouse_position()

	cannon.look_at(mouse_position)
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	position.x += direction_optimized * speed * delta
