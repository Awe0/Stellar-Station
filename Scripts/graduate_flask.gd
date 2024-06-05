extends Control

@onready var animation = $AnimatedSprite2D

@export var quantity: int = 10021

func _ready():
	pass

func _process(delta):
	displayQuantity()

func displayQuantity():
	match quantity:
		91, 92, 93, 94, 95, 96, 97, 98, 99, 100:
			animation.play("100")
		81, 82, 83, 84, 85, 86, 87, 88, 89, 90:
			animation.play("90")
		71, 72, 73, 74, 75, 76, 77, 78, 79, 80:
			animation.play("80")
		61, 62, 63, 64, 65, 66, 67, 68, 69, 70:
			animation.play("70")
		51, 52, 53, 54, 55, 56, 57, 58, 59, 60:
			animation.play("60")
		41, 42, 43, 44, 45, 46, 47, 48, 49, 50:
			animation.play("50")
		31, 32, 33, 34, 35, 36, 37, 38, 39, 40:
			animation.play("40")
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30:
			animation.play("30")
		11, 12, 13, 14, 15, 16, 17, 18, 19, 20:
			animation.play("20")
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10:
			animation.play("10")
		0:
			animation.play("empty")


func _on_ui_endurance_changed(enduranceAmount):
	quantity = enduranceAmount
