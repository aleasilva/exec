module ApplicationHelper

  def link_to_remove_fields(name, f)
    #f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
    #f.hidden_field(:_destroy) + link_to(name,"#","alert('aaaa')")

    #f.hidden_field(:_destroy) +  link_to(name,'#', :onclick => 'remove_fields(this)')
    f.hidden_field(:_destroy) +  link_to(image_tag("btnOperation/form_delete.png", :alt => "Remover") ,'#', :onclick => 'remove_fields(this)')

  end

  def link_to_add_fields(name, f, association)
      new_object = f.object.class.reflect_on_association(association).klass.new
      #
      fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
        render(association.to_s.singularize + "_tab", :f => builder)
      end
      #
      link_to name, '#', onclick: "add_fields_to_table(this,'#{association}','#{escape_javascript(fields)}')", :class => "btn btn-info" ;
  end

  def onlyTextNumber()
    #"if ( isNaN(this.value + String.fromCharCode(event.keyCode) )) return false;"
    "return isNumberKey(event)"
  end

  def limitSizeNumber(min, max)
    "return isNumberKeyLength(event,'#{min}','#{max}')"
  end

  def mark_required(object, attribute)
    " * " if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end

  def print_this_page(name)
    link_to name, '#', onclick: "printDiv()", :class => "btn btn-info";
  end

  #Cria uma barra para identficacao dos Exercicios
  def insBarMessage(message)
    content_tag(:div,
      content_tag(:div,message,class: ["progress-bar progress-bar-info"],role: "progressbar",
                             "aria-valuenow" => ["60"], "aria-valuemin" => "0",
                            "aria-valuemax"=>"100",style: "width: 100%;"),
    class: ["progress"])

  end

  def number_to_currency_br(number)
    number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end

end
