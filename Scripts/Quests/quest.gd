extends Node

class_name Quest

signal started
signal updated
signal completed

var id : int
var questName : String
var givenBy : String
var description : String
var objective : String
var startCondition : Array
var endCondition : Array

func _init(dict : Dictionary):
	id = dict["id"]
	questName = dict["questName"]
	givenBy = dict["givenBy"]
	description = dict["description"]
	objective = dict["objective"] 
	startCondition = dict["startCondition"] 
	endCondition = dict["endCondition"]

func start():
	started.emit()

func update():
	updated.emit()

func complet():
	completed.emit()

func checkStartCondition():
	pass
