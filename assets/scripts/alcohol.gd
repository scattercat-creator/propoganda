extends Area2D


@onready var points = $"../../player/Camera2D/Points"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("AHHHH I'VE BEEN TOUCHED")
	points.addPoints()
	queue_free()
	 # Replace with function body.
