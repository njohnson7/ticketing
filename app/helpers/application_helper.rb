module ApplicationHelper
  def format_ticket_status ticket_status
    ticket_status.tr('_', ' ').gsub(/\b\w/, &:upcase)
  end
end
