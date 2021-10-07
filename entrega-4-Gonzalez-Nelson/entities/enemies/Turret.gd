extends KinematicBody2D

onready var fire_position = $FirePosition
onready var fire_timer = $FireTimer
onready var raycast = $FirePosition/RayCast2D
onready var idle_timer:Timer=$IdleTimer
onready var detection_area:Area2D = $DetectionArea

export (PackedScene) var projectile_scene
export (Vector2) var wanderling_range:Vector2
var target
var projectile_container
var pathfinding:PathfindAstar
var path :Array=[]
var velocity:Vector2=Vector2.ZERO
func _ready():
	fire_timer.connect("timeout", self, "fire")
	set_physics_process(false)
	idle_timer.start()

func initialize(container, turret_pos, projectile_container):
	container.add_child(self)
	global_position = turret_pos
	self.projectile_container = projectile_container

func fire():
	if target != null:
		var proj_instance = projectile_scene.instance()
		if projectile_container == null:
			projectile_container = get_parent()
		proj_instance.initialize(projectile_container, fire_position.global_position, fire_position.global_position.direction_to(target.global_position))
		fire_timer.start()

func _physics_process(delta):
	raycast.set_cast_to(to_local(target.global_position))
	if raycast.is_colliding() && raycast.get_collider() == target:
		if fire_timer.is_stopped():
			fire_timer.start()
	elif !fire_timer.is_stopped():
		fire_timer.stop()
	if !path.empty():
		var next_point:Vector2=to_local(path.front())
		velocity.x += clamp((next_point-position).normalized()
	
func notify_hit(_amount):
	call_deferred("_remove")


func _remove():
	hide()
	detection_area.monitorable = false
	detection_area.monitoring = false
	collision_layer = 0
	collision_mask = 0


func _on_DetectionArea_body_entered(body):
	if target == null:
		target=body
		set_physics_process(true)


func _on_DetectionArea_body_exited(body):
	if body == target:
		target = null
		set_physics_process(false)



func _on_IdleTimer_timeout():
	var point:Vector2=Vector2( rand_range(-wanderling_range.x,wanderling_range.x),rand_range(-wanderling_range.y,wanderling_range.y))
	path=pathfinding.get_simple_path(global_position,global_position +point)
	
