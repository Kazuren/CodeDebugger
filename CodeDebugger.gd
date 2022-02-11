extends CanvasLayer

signal command_submitted(command)

var command = ""

onready var text_editor = $TextEditor


func _ready():
	pass
	

func _process(_delta):
	if Input.is_action_just_pressed("enter"):
		emit_signal("command_submitted", text_editor.text.strip_edges())
		text_editor.text = ""
