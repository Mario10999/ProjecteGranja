class_name Player1
extends CharacterBody2D

@export var current_tool: DataTypes.Tools = DataTypes.Tools.None
@export var speed: float = 170.0

var player_direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	player_direction = Vector2.ZERO
	if Input.is_action_just_pressed("change_tool"):
		match current_tool:
			DataTypes.Tools.None:
				current_tool = DataTypes.Tools.AxeWood
			DataTypes.Tools.AxeWood:
				current_tool = DataTypes.Tools.WaterCrops
			DataTypes.Tools.WaterCrops:
				current_tool = DataTypes.Tools.AxeWood
			
			
func _ready():
	if GameManager.next_spawn != "":
		var spawn = get_parent().get_node_or_null("Spawn_" + GameManager.next_spawn)
		if spawn:
			global_position = spawn.global_position


		

	player_direction = player_direction.normalized()
	velocity = player_direction * speed
	move_and_slide()
