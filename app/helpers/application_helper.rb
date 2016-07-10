module ApplicationHelper

  def status_label(status)
    case status
    when "pending"
      "<span class='label label-warning'>Pending</span>".html_safe
    when "confirmed"
      "<span class='label label-success'>Confirmed</span>".html_safe
    when "cancelled"
      "<span class='label label-danger'>Cancelled</span>".html_safe
    else
      status
    end
  end

end
