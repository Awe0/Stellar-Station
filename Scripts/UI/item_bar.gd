extends Control

@onready var itemBarInventory : Inventory = preload("res://Resources/playerItemBar.tres")
@onready var slots : Array = $SlotBar.get_children()

func _ready():
	update()
	itemBarInventory.updated.connect(update)

func update():
	for i in range(min(itemBarInventory.slots.size(), slots.size())):
		slots[i].update(itemBarInventory.slots[i])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
