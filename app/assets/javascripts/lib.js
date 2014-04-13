$(function() {
	//Tabelas
	$("#tabs").tabs();

	//Sanfona
	$("#accordion").accordion();
	
	//Alerta no clique
	$( "#target" ).keypress(function() {
		alert('sei á.');
	});
	
	//Funcao para a data	
	$("input[id|='datepicker']").datepicker({
		showAnim : "fadeIn"
	});
	
	//Mascara para os inputs -Não mudar a ordem		
	$.mask.masks.idAcademia  =  {mask: '999999999999999999999999999999', type: 'reverse'};
	$.mask.masks.intDecimal  =  {mask: '99'     , type: 'reverse'};
	$.mask.masks.intCentena  =  {mask: '999'    , type: 'reverse'};
	$.mask.masks.intUnitario =  {mask: '9999'   , type: 'reverse'};
	$.mask.masks.strTempoExe =  {mask: '999/999', type: 'reverse'};
	
	$('input[type="text"]').setMask();
	
});


//Funcao de script
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

function add_fields_to_table(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	
	//$("#tblData").prepend(content.replace(regexp, new_id));
	$("#tblData").append(content.replace(regexp, new_id));
	
	//$("#tblData").prepend("<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
	//$("#tblData > tbody:last").append("<tr><td>last</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
	//$(link).parent().before(content.replace(regexp, new_id));
	//$("#tblData tbody").after.append(content.replace(regexp, new_id));
}

function isNumberKeyLength(evt, min, max){
	if(isNumberKey(evt)){
 		var source=evt.currentTarget;
 		var size = source.value.length + 1;
 		if (size >= min && size <= max){
 			return true;
 		}	
	}
	return false;
}

function isNumberKey(evt){
	var source=evt.currentTarget;
	
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57)){
		return false;
	}
    return true;
}

function printDiv() {
	 var divName = "printMe";	 
     var printContents = document.getElementById(divName).innerHTML;
     var frmImprimir = window.open('','Imprimir');
     
	 frmImprimir.document.body.innerHTML = printContents;
     frmImprimir.print();   
     frmImprimir.close();

}