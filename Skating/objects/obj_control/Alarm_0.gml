/// @description 
if live_enabled {if (live_call()) return live_result;}

if room = rm_test
{
	alarm[0] = 60;
	obj_view.txtsca = 2;

	if global.timesecond = 0
	{
		if global.timeminute > 0
		{
			global.timeminute -= 1;	
			global.timesecond = 59;
		}
		else
		{
			if global.timeminute = 0
			{
				global.timesecond = 0;
			}
		}
	}
	else
	{
		global.timesecond -= 1;	
	}
}