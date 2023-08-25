extends "res://Paddle.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	position.x = 150
	position.y = screen_size.y / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	
	if Input.is_action_pressed("left_paddle_up"):
		position.y -= velocity * delta
	if Input.is_action_pressed("left_paddle_down"):
		position.y += velocity * delta
	
