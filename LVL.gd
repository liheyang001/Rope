extends Node2D

@onready var box = $Player
@onready var gg = $gg
@onready var ray = $Player/RayCast2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gg.global_position = box.global_position
	ray.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("ui_accept"):
		if ray.is_colliding():
			var thingtostick = ray.get_collider()
			var distancelenght = ray.get_collision_point().distance_to(box.global_position)
			
			gg.length = distancelenght
			gg.global_rotation_degrees = ray.global_rotation_degrees - 90
			gg.rest_length = distancelenght * 0.75
			
			gg.node_b = thingtostick.get_path()

		
	pass
