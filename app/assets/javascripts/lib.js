$(function() {
	$("#tabs").tabs();
});

$(function() {
	$("input[id|='datepicker']").datepicker({
		showAnim : "fadeIn"
	});
});

$(function() {
	$("#accordion").accordion();
});

function remove_fieldsNotUsed(link) {
	$(link).previous("input[type=hidden]").value = "1";
	$(link).up(".fields").hide();
}

function add_fieldsNotUsed(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	alert('add fields');
	$(link).up().insert({
		before : content.replace(regexp, new_id)
	});
}

function remove_fields(link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	$(link).parent().before(content.replace(regexp, new_id));
}