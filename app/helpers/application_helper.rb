module ApplicationHelper

  ICON_SIZE='16x16'

  # generate edit link with icon
  def link_to_edit(path)
    link_to image_tag('icons/001_45.png',
                      :size => ICON_SIZE,
                      :alt => 'Edit'), path
  end

  # show link with icon
  def link_to_show(path)
    link_to image_tag('icons/001_38.png',
                      :size => ICON_SIZE,
                      :alt => 'Show'), path
  end

  # destroy link with icon
  def link_to_destroy(path)
    link_to image_tag('icons/001_05.png',
                      :size => ICON_SIZE,
                      :alt => 'Delete'), path,
    :confirm => 'Are you sure?', :method => :delete
  end

  # generate std show, edit, destroy links for object
  def link_actions_for(object)
    link_to_show(object) +
      link_to_edit(edit_polymorphic_path(object)) +
      link_to_destroy(object)
  end

  def number_to_euro(amount)
    number_to_currency(amount) unless amount.blank?
  end
  
end
