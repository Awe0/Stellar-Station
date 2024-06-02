extends Node2D
signal destroyed(job, experience, count, items)
@export_enum("nothing", "rock", "gold", "malachite") var selected_animation: String
@export var job: String = "Mining"
@export var experience: int = 10

@onready var animation = $AnimatedSprite2D
@onready var timer = $RespawnTimer

var itemList: Array = ["nothing","rock", "gold", "malachite"]
var respawnTimer: int = 3
var healthPoints: int = 10
var playerOnRang: bool = false
var wasOnFrameTwo: bool = false
var levelPlayer: int = 0 
var lootMax: int = 3
var lootMin: int = 1

func _ready():
	display_selected_animation()

func display_selected_animation():
	animation.play(selected_animation)


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
			if wasOnFrameTwo:
				animation.play()
				var current_animation = animation.animation
				var count = randi_range(lootMin,lootMax)
				for item in itemList:
					if item == current_animation:
						destroyed.emit(job,experience, count, item)
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

func _on_respawn_timer_timeout():
	animation.frame = 0
	healthPoints = 10

func _on_ui_experience_received(growthData, jobLevels):
	levelPlayer = jobLevels[job]
