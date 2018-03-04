function signup(){
    var data = {
        'first_name': $("#first_name").val(),
        'last_name': $("#last_name").val(),
        'email': $("#email").val(),
        'contact_number': $("#contact_number").val(),
        'e_code': $("#e_code").val(),
        'password': $("#password").val(),
        'd_code': $("#d_code").val()
    }

    if(data.first_name == ''){
        customAlert("Enter First Name");
    }
    else if(data.last_name == ''){
        customAlert("Enter Last Name");
    }
    else if(data.email == ''){
        customAlert("Enter Email");
    }
    else if(!validateEmail(data.email)){
        customAlert("Enter Correct Email");
    }
    else if(data.contact_number == ''){
        customAlert("Enter Contact Number");
    }
    else if(!validateNumber(data.contact_number) || data.contact_number.length != 10){
        customAlert("Enter Correct Contact Number");
    }
    else if(data.e_code == ''){
        customAlert("Enter Employee Code");
    }
    else if(data.password == ''){
        customAlert("Enter Password");
    }
    else if(!(data.password.length == 6)){
        customAlert("Password must be 6 characters long");
    }
    else if(data.d_code == ''){
        customAlert("Select Department");
    }
    else{
        $.ajaxSetup({
            beforeSend: function(xhr, settings) {
                xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
            }
        });
        $.ajax({  
            type: "POST",  
            url: "/sign-up/",
            data: data,  
            dataType: "json",
            success: function(response){
                if(response.e_message == ''){
                    location.href = "/thanks/";
                }
                else{
                    customAlert(response.e_message);
                }
            }
        }); 
    }
};

function signin(){
    var data = {
        'e_code': $("#e_code").val(),
        'password': $("#password").val()
    }

    if(data.e_code == ''){
        customAlert("Enter Employee Code");
    }
    else if(data.password == ''){
        customAlert("Enter Password");
    }
    else if(!(data.password.length == 6)){
        customAlert("Password must be 6 characters long");
    }
    else{
        $.ajaxSetup({
            beforeSend: function(xhr, settings) {
                xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
            }
        });
        $.ajax({  
            type: "POST",  
            url: "/sign-in/",
            data: data,  
            dataType: "json",
            success: function(response){
                if(response.error == ''){
                    location.href = "/thanks/";
                }
                else{
                    customAlert(response.error);
                }
            }
        });     
    }
}