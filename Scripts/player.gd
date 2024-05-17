extends CharacterBody2D

signal experienceGained(job, growthData)

@export var speed = 200;
@onready var exp = $Camera2D2/UI/Experiences
@onready var animationTree = $AnimationTree
@onready var animationSprite = $AnimatedSprite2D2
@onready var labelExp = $Camera2D2/UI/Experiences/EXP
@onready var labelExpTot = $Camera2D2/UI/Experiences/EXPTOTAL
@onready var labelCurrentLevel = $Camera2D2/UI/Experiences/Niveau
@onready var labelNextLevel = $Camera2D2/UI/Experiences/EXPRequis
var expVisibility = false
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
}

func _ready():
	expVisibility = false

func _physics_process(delta):
	inputDirection = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = inputDirection * speed
	#animation_parameters()
	animation_sprite(inputDirection)
	move_and_slide()
	expHideOrShow()
	print(jobLevels)
	print(jobExperience)
	

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
	displayExp(job)
	experienceGained.emit(job, jobExperience)

func level_up(job):
	jobLevels[job] += 1
	jobExperience[job][2] = get_required_experience(jobLevels[job]+1)
	
func _on_rock_destroyed(job, exp):
	gain_experience(job, exp)

func displayExp(job):
	labelExp.text = "Experience = " + str(jobExperience[job][0])
	labelExpTot.text = "Exp total = " + str(jobExperience[job][1])
	labelCurrentLevel.text = "Niveau = " + str(jobLevels[job])
	labelNextLevel.text = str(jobExperience[job][2]) + " d'xp requis pour atteindre le niveau " + str(jobLevels[job]+1)

func toggleHud():
	if Input.is_action_just_pressed("Inventory"):
		if expVisibility == false:
			expVisibility = true
		else:
			expVisibility = false

func expHideOrShow():
	toggleHud()
	if expVisibility == true:
		exp.show()
	else:
		exp.hide()
