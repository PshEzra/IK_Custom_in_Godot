
extends Node2D

@onready var base : Node2D = $Base
@onready var knee : Node2D = $Knee
@onready var feet : Node2D = $Feet
var bend_dir = 1


func _process(delta):
	knee.position = calc_knee(200,200,0,base.position,feet.position)
	
func calc_knee(l_b2k, l_k2f, bend : int, base : Vector2, pointer : Vector2) -> Vector2:
	var q2 = -acos((abs(base.distance_to(pointer)**2) - l_b2k**2 - l_k2f**2)/(2*l_b2k*l_k2f))
	#print(rad_to_deg(q2))
	var delta = atan2((pointer - base).y,  (pointer - base).x)
	#print(rad_to_deg(delta))
	var q1 = delta - atan2(l_k2f*sin(q2), l_b2k + l_k2f*cos(q2))
	return base + Vector2(cos(q1)*l_b2k, sin(q1)*l_b2k)
	
func calc_knee2(l_b2k, l_k2f, bend : int, base : Vector2, pointer : Vector2) -> Vector2:
	var q1 = acos((-abs(base.distance_to(pointer)**2) + l_b2k**2 + l_k2f**2)/(2*l_b2k*l_k2f))
	var delta = atan2((pointer - base).y,  (pointer - base).x)
	var q0 = acos((abs(base.distance_to(pointer)**2) + l_b2k**2 - l_k2f**2)/(2*l_b2k*sqrt(abs(base.distance_to(pointer)**2)))) + delta
	
	return (base + Vector2(cos(q0)*l_b2k, sin(q0)*l_b2k))
