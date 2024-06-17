extends Node2D

@export_enum("nothing", "rock", "gold", "malachite") var selected_animation: String
@export var job: String = "Mining"
@export var experience: int = 10
@export var respawnTimer: int = 3
@export var healthPoints: int = 10
@export var itemResource : InventoryItem

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var timer : Timer = $RespawnTimer

var itemList: Array = ["nothing","rock", "gold", "malachite"]
var playerOnRang: bool = false
var wasOnFrameTwo: bool = false
var levelPlayer: int = 0 
var lootMax: int = 3
var lootMin: int = 1

func _ready():
	displaySelectedAnimation()
	#configTheRightItemLoot()

func displaySelectedAnimation():
	animation.play(selected_animation)

func configTheRightItemLoot():
	itemResource.set_path("res://Resources/Materials/"+ selected_animation +".tres")

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
				var amountOfLoot = randi_range(lootMin,lootMax)
				for item in itemList:
					if item == current_animation:
						EventBus.destroyed.emit(job,experience, amountOfLoot, itemResource)
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


