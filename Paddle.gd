extends Area2D

@onready var collision_polygon_2d = $CollisionPolygon2D
@onready var polygon_2d = $CollisionPolygon2D/Polygon2D

@export var velocity = 500
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon
	screen_size = get_viewport_rect().size
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y < 0:
		position.y = 0
	
	if position.y > screen_size.y - 50: #the screen_size.y - the height of the paddle
		position.y = screen_size.y - 50
