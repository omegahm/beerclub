prawn_document(page_layout: :landscape, page_size: 'A4') do |pdf|
  # Define grid to be 
  # ---------------------
  # |                   |
  # ---------------------
  # |   |           |   |
  # ---------------------

  total_paid = @payments.inject(0) {|sum, b| sum += b.second}
  total_balance = (@balances.inject(0) {|sum, b| sum += b.second} + total_paid)

  pdf.font_size 15
  pdf.move_up 20
  pdf.text 'Køkken 400 Ølloge', align: :center

  pdf.font_size 8
  data = [
           [
             { content: 'Navn',    width: 50 }, 
             { content: 'Værelse', width: 50 }
           ] + 

           @products.map {|p| { content: p.name, width: p.width.presence || 130 } } + 
           
           [
             { content: 'Indbetalt' }, 
             { content: 'Balance', width: 70}
          ]
         ]

  @users.each do |user|
    user_data = [
      { content: user.name, align: :center }, 
      { content: user.room, align: :center }
    ]

    @products.each do |product|
      user_data << ''
    end
    
    # Payment
    user_data << ''
    
    # Balance
    num = (@balances[user.id].presence || 0) + (@payments[user.id].presence || 0)
    user_data << { content: number_to_currency(num), align: :left, text_color: (num > 0 ? '00CC00' : 'CC0000') }

    data << user_data
  end

  # Totals
  data << [
    { content: 'Total', align: :center, font_style: :bold, border_lines: [:dashed, :solid, :solid, :solid] }, 
    { content: '', border_lines: [:dashed, :solid, :solid, :solid]},
  ] + 
  
  @products.flat_map { |product| 
    [ content: @totals[product.id].to_s, align: :center, font_style: :bold, border_lines: [:dashed, :solid, :solid, :solid] ] 
  } + 

  [
    { content: '', border_lines: [:dashed, :solid, :solid, :solid]},
    { content: number_to_currency(total_balance), align: :center, font_style: :bold, border_lines: [:dashed, :solid, :solid, :solid] }
  ]
  
  # Main table
  pdf.table data, :width => pdf.bounds.width, :cell_style => { :height => 12, :padding => [0, 5, 0, 5] } do 
    # Bold header
    row(0).background_color = 'FFD700'
    row(0).font_style = :bold
    row(0).align = :center

    # Alternating colors
    cells.style do |c|
      if c.row == 0
        c.background_color = 'FFD700'
      elsif c.row % 2 == 0
        c.background_color = 'D7D7D7'
      else
        c.background_color = 'FFFFFF'
      end  
    end
  end

  pdf.move_down 10
  products_data = @products.inject([]) {|arr, p| arr << [p.name, { content: number_to_currency(p.price), align: :right }]; arr }
  pdf.table products_data, :cell_style => { :height => 12, :padding => [0, 5, 0, 5] }
  
  meta_data = [
    ['Salg sidste måned', { content: number_to_currency(@sales_last_month),        align: :right}],
    ['Kontant',           { content: number_to_currency(@last_month_meta[:cash]),  align: :right}],
    ['Svind',             { content: number_to_currency(@last_month_meta[:loss]),  align: :right}],
    ['Ølbeholdning',      { content: number_to_currency(@last_month_meta[:stock]), align: :right}],
    ['Penge i alt',       { content: number_to_currency(total_balance + @last_month_meta[:stock] + @last_month_meta[:cash]), align: :right}]
  ]

  pdf.move_up 30
  pdf.text 'Bankkonto:', align: :center
  pdf.text 'Reg nr.: 0333 Konto nr.: 4381 563 672', align: :center
  pdf.text 'Husk at skrive værelsesnummer på, når I betaler', align: :center
  pdf.move_down 5
  pdf.text I18n.l(DateTime.current, format: :long).capitalize, align: :center
  
  pdf.move_up 60
  pdf.table meta_data, position: :right, :cell_style => { :height => 12, :padding => [0, 5, 0, 5] }
end
