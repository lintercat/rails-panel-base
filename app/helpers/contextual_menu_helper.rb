module ContextualMenuHelper
  def show_menu_button(link, options = {})
    options[:custom_style] ||= 'btn-outline-dark'
    options[:custom_tooltip] ||= 'Ver'
    options[:size] ||= :medium
    size = menu_button_size(options[:size])
    button_class_name = "btn #{options[:custom_style]} #{size}"

    link_to fa_icon('eye'), link,
      title: options[:custom_tooltip],
      class: button_class_name
  end

  def edit_menu_button(link, options = {})
    options[:custom_style] ||= 'btn-outline-dark'
    options[:custom_tooltip] ||= 'Editar'
    options[:size] ||= :medium
    size = menu_button_size(options[:size])
    button_class_name = "btn #{options[:custom_style]} #{size}"

    link_to fa_icon('edit'), link,
      title: options[:custom_tooltip],
      class: button_class_name
  end

  def back_menu_button(link, options = {})
    options[:custom_style] ||= 'btn-outline-dark'
    options[:custom_tooltip] ||= 'Atrás'
    options[:size] ||= :medium
    size = menu_button_size(options[:size])
    button_class_name = "btn #{options[:custom_style]} #{size}"

    link_to fa_icon('chevron-left'), link,
      title: options[:custom_tooltip],
      class: button_class_name
  end

  def destroy_menu_button(link, options = {})
    options[:custom_style] ||= 'btn-outline-dark'
    options[:custom_tooltip] ||= 'Eliminar'
    options[:confirm_message] ||= '¿Está seguro?'
    options[:size] ||= :medium
    size = menu_button_size(options[:size])
    button_class_name = "btn #{options[:custom_style]} #{size}"

    link_to fa_icon('trash'), link,
      class: button_class_name,
      method: :delete,
      title: options[:custom_tooltip],
      data: {
        confirm: options[:confirm_message]
      }
  end

  private
    def menu_button_size(size)
      case size
      when :medium
        return nil
      when :small
        return 'btn-sm'
      when :big
        return 'btn-lg'
      end 
    end
end
