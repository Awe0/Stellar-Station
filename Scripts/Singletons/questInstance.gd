extends Node


var quests : Array

func _ready():
	quests = loadQuests()

func loadQuests():
	var quests :Array
	var dataFilePath : String = "res://Datas/Quests.json"
	var loadDatas : Object = DataLoader.new()
	var questsData : Dictionary = loadDatas.load_json_file(dataFilePath)
	for key in questsData:
		var value = questsData[key]
		for i in value:
			quests.append(Quest.new(i))
	return quests
