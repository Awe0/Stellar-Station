extends Node

class_name Npc

var npcName : String
var dialogues : String
var questsId : Array
var quests : Array

func _init(dict : Dictionary):
	npcName = dict["name"]
	questsId = dict["questsId"]

