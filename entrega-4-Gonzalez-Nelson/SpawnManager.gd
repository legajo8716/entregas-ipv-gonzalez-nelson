extends Node
export (NodePath) var pathfinding:NodePath

func _ready():
	if pathfinding.is_empty():
		return
	var pathfinding:PathfindAstar=get_node(pathfinding)
	if pathfinding == null:
		return 
	for child in get_children():
		child.pathfinding = pathfinding
	
