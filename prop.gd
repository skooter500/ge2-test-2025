extends Node3D

@export var copter:RigidBody3D

@onready var axle:Node3D = $axle

@export var rot_speed:float = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var speed:float = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if copter.motor_on:
		speed = lerp(speed, rot_speed, delta)
	else:
		speed = lerp(speed, 0.0, delta * 2.0)	
	print(speed)
	axle.rotate_y(speed * delta * 2.0)
