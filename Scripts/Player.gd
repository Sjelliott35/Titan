extends CharacterBody2D

@export var speed = 400
@export var jump_speed = -400
var look = "right"
var falling = false
var boosted = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	move_and_slide()

func get_input():
	walking_check()
	var input_direction = Input.get_axis("move_left", "move_right")
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
		if not boosted:
			falling = false
		else:
			boosted = false
	if Input.is_action_just_released("jump") and not is_on_floor() and not falling and not boosted:
		velocity.y = 0
		falling = true
	velocity.x = input_direction * speed
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
	if Input.is_action_pressed("jump") or Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		$AnimatedSprite2D.play("default")

func _on_cyclone_boost():
	velocity.y = jump_speed * 2
	boosted = true
