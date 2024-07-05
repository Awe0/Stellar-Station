extends Control

@onready var dialogues = $HBoxContainer/Dial

func _ready():
	visible = false


func _process(delta):
	pass


func _on_ui_dial_window_open(who : Object):
	
	dialogues.text = who.dialogues

