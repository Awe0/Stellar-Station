extends Control

signal experienceReceived(growthData, jobLevels)
signal addToSlot(count)

@onready var leftBox = $LeftBox

var leftBoxVisibility = false
var itemNumber = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	leftBoxVisibility = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if leftBoxVisibility == true:
		leftBox.show()
	else:
		leftBox.hide()

func _on_player_input_inventory_just_pressed():
	if leftBoxVisibility == false:
		leftBoxVisibility = true
	else:
		leftBoxVisibility = false

func _on_player_experience_gained(growthData, jobLevels):
	experienceReceived.emit(growthData, jobLevels)


func _on_rock_destroyed(job, experience, count):
	itemNumber += count
	addToSlot.emit(itemNumber)
