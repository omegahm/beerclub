module ApplicationHelper
  def number_to_colored_currency(number)
    return '' if number.nil?
    content_tag :span, number_to_currency(number), class: number > 0 ? 'positive' : 'negative'
  end
end
