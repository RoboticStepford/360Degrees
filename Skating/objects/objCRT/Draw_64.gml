if enabled {
	#region draw w shader

// Time for moving bits of the CRT effect
var _time = current_time * 0.001;


// Set the games' CRT resolution! Check the create event~
var gameWid, gameHei;
if crtResMult <= 0 {
	if window_get_fullscreen() {
		gameWid = display_get_width();
		gameHei = display_get_height();
	} else {
		gameWid = window_get_width();
		gameHei = window_get_height();
	}
} else {
	gameWid = screenWid * crtResMult;
	gameHei = screenHei * crtResMult;
}


if !surface_exists(surfacePPTemp1) {
	surfacePPTemp1 = surface_create(gameWid, gameHei); // temp. surface to hold the result of pass 1
}
if !surface_exists(surfacePPTemp2) {
	surfacePPTemp2 = surface_create(gameWid, gameHei); // temp. surface to hold the result of pass 2
}
if !surface_exists(surfacePPTemp3) {
	surfacePPTemp3 = surface_create(gameWid, gameHei); // temp. surface to hold the result of pass 3
}


/// Fetch the texture handles
var _texnoise = sprite_get_texture(texBluenoise, 0);
var _texshadowmask = sprite_get_texture(texShadowMask, 0);
var _texrainbowlut = sprite_get_texture(texRainbowLUT, 0);
// (also fetch the texel size of texture)
var _texnoisetexelw = texture_get_texel_width(_texnoise);
var _texnoisetexelh = texture_get_texel_height(_texnoise);
var _texshadowmasktexelw = texture_get_texel_width(_texshadowmask);
var _texshadowmasktexelh = texture_get_texel_height(_texshadowmask);


/// Pass #1 : Screen filter (shadowmask, scanline etc..)
// Feed the results into the temp. surface #1

surface_set_target(surfacePPTemp1);

// Set the shader
shader_set(shd_retroscreen_screenfilter);

// Prepare the uniforms
var _u_time                 = shader_get_uniform(shd_retroscreen_screenfilter, "uTime");
var _u_shadowmaskintensity  = shader_get_uniform(shd_retroscreen_screenfilter, "uShadowmaskIntensity");
var _u_scanlineintensity    = shader_get_uniform(shd_retroscreen_screenfilter, "uScanlineIntensity");
var _u_bleendintensity      = shader_get_uniform(shd_retroscreen_screenfilter, "uBleedIntensity");
var _u_bleendsize           = shader_get_uniform(shd_retroscreen_screenfilter, "uBleedSize");
var _u_tintintensity        = shader_get_uniform(shd_retroscreen_screenfilter, "uTintIntensity");
var _u_vignetteintensity    = shader_get_uniform(shd_retroscreen_screenfilter, "uVignetteIntensity");
var _u_grainintensity       = shader_get_uniform(shd_retroscreen_screenfilter, "uFilmgrainIntensity");
var _u_brightness           = shader_get_uniform(shd_retroscreen_screenfilter, "uBrightness");
var _u_contrast             = shader_get_uniform(shd_retroscreen_screenfilter, "uContrast");
var _u_screentexelsize      = shader_get_uniform(shd_retroscreen_screenfilter, "uScreenTexelSize");
var _u_noisetexelsize       = shader_get_uniform(shd_retroscreen_screenfilter, "uNoiseTexelSize");
var _u_shadowmasktexelsize  = shader_get_uniform(shd_retroscreen_screenfilter, "uShadowmaskTexelSize");
var _u_colorlimit = shader_get_uniform(shd_retroscreen_screenfilter, "uColorLimit");
var _samp_noise      = shader_get_sampler_index(shd_retroscreen_screenfilter, "uTexNoise");
var _samp_shadowmask = shader_get_sampler_index(shd_retroscreen_screenfilter, "uTexShadowmask");
shader_set_uniform_f(_u_time, _time); // time
shader_set_uniform_f(_u_shadowmaskintensity, crtShadowmask); // intensity of shadow mask effect
shader_set_uniform_f(_u_scanlineintensity, crtScanline); // intensity of scanline
shader_set_uniform_f(_u_bleendintensity, crtBleed); // intensity of colour bleed
shader_set_uniform_f(_u_bleendsize, crtBleedSize); // size of colour bleed
shader_set_uniform_f(_u_tintintensity, crtTint); // intensity of dynamic colour tint
shader_set_uniform_f(_u_vignetteintensity, crtVignette); // intensity of vignette
shader_set_uniform_f(_u_grainintensity, crtFilmgrain); // intensity of film grain
shader_set_uniform_f(_u_brightness, crtBrightness); // brightness boost adjustment
shader_set_uniform_f(_u_contrast, crtContrast); // contrast adjustment
shader_set_uniform_f(_u_screentexelsize, 1 / screenWid, 1 / screenHei); // texel size on surface that's being drawn
shader_set_uniform_f(_u_noisetexelsize, _texnoisetexelw, _texnoisetexelh); // texel size of noise texture
shader_set_uniform_f(_u_shadowmasktexelsize, _texshadowmasktexelw, _texshadowmasktexelh); // texel size of shadow mask texture
shader_set_uniform_f(_u_colorlimit, crtColorAmt);
texture_set_stage(_samp_noise, _texnoise); // noise texture
texture_set_stage(_samp_shadowmask, _texshadowmask); // shadow mask texture

// Draw surface
draw_surface_stretched(application_surface, 0, 0, gameWid, gameHei);

// Reset shader
shader_reset();
surface_reset_target();



// Make things all nice and smooth
if doTexFilter gpu_set_texfilter(true);



/// Pass #2 : CRT Screen distortion + Border reflection
// Feed the results into the temp. surface #2
surface_set_target(surfacePPTemp2);

// Set the shader
shader_set(shd_retroscreen_distortion);
// Prepare the uniforms
var _u_time                 = shader_get_uniform(shd_retroscreen_distortion, "uTime");
var _u_distortionintensity  = shader_get_uniform(shd_retroscreen_distortion, "uScreenDistortIntensity");
var _u_reflectionintensity  = shader_get_uniform(shd_retroscreen_distortion, "uBorderReflectionIntensity");
var _u_specularcol          = shader_get_uniform(shd_retroscreen_distortion, "uSpecularLight");
var _u_specularpos          = shader_get_uniform(shd_retroscreen_distortion, "uSpecularLightOffset");
var _u_screentexelsize      = shader_get_uniform(shd_retroscreen_distortion, "uScreenTexelSize");
var _u_noisetexelsize       = shader_get_uniform(shd_retroscreen_distortion, "uNoiseTexelSize");
var _samp_noise             = shader_get_sampler_index(shd_retroscreen_distortion, "uTexNoise");
shader_set_uniform_f(_u_time, _time); // time
shader_set_uniform_f(_u_distortionintensity, crtDistortion); // screen distortion intensity
shader_set_uniform_f(_u_reflectionintensity, crtReflection); // border reflection intensity

// var _specr = (crtSpecularCol & $0000FF), _specg = (crtSpecularCol & $00FF00) >> 8, _specb = (crtSpecularCol & $FF0000) >> 16;
// shader_set_uniform_f(_u_specularcol, _specr / 255, _specg / 255, _specb / 255, crtSpecularAmp);
shader_set_uniform_f(_u_specularcol, crtSpecularR, crtSpecularG, crtSpecularB, crtSpecularAmp); // specular light colour properties (in vec4 format, rgb colour [in 0..1 range] with intensity)
shader_set_uniform_f(_u_specularpos, crtSpecularOffX, crtSpecularOffY); // specular light's offset from center
shader_set_uniform_f(_u_screentexelsize, 1 / screenWid, 1 / screenHei); // texel size on surface that's being drawn
shader_set_uniform_f(_u_noisetexelsize, _texnoisetexelw, _texnoisetexelh); // texel size of noise texture
texture_set_stage(_samp_noise, _texnoise); // noise texture

// Draw surface
draw_surface(surfacePPTemp1, 0, 0);

// Reset shader
shader_reset();
surface_reset_target();


/// Pass #3 : (final postprocessing effects) zoom blur with chromatic abberation
surface_set_target(surfacePPTemp3);
draw_clear(c_black);

// Set the shader
shader_set(shd_retroscreen_postprocessing);
// Prepare the uniforms
var _u_time             = shader_get_uniform(shd_retroscreen_postprocessing, "uTime");
var _u_glowfactor       = shader_get_uniform(shd_retroscreen_postprocessing, "uGlowFactor");
var _u_glowtint         = shader_get_uniform(shd_retroscreen_postprocessing, "uGlowTintIntensity");
var _u_blursize         = shader_get_uniform(shd_retroscreen_postprocessing, "uBlurSize");
var _u_blurzoom         = shader_get_uniform(shd_retroscreen_postprocessing, "uBlurZoomIntensity");
var _u_screentexelsize  = shader_get_uniform(shd_retroscreen_postprocessing, "uScreenTexelSize");
var _u_noisetexelsize   = shader_get_uniform(shd_retroscreen_postprocessing, "uNoiseTexelSize");
var _samp_noise         = shader_get_sampler_index(shd_retroscreen_postprocessing, "uTexNoise");
var _samp_rainbowlut    = shader_get_sampler_index(shd_retroscreen_postprocessing, "uTexRainbow");
shader_set_uniform_f(_u_time, _time); // time
shader_set_uniform_f(_u_glowfactor, crtGlowFactor); // factor/multiplier of glow (hard-capped at certain amount)
shader_set_uniform_f(_u_glowtint, crtGlowTint); // colour tint amount of blur (like chromatic aberration)
shader_set_uniform_f(_u_blursize, crtBlurSize); // half size of blur
shader_set_uniform_f(_u_blurzoom, crtBlurZoom); // zoom amount of blur
shader_set_uniform_f(_u_screentexelsize, 1 / screenWid, 1 / screenHei); // texel size on surface that's being drawn
shader_set_uniform_f(_u_noisetexelsize, _texnoisetexelw, _texnoisetexelh); // texel size of noise texture
texture_set_stage(_samp_noise, _texnoise); // noise texture
texture_set_stage(_samp_rainbowlut, _texrainbowlut); // RGB tint lookup texture

// Draw surface
draw_surface(surfacePPTemp2, 0, 0);

// Reset shader
shader_reset();
surface_reset_target();

// Draw the resulting surfaces
draw_surface_stretched(surfacePPTemp3, 0, 0, screenWid, screenHei);


// Stop things from being smooth
if doTexFilter gpu_set_texfilter(false);

#endregion
} else {
	draw_surface(application_surface, 0, 0);
}