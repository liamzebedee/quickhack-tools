// 
//
// I made this into a Chrome extension!!!
// https://github.com/liamzebedee/highwiki
//
//

// makeKnowledgeFunky
function makeKnowledgeFunky(ev){ 
	ev.preventDefault(); 
	var el = $(ev.target); 
	$.get(el.attr('href'), function(res){ 
		var paragraph = $('#mw-content-text p', res).first(); 
		var content = $("<div style='padding:1em;border:1px solid #ffe;'>"+paragraph.html()+"</div>");
		$('a', content).click(makeKnowledgeFunky);
		el.after(content);
	});
};
$('a').click(makeKnowledgeFunky)
