extends Area2D

var one_fire = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if one_fire and body.get_name() == "Player":
		$AnimationPlayer.play("npc_text")
		one_fire = false
