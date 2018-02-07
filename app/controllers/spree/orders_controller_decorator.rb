Spree::OrdersController.class_eval do


  def edit
    @order = current_order || Order.incomplete.find_or_initialize_by(guest_token: cookies.signed[:guest_token])
    associate_user
    # Below is added to pass model to JS
    line_items = @order.line_items
    gon.cart_items = []
    line_items.each do |line_item|
      variant = line_item.variant
      img_tag = variant.product.display_image.attachment(:large)
      product = variant.product
      message_card = line_item.set_message_card
      gon.cart_items << {line_item: line_item, img_tag: img_tag, product: product, message_card: message_card}
    end
  end

end
