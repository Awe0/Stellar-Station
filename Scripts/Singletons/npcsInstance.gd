extends Node

var npcs : Array

func _ready():
	npcs = loadNpcs()
	print(npcs)

func loadNpcs():
	var npcs :Array
	var dataFilePath : String = "res://NpcsDial.json"
	var loadDatas : Object = DataLoader.new()
	var npcsData : Dictionary = loadDatas.load_json_file(dataFilePath)
	for key in npcsData:
		var value = npcsData[key]
		for i in value:
			npcs.append(Pnj.new(i))
	return npcs
