extends Camera3D

@onready var drone = $"../drone"
@onready var cam_target = $"../drone/cam_target"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	global_position = lerp(global_position, cam_target.global_position, delta * 5)
	look_at(drone.global_position)
	
	pass
