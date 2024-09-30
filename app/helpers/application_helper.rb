module ApplicationHelper

def menu_items
  [{
    name: 'Home',
    path: root_path,
  }, {
    name: 'About',
    path: about_path,
  }, {
    name: 'Contact',
    path: contact_path,
  }, {
    name: 'Privacy',
    path: privacy_path,
  },].map do |item|
    {
      name: item[:name],
      path: item[:path],
      active: current_page?(item[:path])
    }
  end
end

  def readable_time(time)
    time.strftime("%b %d, %I:%M%P")
  end

  def author_of(record)
    user_signed_in? && current_user.id == record.user_id
  end

  def admin?
    user_signed_in? && current_user.has_role?(:admin)
    # true
  end

end
