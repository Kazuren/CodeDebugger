extends Node2D


onready var code_debugger = $CodeDebugger


func _ready():
	code_debugger.connect("command_submitted", self, "_on_CodeDebugger_command_submitted")


func _on_CodeDebugger_command_submitted(command):
	# you could split the command here because it's a string into
	# function_name arg1 arg2 arg3 etc
	var args = command.split(" ")
	# first substring is the function name
	# rest are the arguments of the function
	var function_name = args[0]
	args.remove(0)
	callv(function_name, args)


func collect_item(item):
	var items = get_tree().get_nodes_in_group(item)
	var first_item = items[0]
	first_item.visible = false
