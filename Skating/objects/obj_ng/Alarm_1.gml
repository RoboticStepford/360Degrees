/// @description 
//if live_enabled {if (live_call()) return live_result;}

alarm[1] = room_speed*1;

if init = 1{ng_connect("54186:22QOm5co","rj74byodAdXimpfKGVyOHw=="); init += 1}
else if init = 2 {ng_initialize_medals_and_scoreboard(); init += 1}
else if init = 3 {ng_request_login(); init += 1}
else if init = 4 {ng_postScore("11631",global.highscore); init += 1}
else if init = 5 {ng_unlockmedal("Full Circle"); init += 1}