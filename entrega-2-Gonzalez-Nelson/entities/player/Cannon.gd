extends Sprite

onready var fire_position :Position2D=$FirePosition 
export (PackedScene) var proyectile_scene:PackedScene
var projectile_container:Node


func fire():
	var proyectile_instance:Proyectile=proyectile_scene.instance()
	projectile_container.add_child(proyectile_instance)
	proyectile_instance.set_starting_values(fire_position.global_position,(fire_position.global_position -global_position).normalized())
	
