extends Resource

class_name InventoryItem

@export var name : String = ""
@export var texture : Texture2D

func _init(itemName, itemTexture):
	name = itemName
	texture = itemTexture
