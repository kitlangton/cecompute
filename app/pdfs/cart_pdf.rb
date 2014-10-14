class CartPdf < Prawn::Document

  def initialize(user, cart)
    super(top_margin: 70)
    @cart = cart
    @user = user
    image "app/assets/images/CE_Logo_For_PDF.jpg", position: :center,
      width: 300
    move_down 10
    stroke_horizontal_rule
    move_down 20
    cart_heading
    line_items
    cart_total

    disclaimer
  end

  def cart_heading
    text "Quotation", size: 30, style: :bold, inline_format: true
    text "<i>Requested on:</i> #{Date.today}", inline_format: true
    text "<i>Requested by:</i> #{@user.email}", inline_format: true
  end

  def line_items
    move_down 20
    table(line_item_rows, :cell_style => { border_color: "ff8e15", inline_format: true},
          width: bounds.width) do
      cells.style do |c|
        c.background_color = c.row == 0 ? 'eeeeee' : 'ffffff'
      end
    end
  end

  def line_item_rows
    [["<b>Product</b>", "<b>Qty</b>", "<b>Original</b>", "<b>Duplicate</b>", "<b>Item Total</b>"]] +
      @cart.line_items.map do |item|
      [item.product.name, item.quantity, item.base_cost_display, item.duplicate_cost_display, item.subtotal_as_currency]
    end
  end

  def cart_total
    move_down 20
    bounding_box [0 , cursor ], width: 200, align: :center do
      move_down 5
      text "Total", align: :center, size: 10
      text @cart.total, align: :center, size: 15, style: :bold
      stroke_bounds
    end
  end

  def disclaimer
      text 'PLEASE NOTE:  Unless otherwise quoted, the estimates given do not include Proofs, File Correction, Color Correction, Packing & Handling, Shipping, Changes in Project Scope, Additional Work & Production Cost, or any Applicable Taxes or Duties.  Expediting charges will apply if the job is required prior to our normal production cycle.  If you need any additional information, please contact your Account Manager.',
        size: 8,
        valign: :bottom
  end

end
