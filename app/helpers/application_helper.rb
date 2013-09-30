module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    Rails.logger.info("PASSOU 1")
    new_object = f.object.class.reflect_on_association(association).klass.new
    Rails.logger.info("PASSOU 2")    
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    Rails.logger.info("PASSOU 5")    
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

  def link_to_add_fields2(name, f, association)
      new_object = f.object.class.reflect_on_association(association).klass.new
      #      
      fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
        render(association.to_s.singularize + "_fields", :f => builder)
      end
      #
      #link_to_function(name, h("add_fields2(this)"))
      #link_to_function "Greeting", "alert('Ola mundo!')", :class => "nav_link"      
      link_to_function(name, h("add_fields2('x','x')"))
  end
  
  # generates add fields on a dynamic form
  def link_to_add_fields3(name, f, association, locals={})  
    new_object = f.object.class.reflect_on_association(association).klass.new  
    fields = f.fields_for(association, new_object,:child_index => "new_#{association}") do |builder|  
      render(association.to_s.singularize + "_fields", locals.merge!(:f => builder))  
    end  
  
    link_to(name, "#", :class => "dynamic_add", 'data-association' => "#{association}", 'data-content' => "#{fields}")
  end    
end
