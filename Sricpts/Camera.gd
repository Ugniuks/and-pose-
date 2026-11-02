extends Node

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	animation.play("Idle")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		audio.play()
		animation.play("Shoot", -1, 1.5)
		animation.queue("Idle")
