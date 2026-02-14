extends Control

@export var menu_contexts: Array[GUIDEMappingContext]
@export var open_menu_action: GUIDEAction
@export var close_menu_action: GUIDEAction

var _previous_mapping_contexts: Array[GUIDEMappingContext] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	open_menu_action.triggered.connect(open_menu)
	close_menu_action.triggered.connect(resume_game)

func open_menu() -> void:
	show()
	_previous_mapping_contexts = GUIDE.get_enabled_mapping_contexts()
	_enable_menu_mapping_contexts(menu_contexts)

func resume_game() -> void:
	hide()
	_enable_menu_mapping_contexts(_previous_mapping_contexts)
	
func _enable_menu_mapping_contexts(contexts: Array[GUIDEMappingContext]) -> void:
	var first: bool = true
	
	for context in contexts:
		if first:
			GUIDE.enable_mapping_context(context, true)
			first = false
		else:
			GUIDE.enable_mapping_context(context)


func _on_button_quit_pressed() -> void:
	get_tree().quit()

func _on_button_resume_pressed() -> void:
	resume_game()
