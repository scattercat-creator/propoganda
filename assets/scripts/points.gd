extends MarginContainer
var myPoints = 0
@onready var progress_bar = $ProgressBar
@onready var lolsigns = $"../lolsigns"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func addPoints():
	myPoints += 1
	progress_bar.value = myPoints
	if(myPoints >= 5):
		lolsigns.drop()
		
