extends Sprite
class_name Turret
export (PackedScene) var projectile_scene :PackedScene
onready var fire_position:Position2D= $FirePosition
var projectile_container:Node
var player
var rng = RandomNumberGenerator.new()
func set_values(player,projectile_container):
	self.player=player
	$Timer.start()
	self.projectile_container=projectile_container
	rng.randomize()
	global_position.x=rng.randi_range(0, 800)
	global_position.y=rng.randi_range(player.top.global_position.y-fire_position.position.y, 0)
	
func _on_Timer_timeout():
	fire()

func fire():
	var projectile:Projectile= projectile_scene.instance()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position,(player.global_position -fire_position.global_position).normalized())
	projectile.connect("delete_requested",self,"_on_projectile_delete_requested")
func _on_projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
