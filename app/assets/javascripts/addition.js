// https://api.five9.com/web2campaign/AddToList?F9domain=LivingScriptures&F9list=Outbound%20Generated%20Leads&number1=9252182325&first_name=enping&last_name=an&city=city &list=list&zip=zip&F9CallASAP=f9&street=street&listname=listname&email=email@email.com

//http://api.five9.com/web2campaign/AddToList?F9domain=LivingScriptures&F9list=Outbound%20Generated%20Leads&F9CallASAP=f9&first_name=1123&last_name=123&list=undefined&zip=11231&street=1&listname=Outbound
// &email=email@email.com
// &typecode=typecode
// &country=country
// &phone1=phone1 
// &date=date
// &state=state
$(document).ready(function(){
    $('#multi_sending').submit(function(){
        var form = $('#multi_sending').serialize();  
        var url1 = 'http://api.five9.com/web2campaign/AddToList?';
        var url2 = 'http://sendy.livingscriptures.com/subscribe';

        // alert("ajax sending module starting");
        console.log(form);

        // https://api.five9.com/web2campaign/AddToList?F9domain=LivingScriptures&F9list=Outbound%20Generated%20Leads&(the contents of the form)
        // httsp://api.five9.com/web2campaign/AddToList?F9domain=LivingScriptures&numbe…%20Leads&F9CallASAP=f9&first_name=Bob5&last_name=Cook&zip=84321&street=227
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
                        alert(this.url);
                        // alert("sent ajax to url2");
                    }
                });
            }
        });

        window.location="http://www.hinckleyvideo.com/thanks/";

        // var url = 'http://api.alice.com/cors';
        // var xhr = createCORSRequest('GET', url);
        // xhr.send();

        // xhr.setRequestHeader( 'X-Custom-Header', 'value');

        // $.post('http://sendy.livingscriptures.com/subscribe', form, 
        //     function(result){
        //         alert("sent ajax to url2");
        //     }
        // );

        // xhr.send(
        // $.post('http://api.five9.com/web2campaign/AddToList?', form, 
        //     function(result){
        //         alert("sent ajax to url1");
        //     })
        // );

    //     $.ajax({
    //         url: url1,
    //         type: "POST",
    //         crossDomain: true,
    //         headers: {
    //             F9domain: "LivingScriptures",
    //             F9list:  "Outbound Generated Leads",
    //             F9key: "4357707791"
    //         },
    // //      data: form,
    //         dataType: "json",
    //         success:function(result){
    //             alert("sent ajax to url1");
    //         },
    //         error:function(xhr,status,error){
    //             alert("fail to send ajax to url1");
    //         }
    //     });
        
        return false;
    });



});
