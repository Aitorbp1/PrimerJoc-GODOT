extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocitat = 300
var velocitat_angular = 90
var direccio = Vector2 (0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direccio = Vector2.ZERO
	
	if Input.is_action_pressed("mou dreta"):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("mou esquerra"):
		direccio += Vector2.LEFT
	if Input.is_action_pressed("mou amunt"):
		direccio += Vector2.UP
	if Input.is_action_pressed("mou avall"):
		direccio += Vector2.DOWN
	
	position += direccio.normalized() * velocitat * delta
	
	#position = get_global_mouse_position()
	


func _on_Personatge_area_entered(area):
	area.modulate = Color(0, 1, 0)
	
	if area.is_in_group('Final'):
		modulate = Color(1, 0, 0)
	elif area.is_in_group('Inici'):
		modulate = Color(0, 0, 1)
	


func _on_Personatge_area_exited(area):
	modulate = Color(1, 1, 1)
	area.modulate = Color(1, 1, 1)
