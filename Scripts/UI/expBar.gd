extends TextureProgressBar

enum JobsName { MINING, FELLING, HARVEST }

@export var jobName : JobsName
@onready var miningLevel = $"../../LabelBox/MiningLevel"
@onready var fellingLevel = $"../../LabelBox/FellingLevel"
@onready var harvestLevel = $"../../LabelBox/HarvestLevel"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_ui_experience_received(growthData,jobLevels):
	var job = verifyJob()
	max_value = growthData[job][2]
	value = growthData[job][0]
	displayExp(jobLevels)

func displayExp(jobLevels):
	var job = verifyJob()
	match  job:
		"Mining":
			miningLevel.text = "Mining level : " + str(jobLevels[job])
		"Felling":
			fellingLevel.text = "Felling level : " + str(jobLevels[job])
		"Harvest":
			harvestLevel.text = "Harvest level : " + str(jobLevels[job])

func verifyJob():
	var job = ""
	match jobName:
		0:
			job = "Mining"
		1:
			job = "Felling"
		2:
			job = "Harvest"
	return job
