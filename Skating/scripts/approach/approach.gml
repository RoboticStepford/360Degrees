/// @function approach(current, target, amount)
/*
 * Example use:
 * x = approach(x, target_x, 2);
 */

function approach(currentvar,targetvar,approachspd){

var c = currentvar;
var t = targetvar;
var a = approachspd;
if (c < t)
{
    c = min(c+a, t); 
}
else
{
    c = max(c-a, t);
}
return c;
}