module ApplicationHelper
  def check_params

  end


  def site_name
    title =  "PollWatchUSA - Help democratize poll monitoring"
    if Rails.env.development?
      title.prepend "[SITE] - "
    else
      title
    end
  end

  def page_name
    @page_name ||= ""
  end

  def page_name_is(name)
    @page_name.match name
  end
  
end
