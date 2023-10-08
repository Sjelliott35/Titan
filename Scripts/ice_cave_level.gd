extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.velocity.y = 400


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_alien_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene_to_file("res://end_screen.tscn")
