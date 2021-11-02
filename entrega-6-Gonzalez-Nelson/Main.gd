extends Node

onready var player = $Environment/Player
onready var background=$background
onready var backgroundEnvironmen=$backgroundEnvironment
onready var urlAudioDead="res://assets/audio/bgm/gameOver.ogg"

func _ready():
	randomize()
	player.initialize(self)
	
func _unhandled_input(event):
	if(player.deadMusic):
		backgroundEnvironmen.stop()
		background.stop()
		var sfx= load(urlAudioDead)
		background.stream=sfx
		background.play()

	if event.is_action("restart"):
		_restart_level()

func _restart_level():
	get_tree().reload_current_scene()

