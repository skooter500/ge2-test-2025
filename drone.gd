extends RigidBody3D

@export var power:float = 10

var motor_on = false
var rot_speed = 360

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	motor_on = false
	
	var f = Input.get_axis("forward", "reverse")
	if f != 0:
		motor_on = true
		apply_central_force(global_basis.z * power * f)		

	if Input.is_action_pressed("up"):
		motor_on = true
		apply_central_force(global_basis.y * power)		

	
	var turn = Input.get_axis("left", "right")
	if turn != 0.0: 
		motor_on = true
		rotate_y(- turn * deg_to_rad(rot_speed) * delta)
