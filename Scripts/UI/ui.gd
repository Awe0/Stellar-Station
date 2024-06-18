extends Control

signal experienceReceived(growthData, jobLevels)
signal enduranceChanged(enduranceAmount)
signal dialWindowOpen()

@onready var leftBox = $LeftBox
@onready var itemBar = $ItemBar
@onready var dialogueWindow = $Dialogues
@onready var graduateFlask = $Graduate_flask


var leftBoxVisibility = false


func _ready():
	leftBoxVisibility = false


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

func _on_player_endurance_changed(enduranceAmount : int):
	enduranceChanged.emit(enduranceAmount)

func _on_pnj_interaction(who : String):
	dialogueWindow.visible = true
	itemBar.visible = false
	dialWindowOpen.emit(who)
