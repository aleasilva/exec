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
      link_to "Greeting", '#', onclick: "add_fields('Hello world!','xxxx','ddddd')";
  end
  
  # generates add fields on a dynamic form
  def link_to_add_fields3(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end   
end
