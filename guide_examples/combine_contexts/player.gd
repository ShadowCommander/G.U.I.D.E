## This is the player script. Note how it has no clue about controllers, axis inversion
## etc. This is all handled by GUIDE and the remapping dialog.
extends Node2D

@export var speed:float = 300
@export var move_action:GUIDEAction


func _process(delta:float) -> void:
	var vector: Vector2 = move_action.value_axis_2d
	
	# Circular length limiting
	var length: float = vector.length();
	var modified_vector: Vector2 = Vector2.ZERO
	if length <= 0:
		modified_vector = Vector2.ZERO
	elif length > 1.0:
		modified_vector = vector / length;
	else:
		modified_vector = vector * (inverse_lerp(0.0, 1.0, length) / length)
	
	position += modified_vector * speed * delta
