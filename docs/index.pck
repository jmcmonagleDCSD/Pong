GDPC                �                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn�            ��=�������W��    X   res://.godot/exported/133200997/export-5ea627008c98d2a8af4d684301d81feb-main_font.res   �+      �      �#ƭ^M=����    ,   res://.godot/global_script_class_cache.cfg  �2             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�            ：Qt�E�cO���       res://.godot/uid_cache.bin  �6      Y       ��e��Z=�����l_�       res://Ball.gd           �      0S]:��e�,�f�P�       res://CPU.gd�            fUفOv�.�4�*S2�v       res://Player.gd P-            �P]{֒�=$-���       res://Score.gd  `.      �      [��c:��h��y���       res://icon.svg  3      �      k����X3Y���f       res://icon.svg.import   �      �       ���v���s+�*;��       res://main.gd   �      =      �C�ĝ�����)�,       res://main.gdshader �      �       ��y����R밲���       res://main.tscn.remap   2      a       �J�Sw� ������       res://main_font.tres.remap  �2      f       i��t,+�v��l���       res://project.binary07      a      %���'T�Z�� �            extends RigidBody2D

signal direction_changed
var speed = 100


func _ready():
	contact_monitor = true
	max_contacts_reported = 100000
	
	
func start():
	var dir = get_random_direction()
	linear_velocity = dir * speed
	
	
func get_random_direction():
	var rand_x = randi_range(0,1)
	var rand_y = randi_range(0, 1)
	var angles = [-.7, -.6, -.5, -.4, .7, .6, .5, .4]
	if rand_x == 0:
		rand_x = -1
	if rand_y == 0:
		rand_y = -1
	rand_y *= angles.pick_random()
	return Vector2(rand_x, rand_y)


func reset_ball():
	linear_velocity = Vector2.ZERO
	self.global_transform.origin = Vector2(120, 64) 
	
func _on_body_entered(body):
	direction_changed.emit()
     extends CharacterBody2D

var slow_speed: float = 60.0
var fast_speed: float = 200.0
var speed 
var ball: RigidBody2D
var target_velocity:float = 0.0

func _ready():
	speed = slow_speed
	get_ball()
	
	
func _process(delta):
	move()
	move_and_slide()
	
	
func get_ball():
	ball = get_tree().get_first_node_in_group("ball") as RigidBody2D
	ball.direction_changed.connect(on_ball_bounced)
	
func move():
	target_velocity = get_direction() * speed
	if velocity.y < 1 and velocity.y > -1:
		velocity.y = 0
	velocity.y = lerp(velocity.y, target_velocity, .05)
	
func get_direction() -> int:
	if ball.global_position.y > global_position.y:
		return 1
	else:
		return -1


func on_ball_bounced():
	speed = lerp(slow_speed,fast_speed, .2)
	
	await get_tree().create_timer(.9).timeout
	
	speed = slow_speed
	
  GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,��5xi�d�M���)3��$�V������3���$G�$2#�Z��v{Z�lێ=W�~� �����d�vF���h���ڋ��F����1��ڶ�i�엵���bVff3/���Vff���Ҿ%���qd���m�J�}����t�"<�,���`B �m���]ILb�����Cp�F�D�=���c*��XA6���$
