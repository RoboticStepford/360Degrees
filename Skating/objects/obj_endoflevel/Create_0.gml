/// @description 
if live_enabled {if (live_call()) return live_result;}
phase = 0;
totalscore = round(global.points * (1 + (global.goals/10)));
alarm[0] = 60;

if global.skate = global.maxskate {g1 = c_lime; ng_unlockmedal("Learn 2 Spell");}else{g1 = c_white;}
if global.comboletter = global.maxcombo {g2 = c_lime; ng_unlockmedal("Mambo");}else{g2 = c_white;}
if global.trash = global.maxtrash {g3 = c_lime; ng_unlockmedal("Garbage Man");}else{g3 = c_white;}
if global.crushedbird = global.maxbird {g4 = c_lime; ng_unlockmedal("Magpie Pie");}else{g4 = c_white;}
if global.valve = global.maxvalve {g5 = c_lime; ng_unlockmedal("Pump It Up");}else{g5 = c_white;}
if global.tape = global.maxtape {g6 = c_lime; ng_unlockmedal("Video Nasty"); global.gottape = true}else{g6 = c_white;}

if global.points > 5000 {ng_unlockmedal("Baby Mode");}
if global.points > 20000 {ng_unlockmedal("Up and Coming");}
if global.points > 75000 {ng_unlockmedal("Getting There");}
if global.points > 125000 {ng_unlockmedal("Stylish");}
if global.points > 300000 {ng_unlockmedal("Baller");}
if global.points > 500000 {ng_unlockmedal("Pimp");}
if global.points > 1000000 {ng_unlockmedal("Big Name");}
if global.points > 2000000 {ng_unlockmedal("Superstar");}
if global.points > 5000000 {ng_unlockmedal("Board Lord");}
if global.points > 10000000 {ng_unlockmedal("BOARD GOD");}

if global.goals >= 2 {ng_unlockmedal("Two Birds One Stone");}
if global.goals >= 3 {ng_unlockmedal("Multitask");}
if global.goals >= 4 {ng_unlockmedal("Balancing Act");}
if global.goals >= 5 {ng_unlockmedal("Midas Touch");}
if global.goals >= 6 {ng_unlockmedal("Kali");}

//TOTAL
if (global.highscore < totalscore)
{
	ini_open("save.ini");
	ini_write_real("option","highscore",totalscore);
	ini_close();
	global.highscore = totalscore;
}

if global.ng = 1
{
	ng_postScore("11631",totalscore);
}