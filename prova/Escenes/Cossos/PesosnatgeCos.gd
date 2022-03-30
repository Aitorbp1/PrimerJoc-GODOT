extends KinematicBody2D

var velocitat_base = 200 #la velocitat inicial
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -350

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou amunt") and is_on_floor():
		velocitat.y = velocitat_salt
		
	
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	animation(velocitat)
func animation(velocitat):
	if velocitat.x > 0 and velocitat.y > -2:
		$Alieen.play("Camina")
		$Alieen.flip_h = false
	elif velocitat.x < 0 and velocitat.y > -2:
		$Alieen.play("Camina")
		$Alieen.flip_h = true
		
	if abs(velocitat.x) < 0.1 and velocitat.y > -1:
		$Alieen.play("Quiet")
		
	if velocitat.y < -2:
		$Alieen.play("Salta")
		
	

 


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Escenes/Cossos/escena2.tscn")
