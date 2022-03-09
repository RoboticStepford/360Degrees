///@desc choose_weighted()
///@arg choice1 "HI"
///@arg portion "3"
///@arg choice2 "EW"
///@arg portion "1"
///@arg choice3 "BYE"
///@arg portion "2"
///@arg etc

function choose_weighted() {
    var n = 0;
    for (var i = 1; i < argument_count; i += 2) {
        if (argument[i] <= 0) continue;
        n += argument[i];
    }
    
    n = random(n);
    for (var i = 1; i < argument_count; i += 2) {
        if (argument[i] <= 0) continue;
        n -= argument[i];
        if (n < 0) return argument[i - 1];
    }
    
    return argument[0];
}