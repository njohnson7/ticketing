module ApplicationHelper
  def format_ticket_status ticket_status
    Ticket::STATUSES.key ticket_status
  end

  def format_tags tags
    tags.map(&:name).join ', '
  end
end
