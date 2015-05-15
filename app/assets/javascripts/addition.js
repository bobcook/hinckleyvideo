
$(document).ready(function(){
  $('#multi_sending').submit(function(){

    var form = $('#multi_sending').serialize();  
    var url1 = 'http://api.five9.com/web2campaign/AddToList?';
    var url2 = 'http://sendy.livingscriptures.com/subscribe';

    // alert("ajax sending module starting");
    // console.log(form);

    form = "";
    form += "F9domain=LivingScriptures&";
    form += "number1="+$('#Phone').val()+"&";
    form += "F9list=Outbound%20Generated%20Leads&";
    form += "F9CallASAP=f9&";
    form += "first_name="+$('#name').val()+"&";
    form += "last_name="+$('#lastname').val()+"&";
    form += "zip="+$('#Zip').val()+"&";
    form += "street="+$('#City').val();

    console.log(form);
    // alert(form);

    $.ajax({
      type: 'GET',
      async: true,
      crossDomain: true,
      cache: true,
      data: form,
      url: url1,
      success: function(response) {
        // alert("sent ajax to url1");
        // alert(this.url);
        form = $('#multi_sending').serialize();  
        
        $.ajax({
          type: 'POST',
          async: true,
          crossDomain: true,
          cache: true,
          data: form,
          url: url2,
          // dataType: "jsonp",
          success: function(response) {
            // alert(this.url);
            alert("sent ajax to url2");
          }
        });
      }
    });

    // return false;
  });
});

