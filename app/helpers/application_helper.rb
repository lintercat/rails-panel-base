module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }, 'aria-label' => "Close" ) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
        end)
        case
        when bootstrap_class_for(msg_type) == "alert-success"
          concat content_tag(:span, '<i class="fa fa-check-circle"></i>'.html_safe, 'aria-hidden' => true)
        when bootstrap_class_for(msg_type) == ("alert-danger" || "alert-warning")
          concat content_tag(:span, '<i class="fa fa-times-circle"></i>'.html_safe, 'aria-hidden' => true)
        else
          concat content_tag(:span, '<i class="fa fa-info-circle"></i>'.html_safe, 'aria-hidden' => true)
        end
        concat " " + message
        concat "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".html_safe
      end)
    end
    nil
  end

  def link_to_add_fields(link_text, f, association, target, partial = nil, options = {})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    partial = "#{association.to_s.singularize}_fields" if partial.nil?
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(partial, f: builder)
    end

    options[:data] ||= {}
    options[:data].reverse_merge!(add_resource: id, target: target, fields: fields.gsub("\n", ""))

    link_to(link_text, '#', options)
  end

  def link_to_destroy_fields(link_text, container, options = {})
    options[:data] ||= {}
    options[:data][:delete_resource] = true
    options[:data][:target] = container
    link_to link_text, '#', options
  end

  def current_path?(test_path)
    'active' if request.path.starts_with? test_path
  end

  # Create a select from an enum type
  def options_from_enum_for_select(instance, enum)
    options_for_select(enum_collection(instance, enum), instance.send(enum))
  end

  # Used by `options_from_enum_for_select`, creates a collection from an enum type
  # To translate the options in the select use the following structure in your I18n files:
  #     en.activerecord.attributes.my_model.my_enum_attribute
  def enum_collection(instance, enum)
    instance.class.send(enum.to_s.pluralize).keys.to_a.map do |key|
      [I18n.t("activerecord.attributes.#{instance.model_name.i18n_key}.#{key}"), key]
    end
  end

  def sidebar_text_with(title)
    "#{title} #{fa_icon('angle-right', class: 'pull-right mt-1 d-none d-md-block')}".html_safe
  end
end
