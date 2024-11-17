extends CharacterBody2D
#@onready var area_2d = $Area2D

@onready var gui = %GUI

var dialogue = ["Rody: ...", "Tiffany: ...", "Tiffany: who shit in his cereal?",
'Rody: ????', 'Tiffany: Wait did you hear that?', "Rody: ...", 'Tiffany: ...']
var dialogue_started = false
var dialogue_count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	gui.change_text("Mission: Find Sammy")
	
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	print("hi")
	gui.change_text("Tiffany: Hi Rody! Isn't it a beautiful day out?")
	print(body.name)
	dialogue_started = true
	dialogue_count = 0

func _input(event):
	if(dialogue_started and event.is_action_pressed("ui_accept")):
		if(dialogue_count < len(dialogue)):
			gui.change_text(dialogue[dialogue_count])
			dialogue_count += 1
		else:
			gui.change_text("Mission: Find Sammy")
			dialogue_started = false
		
func _on_area_2d_body_exited(body):
	gui.change_text("Mission: Find Sammy")
	dialogue_started = false

