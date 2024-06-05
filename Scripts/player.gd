extends CharacterBody2D
signal levelUp(job)
signal experienceGained(job, growthData, jobLevels)
signal inputInventoryJustPressed()
signal inputInteractionJustPressed()
signal enduranceChanged(enduranceAmount)

@export var endurance: int = 100
@export var speed: int = 200;
@onready var animationTree = $AnimationTree
@onready var animationSprite = $AnimatedSprite2D2

var inputDirection : Vector2 = Vector2.ZERO
var jobLevels: Dictionary = {
	# "JOB" : Level
	"Mining" : 0,
	"Felling" : 0,
	"Harvest" : 0
}                       
var jobExperience: Dictionary = {
	# "JOB" : [Experience, Experience_total, Experience_required]
	"Mining" : [0,0,get_required_experience(jobLevels.Mining+1)],
	"Felling" : [0,0,get_required_experience(jobLevels.Felling+1)],
	"Harvest" : [0,0,get_required_experience(jobLevels.Harvest+1)]
}

func _ready():
	pass

func _physics_process(delta):
	inputDirection = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = inputDirection * speed
	animation_sprite(inputDirection)
	toggleInventory()
	toggleInteraction()
	move_and_slide()

func animation_sprite(direction):
	if direction == Vector2.ZERO :
		animationSprite.play("Idle")
	elif direction.x > 0 :
		animationSprite.play("WalkRight")
	elif direction.x < 0 :
		animationSprite.play("WalkLeft")
	elif direction.y > 0 :
		animationSprite.play("WalkDown")
	elif direction.y < 0 :
		animationSprite.play("WalkUp")

func get_required_experience(level):
	return round(pow(level, 2)+level*20)

func gain_experience(job,amount):
	jobExperience[job][0] += amount
	jobExperience[job][1] += amount
	while jobExperience[job][0] >= jobExperience[job][2]:
		jobExperience[job][0] -= jobExperience[job][2]
		level_up(job)
	experienceGained.emit(jobExperience, jobLevels)

func level_up(job):
	levelUp.emit(job)
	jobLevels[job] += 1
	jobExperience[job][2] = get_required_experience(jobLevels[job]+1)
	

func toggleInventory():
	if Input.is_action_just_pressed("Inventory"):
		inputInventoryJustPressed.emit()

func toggleInteraction():
	if Input.is_action_just_pressed("Interation"):
		inputInteractionJustPressed.emit()

func enduranceGainOrLose(quantity):
	endurance += quantity
	enduranceChanged.emit(endurance)
	if endurance <= 0:
		endurance = 0


func _on_main_exp_for_player(job, exp):
	var enduQuantityLost: int = -5
	enduranceGainOrLose(enduQuantityLost)
	gain_experience(job, exp)
