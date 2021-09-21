extends Sprite
onready var cannon :Sprite=$Cannon #llama a cannon una sola vez
onready var top :Position2D=$top
var speed:Vector2 = Vector2.ZERO #Pixeles
export (float) var ACCELERATION:float=20.0
export (float) var H_SPEED_LIMIT:float=600.0
export (float) var FRICTION_WEIGHT:float=0.10
var projectile_container:Node


func set_projectile_container(container:Node):
	cannon.projectile_container=container
	projectile_container=container

func stoped():
	var stop
	if (abs(speed.x)>1) :
		 stop= lerp(speed.x,0,FRICTION_WEIGHT)
	else: 
			stop= 0
	return stop
	
func _physics_process(delta):
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var mouse_position:Vector2=get_global_mouse_position()

	cannon.look_at(mouse_position)
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	if direction_optimized!=0:
		speed.x= clamp(speed.x+(direction_optimized*ACCELERATION),-H_SPEED_LIMIT,H_SPEED_LIMIT)
	else:
		speed.x=self.stoped()
	
	
	position.x +=  speed.x * delta
