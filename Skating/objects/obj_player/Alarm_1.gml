/// @description 
if live_enabled {if (live_call()) return live_result;}

if room = rm_tutorial
{
	if tutphase = 0 {tuttext = "WELCOME TO THE TUTORIAL HEHEHEHEH!!!";}
	else if tutphase = 1 {tuttext = "SO YOU WANNA BE A PRO!?? YOU CAME TO THE RIGHT PLACE KIDDO!!!!";}
	else if tutphase = 2 {tuttext = "IF YOU WANT TO LEAVE AT ANY POINT, JUST PRESS ESCAPE ON THE KEYBOARD!!!";}
	else if tutphase = 3 {tuttext = "TO JUMP, PRESS LEFT MOUSE BUTTON!";}
	else if tutphase = 4 {tuttext = "WHILE IN THE AIR, YOUR BOARD WILL AIM TOWARDS YOUR MOUSE!";}
	else if tutphase = 5 {tuttext = "YOU WANT TO LAND WITH THE BOARD FLAT EVERY TIME.";}
	else if tutphase = 6 {tuttext = "IF IT'S FACING AIMING DIRECTLY UP OR DIRECTLY DOWN, YOU WILL BREAK YOUR BALLS!!!";}
	else if tutphase = 7 {tuttext = "WHILE MID-AIR, YOU CAN SPIN THE BOARD AROUND YOUR CHARACTER TO DO KICK FLIPS.";}
	else if tutphase = 8 {tuttext = "IF YOU LAND AND THE THE FRONT END OF YOUR BOARD IS UP HIGH, YOU WILL START TO MANUAL.";}
	else if tutphase = 9 {tuttext = "MANUALS AND GRINDS WORK THE SAME. JUST TAP RIGHT CLICK AND TRY TO KEEP IT IN THE MIDDLE.";}
	else if tutphase = 10 {tuttext = "IF IT TOUCHES THE TOP OR BOTTOM, YOU WILL EITHER STACK OR END YOUR COMBO.";}
	else if tutphase = 11 {tuttext = "HOLDING RIGHT CLICK WHILE MID-AIR WILL MAKE YOU DO A GRAB TRICK.";}
	else if tutphase = 12 {tuttext = "THE FURTHER YOUR MOUSE FROM YOUR PLAYER, THE COOLER THE TRICK. THE COOLER THE TRICK, THE MORE POINTS.";}
	else if tutphase = 13 {tuttext = "MIDDLE MOUSE BUTTON CAN BE CLICKED IN WHILE MID-AIR, MANUAL OR GRINDING TO DO A REVERT.";}
	else if tutphase = 14 {tuttext = "REVERTS ADD +1X TO YOUR COMBO, SO YOU WILL NEED TO SPAM IT A LOT TO GET BIG NUMBERS!";}
	else if tutphase = 15 {tuttext = "BY HOLDING GRAB TRICKS, SPINNING AROUND IN THE AIR, MANUALING AND REVERTING, YOU WILL KICK ASS!";}
	else if tutphase = 16 {tuttext = "THE LONGER YOUR COMBO GETS, THE MORE DIFFICULT IT IS TO BALANCE. SO DONT GET TOO COCKY!";}
	else if tutphase = 17 {tuttext = "BEST OF LUCK OUT THERE, CHAMP!!! PRESS ESCAPE WHENEVER YOU'RE DONE!";}
	
	if tutphase <= 17 {playsnd(snd_punch,1,1,false,1);}
	tutphase += 1;
	alarm[1] = room_speed*10;
}