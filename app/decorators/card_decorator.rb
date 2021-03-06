class CardDecorator < ApplicationDecorator
  decorates :card

  def complete_button
    if !card.completed?
      form = h.form_for(self) do |f|
        hf = f.hidden_field(:completed, value: true)
        bt = h.button_tag('Complete', class: 'btn')
        hf + bt
      end
      heading = h.content_tag(:h4, 'Complete')
      h.content_tag :div, heading + form, class: 'complete'
    end
  end

  def move_interface
    form = h.form_for(card) do |f|
      label = f.label(:folder_name)
      select = f.select :folder_name, Card::VALID_FOLDER_NAMES, class: 'chzn-select'
      submit = f.submit 'Move', class: 'btn'
      input = h.content_tag(:div, select + submit, class: 'input')
      label + input
    end
    heading = h.content_tag(:h4, 'Move')
    h.content_tag :div, heading + form, class: 'move'
  end

  def folder_link(folder_name)
    unless folder_name
      text = "In " + h.link_to("folder #{self.folder_name}", h.folder_path(self.folder_name)).html_safe
      h.content_tag :div, text.html_safe, class: 'folder'
    end
  end

  def html_class
    "card-module #{status}"
  end

  # Accessing Helpers
  #   You can access any helper via a proxy
  #
  #   Normal Usage: helpers.number_to_currency(2)
  #   Abbreviated : h.number_to_currency(2)
  #   
  #   Or, optionally enable "lazy helpers" by calling this method:
  #     lazy_helpers
  #   Then use the helpers with no proxy:
  #     number_to_currency(2)

  # Defining an Interface
  #   Control access to the wrapped subject's methods using one of the following:
  #
  #   To allow only the listed methods (whitelist):
  #     allows :method1, :method2
  #
  #   To allow everything except the listed methods (blacklist):
  #     denies :method1, :method2

  # Presentation Methods
  #   Define your own instance methods, even overriding accessors
  #   generated by ActiveRecord:
  #   
  #   def created_at
  #     h.content_tag :span, time.strftime("%a %m/%d/%y"), 
  #                   class: 'timestamp'
  #   end
end
