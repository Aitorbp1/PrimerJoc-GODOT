extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocitat = Vector2(220,300)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100, 300)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocitat * delta
	$Fill.rotation_degrees += 10
	if position.x >= 1024 or position.x <= 0:
		velocitat.x *= -1
	if position.y >= 600 or position.y <= 0:
		velocitat.y *= -1
	#position = get_global_mouse_position()
	
