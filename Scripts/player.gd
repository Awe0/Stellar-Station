extends CharacterBody2D
signal levelUp(job)
signal experienceGained(job, growthData, jobLevels)
signal inputInventoryJustPressed()

@export var speed = 200;
@onready var animationTree = $AnimationTree
@onready var animationSprite = $AnimatedSprite2D2

var inputDirection : Vector2 = Vector2.ZERO
var jobLevels = {
	# "JOB" : Level
	"Mining" : 0,
	"Felling" : 0,
	"Harvest" : 0
}                       
var jobExperience = {
	# "JOB" : [Experience, Experience_total, Experience_required]
	"Mining" : [0,0,get_required_experience(jobLevels.Mining+1)],
	"Felling" : [0,0,get_required_experience(jobLevels.Felling+1)],
	"Harvest" : [0,0,get_required_experience(jobLevels.Harvest+1)]
#	labelExp.text = "Experience = " + str(jobExperience[job][0])
#	labelExpTot.text = "Exp total = " + str(jobExperience[job][1])
#	labelNextLevel.text = str(jobExperience[job][2]) + " d'xp requis pour atteindre le niveau " + str(jobLevels[job]+1)
}

func _ready():
	pass

func _physics_process(delta):
	inputDirection = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = inputDirection * speed
	#animation_parameters()
	animation_sprite(inputDirection)
	toggleInventory()
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
	
func _on_rock_destroyed(job, exp, count):
	gain_experience(job, exp)

func toggleInventory():
	if Input.is_action_just_pressed("Inventory"):
		inputInventoryJustPressed.emit()

