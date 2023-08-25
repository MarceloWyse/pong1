extends Area2D

@onready var collision_polygon_2d = $CollisionPolygon2D
@onready var polygon_2d = $CollisionPolygon2D/Polygon2D
@onready var audio_stream_player = $"../AudioStreamPlayer"

@export var h_speed = 200
@export var v_speed = 200
@export var acceleration = 15
var cont = 0

var initial_hspeed = h_speed
var initial_vspeed = v_speed
var playing = false
var screen_size
	
signal left_point
signal right_point

func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon
	screen_size = get_viewport_rect().size
	play()

func _process(delta):
	if playing: #moves the ball
		position.x += h_speed * delta
		position.y += v_speed * delta
	
	if position.y < 0 or position.y > screen_size.y:
		v_speed = v_speed * -1
		
	if position.x < 0:
		playing = false
		emit_signal("right_point")
		play()
		
	if position.x > screen_size.x:
		playing = false
		emit_signal("left_point")
		play()

func _on_area_entered(area):
	audio_stream_player.play()
	h_speed = (h_speed + acceleration * sign(h_speed)) * -1
	v_speed += acceleration * sign(v_speed)

func play():
	position.x = screen_size.x / 2
	position.y = screen_size.y / 2
	
	h_speed = initial_hspeed
	v_speed = initial_vspeed 

	if randi() % 2 == 1: #draws a number in the range [0,1]
		h_speed *= -1
		v_speed *= -1
	
	await get_tree().create_timer(1).timeout
	playing = true	
