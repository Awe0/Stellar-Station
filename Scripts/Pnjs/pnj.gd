extends Node

class_name Pnj

var pnjsName : String
var dialogues : String

func _init(dict : Dictionary):
	pnjsName = dict["name"]
	dialogues = dict["dialogues"]
