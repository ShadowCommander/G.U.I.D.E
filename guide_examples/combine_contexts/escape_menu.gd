extends Control

@export var menu_contexts: Array[GUIDEMappingContext]
@export var open_menu_action: GUIDEAction
@export var close_menu_action: GUIDEAction

var _previous_mapping_contexts: Array[GUIDEMappingContext] = []


func _ready() -> void:
	hide()
	open_menu_action.triggered.connect(open_menu)
	close_menu_action.triggered.connect(resume_game)

func open_menu() -> void:
	show()
	for context in menu_contexts:
		GUIDE.enable_mapping_context(context)

func resume_game() -> void:
	hide()
	for context in menu_contexts:
		GUIDE.disable_mapping_context(context)


func _on_button_quit_pressed() -> void:
	get_tree().quit()

func _on_button_resume_pressed() -> void:
	resume_game()
