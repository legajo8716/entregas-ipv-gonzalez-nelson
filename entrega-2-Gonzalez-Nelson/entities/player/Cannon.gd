extends Sprite

onready var fire_position :Position2D=$FirePosition 
export (PackedScene) var proyectile_scene:PackedScene



func fire():
	var proyectile_instance:Proyectile=proyectile_scene.instance()
	fire_position.add_child(proyectile_instance)
