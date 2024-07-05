extends Node

class_name Npc

var npcName : String
var dialogues : String
var quests : Array

func _init(dict : Dictionary):
	npcName = dict["name"]

func assignQuests():
	for i in QuestsInstance.quests:
		print(QuestsInstance.quests[i])
		if QuestsInstance.quests[i].givenBy == npcName:
			quests.append(QuestsInstance.quests[i])
			print("Hello from NPC CLASS")
