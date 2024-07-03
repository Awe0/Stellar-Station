extends Node

class_name Npc

var npcsName : String
var dialogues : String

func _init(dict : Dictionary):
	npcsName = dict["name"]
	dialogues = dict["dialogues"]
