document.addEventListener("DOMContentLoaded", function(event) {
  if ($("#item_with_message")[0]){
    new Vue({
     el: '#item_with_message',
     data: {
       cart_items: gon.cart_items,
       content: ""
     },
     computed: {
        showText: function(item){
            return item.message_card.card_type_id < 4 ? false : true;
        }
      }
    })
  }
});
