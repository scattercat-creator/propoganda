extends AnimatedSprite2D
var pos = self.position.y
@onready var lolsigns = $"."
@onready var player = %player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func drop():
	player.setRunning(false)
	self.position = player.position
	self.position.y -= 350
	lolsigns.play("unlocked")
	while(self.position.y < player.position.y):
		self.position.y += 10
		await get_tree().create_timer(0.001).timeout
	await get_tree().create_timer(0.5).timeout
	lolsigns.play("alcoholism")
	self.rotate(.3)
	await get_tree().create_timer(5.0).timeout
	lolsigns.play("default")
	player.setRunning(true)
	
