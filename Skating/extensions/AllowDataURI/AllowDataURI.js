function AllowDataURI() {
	var p0 = "\\s*\\(\\s*";
	var p1 = "\\s*\\)\\s*";
	var eq = "\\s*=\\s*";
	var id = "\\w+";
	//
	var init_js = window.gml_Script_gmcallback_AllowDataURI.toString();
	var sprite_add_js = window[
		/\bAllowDataURI\s*\(\s*(\w+)/.exec(init_js)[1] // AllowDataURI(sprite_add(...
	].toString();
	var sprite_add_url = /function\s*\w*\s*\((\w+)/g.exec(sprite_add_js)[1];
	var sprite_add_url2 = new RegExp(
		"("+id+")"+eq+sprite_add_url+"\\b", // `sprite_add_url2 = sprite_add_url`
	"g").exec(sprite_add_js);
	sprite_add_url2 = sprite_add_url2 ? sprite_add_url2[1] : sprite_add_url;
	//
	var image_add_js = window[new RegExp(
		id+eq+"("+id+")"+p0+sprite_add_url2+p1, // `_ = image_add(sprite_add_url2)`
	"g").exec(sprite_add_js)[1]].toString();
	var image_add_url = /function\s*\w*\s*\((\w+)/g.exec(image_add_js)[1];
	//
	var url_proc = new RegExp(
		id+eq+"("+id+")"+p0+image_add_url+p1, // `_ = url_proc(image_add_url)`
	"g").exec(image_add_js)[1];
	window[url_proc] = (function() {
		var f = window[url_proc];
		return function(url) {
			if (url.substring(0, 5) == "data:") return url;
			return f.apply(this, arguments);
		};
	})();
	//
	return false;
}