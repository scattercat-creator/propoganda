extends CharacterBody2D
#@onready var area_2d = $Area2D

@onready var gui = %GUI

var dialogue = ["Rody: Hey, Tom.", "Tom: You doing alright, buddy?",
"Rody: I'm fine", "Tom: You don't look too good, you might want to get yourself checked out...",
"Rody: I said I'm fine, Tom, for fucks sake.",
"[%GREENHEAD%]", "Rody: Blegh!",
"Tom: Aw dude not on the new hardwood floors, they just got waxed.",
"Tom: It was all shiny and perfect and now the acid in the vomit just ruined it.",
"Tom: ...wait are you drunk right now?"]
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
	gui.change_text("Tom: Rody! My favorite guy!")
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