2#�E.@$���A.T�p )��#L��;Ev9	Б )��D)�f(qA�r�3A�,#ѐA6��npy:<ƨ�Ӱ����dK���|��m�v�N�>��n�e�(�	>����ٍ!x��y�:��9��4�C���#�Ka���9�i]9m��h�{Bb�k@�t��:s����¼@>&�r� ��w�GA����ը>�l�;��:�
�wT���]�i]zݥ~@o��>l�|�2�Ż}�:�S�;5�-�¸ߥW�vi�OA�x��Wwk�f��{�+�h�i�
4�˰^91��z�8�(��yޔ7֛�;0����^en2�2i�s�)3�E�f��Lt�YZ���f-�[u2}��^q����P��r��v��
�Dd��ݷ@��&���F2�%�XZ!�5�.s�:�!�Њ�Ǝ��(��e!m��E$IQ�=VX'�E1oܪì�v��47�Fы�K챂D�Z�#[1-�7�Js��!�W.3׹p���R�R�Ctb������y��lT ��Z�4�729f�Ј)w��T0Ĕ�ix�\�b�9�<%�#Ɩs�Z�O�mjX �qZ0W����E�Y�ڨD!�$G�v����BJ�f|pq8��5�g�o��9�l�?���Q˝+U�	>�7�K��z�t����n�H�+��FbQ9���3g-UCv���-�n�*���E��A�҂
�Dʶ� ��WA�d�j��+�5�Ȓ���"���n�U��^�����$G��WX+\^�"�h.���M�3�e.
����MX�K,�Jfѕ*N�^�o2��:ՙ�#o�e.
��p�"<W22ENd�4B�V4x0=حZ�y����\^�J��dg��_4�oW�d�ĭ:Q��7c�ڡ��
A>��E�q�e-��2�=Ϲkh���*���jh�?4�QK��y@'�����zu;<-��|�����Y٠m|�+ۡII+^���L5j+�QK]����I �y��[�����(}�*>+���$��A3�EPg�K{��_;�v�K@���U��� gO��g��F� ���gW� �#J$��U~��-��u���������N�@���2@1��Vs���Ŷ`����Dd$R�":$ x��@�t���+D�}� \F�|��h��>�B�����B#�*6��  ��:���< ���=�P!���G@0��a��N�D�'hX�׀ "5#�l"j߸��n������w@ K�@A3�c s`\���J2�@#�_ 8�����I1�&��EN � 3T�����MEp9N�@�B���?ϓb�C��� � ��+�����N-s�M�  ��k���yA 7 �%@��&��c��� �4�{� � �����"(�ԗ�� �t�!"��TJN�2�O~� fB�R3?�������`��@�f!zD��%|��Z��ʈX��Ǐ�^�b��#5� }ى`�u�S6�F�"'U�JB/!5�>ԫ�������/��;	��O�!z����@�/�'�F�D"#��h�a �׆\-������ Xf  @ �q�`��鎊��M��T�� ���0���}�x^�����.�s�l�>�.�O��J�d/F�ě|+^�3�BS����>2S����L�2ޣm�=�Έ���[��6>���TъÞ.<m�3^iжC���D5�抺�����wO"F�Qv�ږ�Po͕ʾ��"��B��כS�p�
��E1e�������*c�������v���%'ž��&=�Y�ް>1�/E������}�_��#��|������ФT7׉����u������>����0����緗?47�j�b^�7�ě�5�7�����|t�H�Ե�1#�~��>�̮�|/y�,ol�|o.��QJ rmϘO���:��n�ϯ�1�Z��ը�u9�A������Yg��a�\���x���l���(����L��a��q��%`�O6~1�9���d�O{�Vd��	��r\�՜Yd$�,�P'�~�|Z!�v{�N�`���T����3?DwD��X3l �����*����7l�h����	;�ߚ�;h���i�0�6	>��-�/�&}% %��8���=+��N�1�Ye��宠p�kb_����$P�i�5�]��:��Wb�����������ě|��[3l����`��# -���KQ�W�O��eǛ�"�7�Ƭ�љ�WZ�:|���є9�Y5�m7�����o������F^ߋ������������������Р��Ze�>�������������?H^����&=����~�?ڭ�>���Np�3��~���J�5jk�5!ˀ�"�aM��Z%�-,�QU⃳����m����:�#��������<�o�����ۇ���ˇ/�u�S9��������ٲG}��?~<�]��?>��u��9��_7=}�����~����jN���2�%>�K�C�T���"������Ģ~$�Cc�J�I�s�? wڻU���ə��KJ7����+U%��$x�6
�$0�T����E45������G���U7�3��Z��󴘶�L�������^	dW{q����d�lQ-��u.�:{�������Q��_'�X*�e�:�7��.1�#���(� �k����E�Q��=�	�:e[����u��	�*�PF%*"+B��QKc˪�:Y��ـĘ��ʴ�b�1�������\w����n���l镲��l��i#����!WĶ��L}rեm|�{�\�<mۇ�B�HQ���m�����x�a�j9.�cRD�@��fi9O�.e�@�+�4�<�������v4�[���#bD�j��W����֢4�[>.�c�1-�R�����N�v��[�O�>��v�e�66$����P
�HQ��9���r�	5FO� �<���1f����kH���e�;����ˆB�1C���j@��qdK|
����4ŧ�f�Q��+�     [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c4etc0np580df"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                extends Node2D


@onready var ball = $Ball
@onready var score = $CanvasLayer/Score
@onready var play_label = $CanvasLayer/Menu/PlayLabel
@onready var winner_label = $CanvasLayer/Menu/WinnerLabel




var playing: bool = false
var game_over: bool = false


func _ready():
	score.scored.connect(on_scored)
	score.game_over.connect(on_game_over)

func _process(delta):
	if playing == false and game_over == false:
		if Input.is_action_just_pressed("space"):
			ball.start()
			play_label.hide()
	
	if game_over == true:
		if Input.is_action_just_pressed("space"):
			ball.start()
			play_label.hide()
			winner_label.hide()
			score.reset_scores()
			
func on_scored():
	ball.reset_ball()
	play_label.show()


func on_game_over(player: String):
	game_over = true
	winner_label.text = "%s is the winner!" %player
	winner_label.show()
   shader_type canvas_item;

void fragment() {
	vec2 uv = UV - 0.5;
	float d = length(uv);
	float r = .45;
	float c = 0.0;
	if (d<r) c = 1.0;
	COLOR = vec4(vec3(c), 1.0);
}
      RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   friction    rough    bounce 
   absorbent    shader    radius 	   _bundled       Script    res://main.gd ��������   Script    res://Player.gd ��������   Script    res://CPU.gd ��������   Script    res://Ball.gd ��������   Shader    res://main.gdshader ��������   Script    res://Score.gd ��������   LabelSettings    res://main_font.tres �Wǲ6�;C      local://RectangleShape2D_kykb8 �         local://RectangleShape2D_avjc1 �         local://RectangleShape2D_05moa �         local://RectangleShape2D_qfd7f          local://PhysicsMaterial_d6h45 J         local://ShaderMaterial_qxduf �         local://CircleShape2D_ltd76 �         local://PackedScene_352bl �         RectangleShape2D       
   ��D�0�A         RectangleShape2D       
     B  'C         RectangleShape2D       
   .�A
�B         RectangleShape2D       
      A  �B         PhysicsMaterial                      �?         ShaderMaterial    	                     CircleShape2D             PackedScene          	         names "   @      Main    scale    script    Node2D 
   ColorRect    offset_right    offset_bottom    color    metadata/_edit_lock_    Walls    Node    TopWall    collision_layer    collision_mask    StaticBody2D    CollisionShape2D 	   position    shape    BottomWall    Player1Goal    Area2D    debug_color    Player2Goal    Player    CharacterBody2D    offset_left    offset_top    CPU    motion_mode    Ball    mass    physics_material_override    gravity_scale    linear_damp_mode    ball    RigidBody2D    ColorRect2 	   material    CanvasLayer    Score    layout_mode    anchors_preset    Control    Player1Label    text    label_settings    Label    Player1Score    Player2Label    Player2Score    Menu    anchor_left    anchor_top    anchor_right    anchor_bottom    grow_horizontal    grow_vertical 
   PlayLabel    WinnerLabel    visible    horizontal_alignment    vertical_alignment    _on_body_entered    body_entered    	   variants    S   
   HNV>;�P>              @�D    �%D                 �?      
   -T>���>            
    �D  `�          
     �@  C
   ��P>���
   �eD�`V�
     rC    
     �A  �B            �I)?�{�>R�c?=
�>
     ,�    
   8�A;ߜC                    ��     H�     �@     HB
         �         
   ��D;ߜC                  ���   
D�   �@   ��KB
        �6         
   �D;ߜC         
�#<                                     ���   ;ߜ�   ~�sA   ��qA
      ?   ?
   ����	 �6
   ff�>ff�>                     pC      B              4B     �A      Player 1:                �A     �B      0      UC     }C      Player 2:       lC     �C      0
             ?           �?     ��     
�     �B     8�      Spacebar To Play             ��     @A     �B     B      node_count             nodes     �  ��������       ����                                  ����                                       
   	   ����                     ����                                            ����      	      
                    ����                                            ����            
                    ����                                ����                                      ����                   	             ����                                       ����                                            ����                                            ����                                 ����                                                  ����                   !      "                    ����      #      $               #      ����      %      &      '      (       )   !         *      "             $   ����   %   +      ,      -      .      /      0                    ����      1      2      3               &   &   ����               *   '   ����   (      )   4      5      6      7              .   +   ����   (   4            8      9   ,   :   -   ;              .   /   ����   (   4      <      =      9   ,   >   -   ;              .   0   ����   (   4      ?      @      9   ,   A   -   ;              .   1   ����   (   4      B      C      9   ,   D   -   ;              *   2   ����   (      )   E   3   F   4   F   5   F   6   F   7      8                 .   9   ����   (      )   G   5   H   6   H      I      J      K      L   7      8      ,   M              .   :   ����   ;   N   (   4      O      P      Q      R   <      =                conn_count             conns              ?   >                    node_paths              editable_instances              version             RSRC      RSRC                    LabelSettings            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script           local://LabelSettings_03ppo d         LabelSettings                   RSRC              extends CharacterBody2D


var speed = 200
var direction


func _process(delta):
	if Input.is_action_pressed("up"):
		direction = -1
	elif Input.is_action_pressed("down"):
		direction = 1
	else:
		direction = 0
		
	velocity.y = direction * speed
	move_and_slide()
         extends Control

signal scored
signal game_over(player: String)

@onready var player_1_score = $Player1Score
@onready var player_2_score = $Player2Score
@onready var player_1_goal = $"../../Walls/Player1Goal"
@onready var player_2_goal = $"../../Walls/Player2Goal"

var player1_score = 0
var player2_score = 0


func _ready():
	player_1_goal.body_entered.connect(update_player1_score)
	player_2_goal.body_entered.connect(update_player2_score)


func reset_scores():
	player1_score = 0
	player2_score = 0
	player_1_score.text = str(player1_score)
	player_2_score.text = str(player2_score)
	
	
func update_player1_score(body: Node2D):
	player1_score += 1
	player_1_score.text = str(player1_score)
	scored.emit()
	if player1_score >= 5:
		game_over.emit("Player 1 ")
		
		
func update_player2_score(body: Node2D):
	player2_score += 1
	player_2_score.text = str(player2_score)
	scored.emit()
	if player2_score >= 5:
		game_over.emit("Player 2 ")
  [remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-5ea627008c98d2a8af4d684301d81feb-main_font.res"
          list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z" fill="#478cbf"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
              WmN��t�^   res://icon.svgr^^K�v   res://main.tscn�Wǲ6�;C   res://main_font.tres       ECFG      application/config/name         Pong   application/run/main_scene         res://main.tscn    application/config/features   "         4.2    Mobile     application/config/icon         res://icon.svg  "   display/window/size/viewport_width      �   #   display/window/size/viewport_height      �   )   display/window/size/window_width_override      �  *   display/window/size/window_height_override      8     display/window/stretch/mode         canvas_items   input/up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script      
   input/down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script         input/space�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode       	   key_label             unicode           echo          script         layer_names/2d_physics/layer_1         ball   layer_names/2d_physics/layer_2         players    layer_names/2d_physics/layer_3         wall9   rendering/textures/canvas_textures/default_texture_filter          #   rendering/renderer/rendering_method         mobile                 