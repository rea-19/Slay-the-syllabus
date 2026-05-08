# scripts/SignalBus.gd
extends Node

signal card_selected(card_data)
signal answer_submitted(is_correct, damage)
signal enemy_damaged(new_hp)
signal player_damaged(new_hp)
signal score_changed(new_score)
signal battle_won
signal battle_lost
