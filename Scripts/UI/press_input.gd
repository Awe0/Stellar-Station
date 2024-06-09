extends Label

var timeToDisappear: int = 5

func _ready():
	visible = false


func _process(delta):
	if visible == true:
		inputPressed()


func _on_collactable_zone_body_entered(body):
	if body.is_in_group("player"):
		text = "Clic droit"
		visible = true
	if Input.is_action_just_pressed("Collect"):
		visible = false


func _on_collactable_zone_body_exited(body):
	if body.is_in_group("player"):
		visible = false


func _on_interaction_area_body_entered(body):
	if body.is_in_group("player"):
		text = "Press E"
		visible = true

func _on_interaction_area_body_exited(body):
	if body.is_in_group("player"):
		visible = false

func inputPressed():
	if Input.is_action_just_pressed("Interation"):
		visible = false
	elif Input.is_action_just_pressed("Collect"):
		visible = false
