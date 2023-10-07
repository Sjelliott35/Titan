extends CharacterBody2D

@export var speed = 400
var look = "left"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	move_and_slide()

func get_input():
	walking_check()
	var input_direction = Input.get_vector("move_left", "move_right", "null", "null")
	velocity = input_direction * speed
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://TitleScreen.tscn")

func walking_check():
	if Input.is_action_pressed("move_left"):
		if look == "right":
			$AnimatedSprite2D.set_flip_h(true)
			look = "left"
		$AnimatedSprite2D.play("walking")
	if Input.is_action_pressed("move_right"):
		if look == "left":
			$AnimatedSprite2D.set_flip_h(false)
			look = "right"
		$AnimatedSprite2D.play("walking")
	if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		$AnimatedSprite2D.play("default")
