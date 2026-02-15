extends Control

@export var first_focus: Control

@export var menu_contexts: Array[GUIDEMappingContext]
@export var open_menu_action: GUIDEAction
@export var close_menu_action: GUIDEAction


func _ready() -> void:
	hide()
	open_menu_action.triggered.connect(toggle_menu)
	close_menu_action.triggered.connect(resume_game)

func toggle_menu() -> void:
	if visible:
		resume_game()
	else:
		open_menu()

func open_menu() -> void:
	if visible:
		return
	show()
	for context in menu_contexts:
		GUIDE.enable_mapping_context(context)
	first_focus.grab_focus()

func resume_game() -> void:
	if not visible:
		return
	hide()
	for context in menu_contexts:
		GUIDE.disable_mapping_context(context)


func _on_button_quit_pressed() -> void:
	get_tree().quit()

func _on_button_resume_pressed() -> void:
	resume_game()
