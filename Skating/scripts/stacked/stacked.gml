function stacked(){
	if alive = true
	{
		//PLAYER STACKED
		screenshake(5,2);
		//visible = false;
		alive = false;
		playsnd(snd_bailing,0,random_range(0.9,1.1),false,1);
		player = instance_create_depth(x,y,-9999,obj_stacked); 
		player.direction = random_range(45,65);
		player.speed = random_range(7,9);
		player.gravity = 0.1;
		player.play = 1;
		board = instance_create_depth(x,y,-9999,obj_stacked); 
		board.sprite_index = spr_stack_skateboard;
		board.direction = random_range(35,55);
		board.speed = random_range(8,10);
		board.gravity = 0.09;
		
		obj_view.targ = player;	
		combofail();
	}
}