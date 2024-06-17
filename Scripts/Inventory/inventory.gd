extends Resource

class_name Inventory

signal updated

@export var slots : Array[InventorySlot]

func insert(item : InventoryItem):
	var amountOfLoot = item.amountOfLoot()
	for slot in slots:
		if slot.item == item:
			slot.amount += amountOfLoot
			updated.emit()
			return

	for i in range(slots.size()):
		if !slots[i].item:
			slots[i].item = item
			slots[i].amount = amountOfLoot
			updated.emit()
			return

