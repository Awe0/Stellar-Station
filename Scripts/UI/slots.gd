extends HBoxContainer

var slotNumber: int = 1
@onready var slot1 = $slot1
@onready var slot2 = $slot2
@onready var countSlot1 = $slot1/BoxContainer/CountSlot

func _ready():
	pass


func _process(delta):
	pass


func _on_ui_add_to_slot(count, item):
	if item == "gold":
		slot1.texture = load("res://Assets/Sprites/Items/Minerals/Loots/"+ item +"_unit.png")
		print(slot1.texture)
	else:
		slot2.texture = load("res://Assets/Sprites/Items/Minerals/Loots/"+ item +"_unit.png")
		print(slot2.texture)
	countSlot1.text = str(count)
