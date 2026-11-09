extends Control

@onready var contador_moedas = $container/moedas_container/contador_moedas as Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contador_moedas.text = str("%04d" % Global.moedas)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	contador_moedas.text = str("%04d" % Global.moedas)
