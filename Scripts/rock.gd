extends Node2D
signal destroyed(job, experience, count)
@export var job = "Mining"
@export var experience = 10
@onready var animation = $AnimatedSprite2D
@onready var timer = $RespawnTimer
var respawnTimer = 3
var healthPoints = 10
var playerOnRang = false
var wasOnFrameTwo = false
var levelPlayer = 0 
var lootMax = 3
var lootMin = 1

func _ready():
	pass

func _process(delta):
	match healthPoints:
		10,9,8:
			animation.frame = 0
		7,6,5,4:
			animation.frame = 1
		3,2,1:
			animation.frame = 2
			wasOnFrameTwo = true
		0:
			animation.frame = 3
			if wasOnFrameTwo:
				var count = randi_range(lootMin,lootMax)
				destroyed.emit(job,experience, count)
				wasOnFrameTwo = false
				
	
	if playerOnRang == true:
		if Input.is_action_just_pressed("Collect"):
			healthPoints -= 2
		if healthPoints <= 0:
			healthPoints = 0
	
	if healthPoints != 0:
		timer.start(respawnTimer)

func _on_collactable_zone_body_entered(body):
	if body.is_in_group("player"):
		playerOnRang = true

func _on_collactable_zone_body_exited(body):
	if body.is_in_group("player"):
		playerOnRang = false

func _on_timer_timeout():
	animation.frame = 0
	healthPoints = 10

func _on_ui_experience_received(growthData, jobLevels):
	levelPlayer = jobLevels[job]
