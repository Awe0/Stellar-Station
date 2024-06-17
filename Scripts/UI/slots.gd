extends Panel

@onready var backgroundTexture : TextureRect = $background
@onready var itemTexture : TextureRect = $item
@onready var itemAmount : Label = $itemAmount

func update(slot : InventorySlot):
	if !slot.item:
		itemTexture.visible = false
		itemAmount.visible = false
	else:
		itemTexture.visible = true
		itemTexture.texture = slot.item.texture
		itemAmount.visible = true
		itemAmount.text = str(slot.amount)


func _ready():
	pass


func _process(delta):
	pass
