extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_collactable_zone_body_entered(body):
	if body.is_in_group("player"):
		visible = true


func _on_collactable_zone_body_exited(body):
	if body.is_in_group("player"):
		visible = false
