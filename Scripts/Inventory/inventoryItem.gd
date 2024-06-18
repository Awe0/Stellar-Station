extends Resource

class_name InventoryItem

@export var name : String = ""
@export var texture : Texture2D
@export var lootMax : int
@export var lootMin : int
@export var isStackable : bool = true

func amountOfLoot():
	return randi_range(lootMin, lootMax)

func stackMax():
	var stackMax : int
	if isStackable:
		stackMax = 10
	else:
		stackMax = 1
	return stackMax
