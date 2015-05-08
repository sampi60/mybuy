module ApplicationHelper
  def main_container_class
    controller.class.name.split('::').first == 'Devise' ? 'container sessions' : 'container'
  end
end
