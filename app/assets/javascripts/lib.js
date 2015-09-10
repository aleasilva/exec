$(function() {

	//Tabelas
	$("#tabs").tabs();

	//Sanfona
	$("#accordion").accordion();

	//Alerta no clique
	$( "#target" ).keypress(function() {
		alert('sei á.');
	});

	//Funcao para a data -wice grid
	$("input[id|='datepicker']").datepicker({
		changeYear: true,
		closeText: 'Fechar',
		prevText: '<Anterior',
		nextText: 'Seguinte>',
		currentText: 'Hoje',
		monthNames: ['Janeiro', 'Fevereiro', 'Mar&ccedil;o', 'Abril', 'Maio', 'Junho','Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
		monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun','Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
		dayNames: ['Domingo', 'Segunda-feira', 'Ter&ccedil;a-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'S&aacute;bado'],
		dayNamesShort: ['Do', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'S&aacute;b'],
		dayNamesMin: ['Do', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'S&aacute;b'],
		weekHeader: 'Sem',
		dateFormat: 'dd/mm/yy',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''
	});

	//Mascara para os inputs -Não mudar a ordem
	$.mask.masks.idacademia  =  {mask: '999999999999999999999999999999', type: 'reverse'};
	$.mask.masks.intDecimal  =  {mask: '99'     , type: 'reverse'};
	$.mask.masks.intCentena  =  {mask: '999'    , type: 'reverse'};
	$.mask.masks.intUnitario =  {mask: '9999'   , type: 'reverse'};
	$.mask.masks.strTempoExe =  {mask: '999/999', type: 'reverse'};
	$.mask.masks.currency    =  {mask: '99,999.999.999', type: 'reverse'};
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
   var printContents = "";
   var frmImprimir = window.open('','Imprimir');
	 var varLink = '<link rel="stylesheet" type="text/css" href=http://' + window.location.host;

	 //Montar cabeçalho
   var cabec = "<html><head><title>Impressão</title>" ;
   cabec += varLink + '/assets/bootstrap_and_overrides.css media="all">';
   cabec += varLink +'/assets/scaffolds.css media="all" >';
   cabec += "</head><body>";

	 //Montar corpo
	 var body = '<table style="height:100px;width:100px;">';
	 body += '<tr><td>';
	 body += document.getElementById(divName).innerHTML;
	 body += '</tr></td>';

	 frmImprimir.document.head.innerHTML = cabec;
	 frmImprimir.document.body.innerHTML = body;

   frmImprimir.print();
   frmImprimir.close();
   self.location="/";
}
