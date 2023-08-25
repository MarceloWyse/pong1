extends CanvasLayer

@onready var ball = $"../Ball"
@onready var right_score = $RightScore
@onready var left_score = $LeftScore
var score 
var screen_size

signal three
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	left_score.offset_left = 300
	left_score.offset_top = 50
	
	right_score.offset_right = screen_size.x - 300
	right_score.offset_top = 50
	
	ball.connect("right_point", add_score_right)
	ball.connect("left_point", add_score_left)
	
func add_score_right():
	score = int(right_score.text)
	right_score.text = str(score + 1)

func add_score_left():
	score = int(left_score.text)
	left_score.text = str(score + 1)
