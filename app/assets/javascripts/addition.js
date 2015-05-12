
$(document).ready(function(){

  function delay_redirecting() {
    window.location = "https://www.hinckleyvideo.com/thanks/";
  }

  $('#multi_sending').submit(function(){
      var form = $('#multi_sending').serialize();  
      var url1 = 'https://api.five9.com/web2campaign/AddToList?';
      var url2 = 'https://sendy.livingscriptures.com/subscribe';

      // alert("ajax sending module starting");
      console.log(form);

      form = "";
      form += "F9domain=LivingScriptures&";
      form += "number1="+$('#phone1').val()+"&";
      form += "F9list=Outbound%20Generated%20Leads&";
      form += "F9CallASAP=f9&";
      form += "first_name="+$('#first_name').val()+"&";
      form += "last_name="+$('#last_name').val()+"&";
      form += "zip="+$('#zip').val()+"&";
      form += "street="+$('#street').val();
      
      console.log(form);

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
                  }
              });
          }
      });

      setTimeout(delay_redirecting, 5000);
      
      return false;
  });
});
