/// @description rng(percent)
/// @param percent
 
// Returns true or false depending on RNG
// ex:
//      Chance(0.7);    -> Returns true 70% of the time

function rng(varchance)
{
	return varchance > random(1);
}