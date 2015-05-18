var ak_js = document.getElementById( "ak_js" );

if ( ! ak_js ) {
	ak_js = document.createElement( 'input' );
	ak_js.setAttribute( 'id', 'ak_js' );
	ak_js.setAttribute( 'name', 'ak_js' );
	ak_js.setAttribute( 'type', 'hidden' );
}
else {
	ak_js.parentNode.removeChild( ak_js );
}

ak_js.setAttribute( 'value', ( new Date() ).getTime() );

var commentForm = document.getElementById( 'commentform' );

if ( commentForm ) {
	commentForm.appendChild( ak_js );
}
else {
	var replyRowContainer = document.getElementById( 'replyrow' );

	if ( replyRowContainer ) {
		var children = replyRowContainer.getElementsByTagName( 'td' );

		if ( children.length > 0 ) {
			children[0].appendChild( ak_js );
		}
	}
}

// var Search_Config = {
//    AUTH_TOKEN: "23d9c794-5152-05d4-31fb-87936df8e6aa",
//    ADDRESS_SEARCH: true,
//    PHONE_SEARCH: true,
//    EMAIL_SEARCH: true,
//    ADDRESS_FIELDS: [
//       [{"name":"name","id":"name","mapping":["notMapped"]},{"name":"lastname","id":"lastname","mapping":["notMapped"]},{"name":"Address","id":"Address","mapping":["addressLine1"]},{"name":"City","id":"City","mapping":"city"},{"name":"State","id":"State","mapping":"state"},{"name":"Zip","id":"Zip","mapping":"zip"},{"name":"Country","id":"Country","mapping":"country"},{"name":"Phone","id":"Phone","mapping":"phone"},{"name":"email","id":"email","mapping":"email"}]
//    ],

//    DATA_SETS: ["CAN","USA"]
// };

// (function (window, document) {
//    var url = "https://expdataqualitystatic.blob.core.windows.net/edqstatic/js-search-api-loader.js";
//    var script = document.createElement('script'); script.type = 'text/javascript'; script.async = true; script.src = url;
//    var firstScript = document.getElementsByTagName("script")[0];
//    firstScript.parentNode.insertBefore(script, firstScript);
// })(window, document);


$(document).ready(function(){
  alert(22);
  $('#multi_sending').submit(function(){

    var form = $('#multi_sending').serialize();
    var url1 = 'http://api.five9.com/web2campaign/AddToList?';
    var url2 = 'http://sendy.livingscriptures.com/subscribe';

    alert("ajax sending module starting");
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
    alert(form);

    $.ajax({
      type: 'GET',
      async: true,
      crossDomain: true,
      cache: true,
      data: form,
      url: url1,
      success: function(response) {
        alert("sent ajax to url1");
        alert(this.url);
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
            alert(this.url);
            alert("sent ajax to url2");
          }
        });
      }
    });

    // return false;
  });
});
