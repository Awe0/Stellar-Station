extends Control

@onready var dialogues = $HBoxContainer/Label

func _ready():
	visible = false


func _process(delta):
	pass


func _on_ui_dial_window_open(who : String):
	for key in PnjsDial.itemData:
		var value = PnjsDial.itemData[key]
		for i in value:
			if who == i:
				dialogues.text = PnjsDial.itemData[i]
