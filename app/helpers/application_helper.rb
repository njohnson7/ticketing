module ApplicationHelper
  def format_ticket_status ticket_status
    Ticket::STATUSES.key ticket_status
  end

  def format_tags tags
    tags.empty? ? '-' : tags.map(&:name).join(', ')
  end

  def updated? model
    model.created_at != model.updated_at
  end

  def created_ago model
    "#{time_ago_in_words(model.created_at)} ago"
  end

  def updated_ago model
    "#{time_ago_in_words(model.updated_at)} ago"
  end

  def format_timestamps model 
    "#{created_ago model}#{" - updated #{updated_ago model}" if updated? model}"
  end
end
