module ApplicationHelper
  def number_to_colored_currency(number)
    content_tag :span, number_to_currency(number), class: number > 0 ? 'positive' : 'negative'
  end
end
