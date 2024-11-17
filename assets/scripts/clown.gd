extends CharacterBody2D


@onready var gui = %GUI
@onready var animated_sprite = $AnimatedSprite2D

var dialogue = ["Rody: Could be better. What are you up to, Hal?",
"Clown: Working on my juggling. I'm writing a story on the inner life of clowns around the city.",
"Clown: Sammy increased my budget because the 'What kind of clown you'd be based on your favorite comedy movies' quiz increased traffic to our website by 12% last week.",
"Rody: Sounds like you're doing well.",
"Clown: Yeah...",
"Clown: Look, man I'm sorry about the whole promotion thing, you and Tom both deserved it.",
"Clown: I'm sure you'll get the next one.",
"Rody: I wouldn't count on it. That's what everyone said last time.",
"Clown: ...yeah, I guess it is.",
"Rody: I'll see you around. Good luck with your clown story.",
"Clown: Thanks man."]
var dialogue_started = false
var dialogue_count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	gui.change_text("Mission: Find Sammy")
	
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



#func _on_body_entered(body):

	


func _on_area_2d_body_entered(body):
	print("hi")
	animated_sprite.play("idle")
	gui.change_text("Clown: Hey, Rody! How are you?")
	print(body.name)
	dialogue_started = true
	dialogue_count = 0

func _on_area_2d_body_exited(body):
	gui.change_text("Mission: Find Sammy")
	animated_sprite.play("juggling")
	dialogue_started = false
	
func _input(event):
	if(dialogue_started and event.is_action_pressed("ui_accept")):
		if(dialogue_count < len(dialogue)):
			gui.change_text(dialogue[dialogue_count])
			dialogue_count += 1
		else:
			gui.change_text("Mission: Find Sammy")
			animated_sprite.play("juggling")
			dialogue_started = false
