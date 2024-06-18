extends Resource

class_name Inventory

signal updated

@export var slots : Array[InventorySlot]

func insert(item : InventoryItem):
	var amountOfLoot = item.amountOfLoot()
	var stackSize = item.stackMax()
	for slot in slots:
		if slot.item == item:
			var spaceLeftInSlot = stackSize - slot.amount
			if spaceLeftInSlot > 0:
				var amountToAdd = min(amountOfLoot, spaceLeftInSlot)
				slot.amount += amountToAdd
				amountOfLoot -= amountToAdd
				if amountOfLoot <= 0:
					updated.emit()
					return

	for i in range(slots.size()):
		if !slots[i].item:
			slots[i].item = item
			slots[i].amount = amountOfLoot
			updated.emit()
			return

