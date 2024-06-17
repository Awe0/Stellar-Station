extends Resource

class_name InventoryItem

@export var name : String = ""
@export var texture : Texture2D
@export var lootMax: int
@export var lootMin: int
@export var stackMax : int

func amountOfLoot():
	return randi_range(lootMin, lootMax)
