$(document).ready(function() { 
  $('#donate_form input').labelify();   
  
  $('#show_me').change(function() {  
    if($(this).is(':checked')) {
      $('#donor_details').fadeIn();
    }  
    else {
      $('#donor_details').fadeOut();
    }
  });   
  
  $('.link_to_top').click(function() {
    $.scrollTo('#top', 800, {easing:'easeInQuad'});
  });
  
  
  $("#donate_form").submit(function(){     
      $('#paypal_amount').val($('#amount').val());   
      $.post(  
          "/donate",  
          $("#donate_form").serialize()  
      );        
      $('#paypal_form').trigger('submit');
      return false;        
  });  

});
              

Cufon.replace('h1, h3', { fontFamily: 'Muse'});