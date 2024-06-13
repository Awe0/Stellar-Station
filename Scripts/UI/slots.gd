extends Panel

@onready var backgroundTexture : TextureRect = $background
@onready var itemTexture : TextureRect = $item

func update(item : InventoryItem):
	if !item:
		itemTexture.visible = false
	else:
		itemTexture.visible = true
		itemTexture.texture = item.texture


func _ready():
	pass


func _process(delta):
	pass
