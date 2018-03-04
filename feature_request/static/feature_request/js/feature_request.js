$(function () {
  $("#target_date").datepicker({ 
        autoclose: true, 
        todayHighlight: true
  }).datepicker('update', new Date());
});

function add_feature(){
    var data = {
        'title': $("#title").val(),
        'description': $("#description").val(),
        'client_id': $("#client").val(),
        'priority': $("#priority").val(),
        'product_id': $("#product").val(),
        'target_date': $("#target_date").find("input").val(),
    }
    if(data.title == ''){
        customAlert("Enter Title");
    }
    else if(data.client_id == ''){
        customAlert("Select Client");
    }
    else if(data.priority == ''){
        customAlert("Enter Priority");
    }
    else if(data.product_id == ''){
        customAlert("Select Product");
    }
    else if(data.target_date == ''){
        customAlert("Select Target Date");
    }
    else{
        $.ajaxSetup({
            beforeSend: function(xhr, settings) {
                xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
            }
        });
        $.ajax({  
            type: "POST",  
            url: "/feature/add/",
            data: data,  
            dataType: "json",
            success: function(response){
                if(response.e_message == ''){
                    location.href = "/feature/listing/";
                }
                else{
                    customAlert(response.e_message);
                }
            }
        });
    }
}