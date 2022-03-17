extends KinematicBody2D

var velocitat_base = 200 #la velocitat inicial
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980


func _physics_process(delta):
	move_and_slide(velocitat)
	velocitat += gravetat * delta
