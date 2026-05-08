# scripts/GameManager.gd
extends Node

var player_hp := 100
var enemy_hp := 100
var score := 0
var questions := []
var current_question := {}

func _ready():
	load_questions()

func load_questions():
	var file = FileAccess.open("res://data/questions.json", FileAccess.READ)
	var json = JSON.new()
	json.parse(file.get_as_text())
	questions = json.get_data()

func get_questions_by_difficulty(diff: String) -> Array:
	return questions.filter(func(q): return q["difficulty"] == diff)

func apply_damage_to_enemy(amount: int):
	enemy_hp -= amount
	score += amount
	SignalBus.emit_signal("enemy_damaged", enemy_hp)
	SignalBus.emit_signal("score_changed", score)

func apply_damage_to_player(amount: int):
	player_hp -= amount
	SignalBus.emit_signal("player_damaged", player_hp)
