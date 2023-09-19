$(document).keyup(function(e) {
    if (e.keyCode === 27 || e.keyCode === 8) {
        if ($(".inner-container").hasClass("anim-enter")) {
            $(".inner-container").addClass("anim-exit");
            $(".inner-container").removeClass("anim-enter");
            setTimeout(() => {
                $(".inner-container").removeClass("anim-exit");
                clearData();
                $.post("https://t3_warrantcards/closeNUI");
            }, 400);
        }
    }
});
$(document).mouseup(function() {
    if ($(".inner-container").hasClass("anim-enter")) {
        $(".inner-container").addClass("anim-exit");
        $(".inner-container").removeClass("anim-enter");
        setTimeout(() => {
            $(".inner-container").removeClass("anim-exit");
            clearData();
			$.post("https://t3_warrantcards/closeNUI");
        }, 400);
    }
});
function show(data) {
    $("#war-no").html(data.number);
    $("#name").html(data.firstName + " " + data.lastName);
    $("#job").html(formatJob(data.job));
    if (data.img) {
        $("#portrait").attr("src",`https://nui-img/${data.img}/${data.img}?v=${Date.now()}`);
    }
    resizeBox();
    $(".inner-container").addClass("anim-enter");
};
function clearData() {
    $("#war-no").html("0");
    $("#name").html("Test Test");
    $("#job").html("Inspector");
    $("#portrait").attr("src","images/portrait.png");
}
function formatJob(job) {
    if (job === "pcso") {return job.toUpperCase()}
    const words = job.split(" ");
    for (let i = 0; i < words.length; i++) {
        words[i] = words[i][0].toUpperCase() + words[i].substr(1);
    }
    return words.join(" ");
}

var text = document.getElementById("name");
var text2 = document.getElementById("job");

function resizeBox() {
    text = document.getElementById("name");
    text2 = document.getElementById("job");
	calcTextWidth();
	calcTextSize();
	calcTextWidth2();
	calcTextSize2();
}
function calcTextWidth() {
	const currentTextWidth = text.scrollWidth;
	const currentFontStretch = parseInt(window.getComputedStyle(text).fontStretch);
	const newValue = Math.min(Math.max(300, (235 / currentTextWidth) * currentFontStretch), 500)

	text.style.setProperty('--fontStretch', newValue + '%');
}
function calcTextSize() {
	const currentTextWidth = text.scrollWidth;
	const currentFontSize = parseInt(window.getComputedStyle(text).fontSize);
	var newValue = Math.min(Math.max(12, (235 / currentTextWidth) * currentFontSize), 500)

	if (newValue > 28) {
		newValue = 28;
	}
	text.style.setProperty('--fontSize', newValue +'px');
}
function calcTextWidth2() {
	const currentTextWidth = text2.scrollWidth;
	const currentFontStretch = parseInt(window.getComputedStyle(text2).fontStretch);
	const newValue = Math.min(Math.max(300, (235 / currentTextWidth) * currentFontStretch), 500)

	text.style.setProperty('--fontStretch', newValue + '%');
}
function calcTextSize2() {
	const currentTextWidth = text2.scrollWidth;
	const currentFontSize = parseInt(window.getComputedStyle(text2).fontSize);
	var newValue = Math.min(Math.max(8, (235 / currentTextWidth) * currentFontSize), 500)

	if (newValue > 24) {
		newValue = 24;
	}
	text2.style.setProperty('--fontSize', newValue +'px');
}
window.onload = function() {
    var eventCallback = {
        show: function(data){
            show(data)
        },
    }
	window.addEventListener('message', function(event) {
        eventCallback[event.data.action](event.data.data);
    })
	
};