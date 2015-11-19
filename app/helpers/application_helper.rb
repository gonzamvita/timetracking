module ApplicationHelper
  def flash_message
    if flash[:alert]
      flash_content_tag('alert')
    elsif flash[:notice]
      flash_content_tag('notice')

    end
  end

  def total_work_hours project
    date = Date.current
    total_hours = project.total_hours_in_month(date.month, date.year)
  end

  private
  def flash_content_tag type
    content_tag :div, class: 'message alert' do
        content_tag :p do
          flash[type.to_sym]
        end
    end
  end
end

