extends Quest


var quests : Array

func _ready():
	print("hello from questInstance")
	quests = loadQuests()
	print(quests)

func loadQuests():
	var quests :Array
	var dataFilePath : String = "res://Datas/Quests.json"
	var loadDatas : Object = DataLoader.new()
	var questsData : Dictionary = loadDatas.load_json_file(dataFilePath)
	print(questsData)
	for key in questsData:
		var value = questsData[key]
		for i in value:
			print(i)
	return quests
