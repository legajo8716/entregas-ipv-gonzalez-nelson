extends Sprite
export (PackedScene) var projectile_scene :PackedScene
onready var fire_position:Position2D= $FirePosition
var projectile_container:Node
var player
func set_player(player):
	self.player=player
	$Timer.start()

func _on_Timer_timeout():
	fire()

func fire():
	var projectile:Projectile= projectile_scene.instance()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position,(player.global_position -fire_position.global_position).normalized())
	projectile.connect("delete_requested",self,"_on_Timer_timeout")

func _on_Timer_timeout(projectile):
	projectile_container.remove_children(projectile)
	projectile.queue_free()
