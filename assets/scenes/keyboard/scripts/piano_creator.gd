extends Control

var k_creator : Node

var white_key : TouchScreenButton
var black_key : TouchScreenButton
var separation : float

func _ready() -> void:
	k_creator = get_node("CanvasLayer/KeyCreator")
	
	separation = 270*PianoKey.key_scale.x-10
	create_piano()

func create_piano():
	# Creates the entire piano  using create_0 
	for wrapper in $CanvasLayer/Wrappers.get_children():
		if wrapper.type == 2:
			# if is NONE skips iteraction
			continue
		else:
			# if not create type
			var c : Callable = Callable(self, "create_" + str(wrapper.type))
			c.call(wrapper)
		order_wrapper(wrapper)

func create_0(cont):
	# Creates CDE piano
	k_creator.create_keys(3, cont, "C", Vector2.ZERO, Vector2(separation,0))
	k_creator.create_keys(2, cont, "C#", Vector2(separation/1.5+5, -2), Vector2(separation,0))

func create_1(cont):
	# Creates FGAB piano
	k_creator.create_keys(4, cont, "F", Vector2.ZERO, Vector2(separation,0))
	k_creator.create_keys(3, cont, "F#", Vector2(separation/1.5+5, -2), Vector2(separation,0))

func order_wrapper(wr : Wrapper):
	# Add wrapper to specific node as child
	var wr_name = wr.name.split("")
	@warning_ignore("integer_division")
	var node = get_node("CanvasLayer/HBox" + str(int(wr_name[wr_name.size()-1])/3) + "/Container" + str(wr_name[wr_name.size()-1]))
	$CanvasLayer/Wrappers.remove_child(wr)
	node.add_child(wr)
