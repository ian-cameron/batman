// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var voltsRE = /\d+\.\d/;
function batteryColor(voltage) {
    var hue = ((voltage) * 120).toString(10);
    return ["hsl(", hue, ",100%,50%)"].join("");
}

function batteryEstimate(str) {
    return (voltsRE.exec(str) - 11.5) / 1.15;
}

function batteryInit(obj, index) {
    $(obj).append('<div class="battery-top"></div>').append('<div class="battery-status" id="battery-' + index + '"></div>');
    var v = batteryEstimate($(obj).text());
    v = (v > 1.0 ? 0.99 : v)
    $('#battery-' + index).css({
        'width': Math.floor(v * 100) + '%',
        'background-color': batteryColor(v)	
    });
	$(obj).draggable({grid: [20,20]}).dblclick(function() {
	    $.ajax({
	      url: '/devices/'+this.id.split('-').pop()+'/edit',
	      type: 'GET',
		  dataType: 'script'
	    });
	});
	console.log("battery "+index+" loading")	
}
$(window).load(function() {
	$('.battery')
	$('.project').droppable({tolerance:'touch',
	drop: function(event, ui) {
		$(this).append(ui.draggable);
		$(ui.draggable).removeAttr('style');
	}
		});
    $('.battery').each(function (index, obj) {
        batteryInit(obj, index);
    });
});
