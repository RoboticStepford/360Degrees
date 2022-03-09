function fps_speedometer(draw, x, y) {
    // you can change the colors of the labels if you want up here
    var c_fps = c_yellow;
    var c_fps_real = c_red;
    var c_fps_target_actual = 0x003f00;
    var c_fps_target_real = 0x007f00;
    var speedometer_font = -1;
    
    var MILLION = 1000000;
    static last_update_time = -1;
    
    // i can't stop you from skipping updates, but at least calling this more
    // than once per frame won't affect the numbers
    if (last_update_time != current_time) {
        static fps_total = 0;
        static fps_total_real = 0;
        static frames_passed = 0;
        fps_total += fps;
        fps_total_real += fps_real;
        frames_passed++;
    
        var history_size = 10;
        static history_fps = ds_list_create();
        static history_fps_real = ds_list_create();
        while (ds_list_size(history_fps) < history_size + 2) {
            ds_list_add(history_fps, 0);
            ds_list_add(history_fps_real, 0);
        }
        static t = 0;
        history_fps[| history_size + 1] += fps * delta_time / MILLION;
        history_fps_real[| history_size + 1] += fps_real * delta_time / MILLION;
        t += delta_time / MILLION;
    
        if (t > 1) {
            ds_list_delete(history_fps, 0);
            ds_list_delete(history_fps_real, 0);
            ds_list_add(history_fps, 0);
            ds_list_add(history_fps_real, 0);
            t--;
        }
        last_update_time = current_time;
    }
    
    if (!draw) return;
    
    var old_font = draw_get_font();
    draw_set_font(speedometer_font);
    
    var start_halign = draw_get_halign();
    var start_valign = draw_get_valign();
    
    #region speedometer
    var meter_x = x + sprite_get_width(spr_fps_meter) / 2;
    var meter_y = y + sprite_get_height(spr_fps_meter) / 2;
    draw_sprite(spr_fps_meter, 0, meter_x, meter_y);
    
    var inst_t = MILLION / max(1, fps_real);
    var inst_r = sprite_get_width(spr_fps_meter) / 2.5;
    var inst_angle = 225 - 270 * inst_t / 16000;
    var inst_x = inst_r * dcos(inst_angle);
    var inst_y = -inst_r * dsin(inst_angle);
    
    draw_line_width_colour(meter_x, meter_y, meter_x + inst_x, meter_y + inst_y, 4, c_fps_real, c_fps_real);
    
    var total_t = MILLION / max(1, fps_total_real / frames_passed);
    var total_r = sprite_get_width(spr_fps_meter) / 3;
    var total_angle = 225 - 270 * total_t / 16000;
    var total_x = total_r * dcos(total_angle);
    var total_y = -total_r * dsin(total_angle);
    
    draw_line_width_colour(meter_x, meter_y, meter_x + total_x, meter_y + total_y, 4, c_fps, c_fps);
    
    draw_circle_colour(meter_x, meter_y, 6, c_black, c_black, false);
    #endregion
    
    #region text details
    var n = 0;
    var spacing = 32;
    var base_x = x + spacing;
    var base_y = y + sprite_get_height(spr_fps_meter) + spacing;
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text_colour(base_x, base_y + n++ * spacing, "Code is compiled? " + (code_is_compiled() ? "true" : "false"), c_white, c_white, c_white, c_white, 1);
    draw_text_colour(base_x, base_y + n++ * spacing, "Total frames: " + string(frames_passed), c_white, c_white, c_white, c_white, 1);
    draw_text_colour(base_x, base_y + n++ * spacing, "FPS: " + string(fps), c_white, c_white, c_white, c_white, 1);
    draw_rectangle_colour(base_x, base_y + n * spacing, base_x + spacing / 2, base_y + (n + 0.5) * spacing, c_fps_real, c_fps_real, c_fps_real, c_fps_real, false);
    draw_text_colour(base_x, base_y + n++ * spacing, "   Real: " + string(fps_real), c_white, c_white, c_white, c_white, 1);
    draw_text_colour(base_x, base_y + n++ * spacing, "Average: " + string(fps_total / frames_passed), c_white, c_white, c_white, c_white, 1);
    draw_rectangle_colour(base_x, base_y + n * spacing, base_x + spacing / 2, base_y + (n + 0.5) * spacing, c_fps, c_fps, c_fps, c_fps, false);
    draw_text_colour(base_x, base_y + n++ * spacing, "   Average (real): " + string(fps_total_real / frames_passed), c_white, c_white, c_white, c_white, 1);
    #endregion
    
    #region graph
    base_x = x + spacing + sprite_get_width(spr_fps_meter) + spacing;
    base_y = y + spacing + sprite_get_height(spr_fps_graph);
    var graph_width = sprite_get_width(spr_fps_graph);
    var graph_height = sprite_get_height(spr_fps_graph);
    var node_spacing = graph_width / history_size;
    draw_sprite(spr_fps_graph, 0, base_x, base_y);
    
    var max_top_real = 0;
    var max_top_actual = 0;
    for (var i = 0; i < history_size; i++) {
        max_top_real = max(max_top_real, history_fps_real[| i]);
        max_top_actual = max(max_top_actual, history_fps[| i]);
    }
    
    var interval_real = power(10, floor(log10(max_top_real + 1)));
    var scale_top_real = (max_top_real ? (ceil(max_top_real / interval_real) * interval_real) : 1000) * 1.5;
    var scale_top_actual = room_speed * 2;
    var target_60_actual = clamp((60 / scale_top_actual) * graph_height, 0, graph_height - 1);
    var target_60_real = clamp((60 / scale_top_real) * graph_height, 0, graph_height - 1);
    
    draw_line_colour(base_x, base_y - target_60_actual, base_x + graph_width, base_y - target_60_actual, c_fps_target_actual, c_fps_target_actual);
    draw_line_colour(base_x, base_y - target_60_real, base_x + graph_width, base_y - target_60_real, c_fps_target_real, c_fps_target_real);
    
    draw_primitive_begin(pr_linestrip);
    for (var i = 0; i < history_size + 1; i++) {
        var value = clamp((history_fps_real[| i] / scale_top_real) * graph_height, 0, graph_height - 1);
        draw_vertex_color(base_x + i * node_spacing, base_y - value, c_fps_real, 1);
    }
    draw_primitive_end();
    
    draw_primitive_begin(pr_linestrip);
    for (var i = 0; i < history_size + 1; i++) {
        var value = clamp((history_fps[| i] / scale_top_actual) * graph_height, 0, graph_height - 1);
        draw_vertex_color(base_x + i * node_spacing, base_y - value, c_fps, 1);
    }
    draw_primitive_end();
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text_colour(base_x, base_y - graph_height / 2, string(scale_top_real div 2), c_fps_real, c_fps_real, c_fps_real, c_fps_real, 1);
    draw_text_colour(base_x, base_y - graph_height, string(scale_top_real), c_fps_real, c_fps_real, c_fps_real, c_fps_real, 1);
    draw_set_halign(fa_right);
    draw_text_colour(base_x + graph_width, base_y - graph_height / 2, string(scale_top_actual div 2), c_fps, c_fps, c_fps, c_fps, 1);
    draw_text_colour(base_x + graph_width, base_y - graph_height, string(scale_top_actual), c_fps, c_fps, c_fps, c_fps, 1);
    draw_set_halign(start_halign);
    draw_set_valign(start_valign);
    #endregion
    
    #region graph text
    var n = 1;
    
    draw_text_ext_colour(base_x, base_y + n++ * spacing, "The \"real\" FPS value is the frame rate you would achieve if the frame rate was unlimited (i.e. a measure of how long each frame takes to process). It will likely vary greatly depending on what's on the screen, but as long as it stays higher than your target frame rate (probably 60) you should be okay.", -1, graph_width, c_white, c_white, c_white, c_white, 1);
    
    draw_set_font(old_font);
    #endregion
}