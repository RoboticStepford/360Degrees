///scr_is_between(x, a, b)
function is_between(varx,vara,varb){

var left = min(vara,varb);
var right = max(vara,varb);

return (left < varx && varx < right)
}