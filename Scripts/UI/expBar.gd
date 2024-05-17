extends TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_experience_gained(job, growthData):
	print("hello")
	max_value = growthData[job][2]
	value = growthData[job][0]
