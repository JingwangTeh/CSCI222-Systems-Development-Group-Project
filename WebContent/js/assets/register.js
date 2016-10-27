// JavaScript Validation For Registration Page

$('document').ready(function()
{         
     // name validation
      var nameregex = /^[a-zA-Z ]+$/;
     
     $.validator.addMethod("validname", function( value, element ) {
         return this.optional( element ) || nameregex.test( value );
     }); 
     
     // valid email pattern
     var eregex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
     
     $.validator.addMethod("validemail", function( value, element ) {
         return this.optional( element ) || eregex.test( value );
     });
     
     $("#register-form").validate({
          
      rules:
      {
        name: {
          required: true,
          validname: true,
          minlength: 4
        },
        email: {
          required: true,
          validemail: true
        },
        password: {
          required: true,
          minlength: 8,
          maxlength: 15
        },
        cpassword: {
          required: true,
          equalTo: '#password'
        },
       },
       messages:
       {
        name: {
          required: "Please Enter User Name",
          validname: "Name must contain only alphabets and space",
          minlength: "Your Name is Too Short"
            },
          email: {
            required: "Please Enter Email Address",
            validemail: "Enter Valid Email Address"
             },
        password:{
          required: "Please Enter Password",
          minlength: "Password at least have 8 characters"
          },
        cpassword:{
          required: "Please Retype your Password",
          equalTo: "Password Did not Match !"
          }
       },
       errorPlacement : function(error, element) {
        $(element).closest('.form-group').find('.help-block').html(error.html());
       },
       highlight : function(element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
       },
       unhighlight: function(element, errorClass, validClass) {
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        $(element).closest('.form-group').find('.help-block').html('');
       },
       
          submitHandler: function(form){
          
          alert('submitted');
          form.submit();
          //var url = $('#register-form').attr('action');
          //location.href=url;
          
        }
        
        /*submitHandler: function() 
                 { 
                    alert("Submitted!");
                  $("#register-form").resetForm(); 
                 }*/
       
       }); 
       
       $("#admin-add-user-form").validate({
          
      rules:
      {
        name: {
          required: true,
          validname: true,
          minlength: 4
        },
        email: {
          required: true,
          validemail: true
        },
        password: {
          required: true,
          minlength: 8,
          maxlength: 15
        },
        cpassword: {
          required: true,
          equalTo: '#password'
        },
       },
       messages:
       {
        name: {
          required: "Please Enter User Name",
          validname: "Name must contain only alphabets and space",
          minlength: "Your Name is Too Short"
            },
          email: {
            required: "Please Enter Email Address",
            validemail: "Enter Valid Email Address"
             },
        password:{
          required: "Please Enter Password",
          minlength: "Password at least have 8 characters"
          },
        cpassword:{
          required: "Please Retype your Password",
          equalTo: "Password Did not Match !"
          }
       },
       errorPlacement : function(error, element) {
        $(element).closest('.form-group').find('.help-block').html(error.html());
       },
       highlight : function(element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
       },
       unhighlight: function(element, errorClass, validClass) {
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        $(element).closest('.form-group').find('.help-block').html('');
       },
       
          submitHandler: function(form){
          
          alert('submitted');
          form.submit();
          //var url = $('#register-form').attr('action');
          //location.href=url;
          
        }
        
        /*submitHandler: function() 
                 { 
                    alert("Submitted!");
                  $("#register-form").resetForm(); 
                 }*/
       
       }); 
       
       /*function submitForm(){
       
         
         /*$('#message').slideDown(200, function(){
           
           $('#message').delay(3000).slideUp(100);
           $("#register-form")[0].reset();
           $(element).closest('.form-group').find("error").removeClass("has-success");
            
         });
         
         alert('form submitted...');
         $("#register-form").resetForm();
            
       }*/

      $("#login-form").validate({
          
      rules:
      {
        email: {
          required: true,
          validemail: true
        },
        login_password: {
          required: true,
          minlength: 8,
          maxlength: 15
        }
       },
       messages:
       {
        email: {
          required: "Please Enter Email Adress",
          validemail: "Email is not in a correct format",
            },
        login_password:{
          required: "Please Enter Password",
          minlength: "Password at least have 8 characters"
          }
       },
       errorPlacement : function(error, element) {
        $(element).closest('.form-group').find('.help-block').html(error.html());
       },
       highlight : function(element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
       },
       unhighlight: function(element, errorClass, validClass) {
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        $(element).closest('.form-group').find('.help-block').html('');
       },
       
          submitHandler: function(form){
          
          alert('logged in');
          form.submit();
          //var url = $('#register-form').attr('action');
          //location.href=url;
          
        }
        
        /*submitHandler: function() 
                 { 
                    alert("Submitted!");
                  $("#register-form").resetForm(); 
                 }*/
       
       }); 
       
       
       /*function submitForm(){
       
         
         /*$('#message').slideDown(200, function(){
           
           $('#message').delay(3000).slideUp(100);
           $("#register-form")[0].reset();
           $(element).closest('.form-group').find("error").removeClass("has-success");
            
         });
         
         alert('form submitted...');
         $("#register-form").resetForm();
            
       }*/

       $("#add-post-form").validate({
          
      rules:
      {
        /*titleInput: {
          required: true
        },
        detail_input: {
          required: true
        },
        des_input: {
          required: true
        },
        product_input: {
          required: true
        },
        component_input: {
          required: true
        }*/
        bug_op_sys: {
          required: true
        },
        cc: {
          required: true
        },
        bug_classification: {
          required: true
        },
        bug_product: {
          required: true
        },
        bug_component: {
          required: true
        }
       },
       messages:
       {
        bug_op_sys: {
          required: "Please enter the title"
        },
        cc: {
          required: "Please enter the cc"
        },
        bug_classification: {
          required: "Please enter the description"
        },
        bug_product: {
          required: "Please enter the product"
        },
        bug_component: {
          required: "Pleae enter the component"
        }
        /*titleInput: {
          required: "Please Enter The Title"
            },
        detail_input: {
          required: "Please Enter The Details"
        },
        des_input: {
          reuqired: "Pleas Enter the Description"
        },
        product_input: {
          required: "Please Enter The Product"

        },
        component_input: {
          required: "Please Enter The Component"
        }*/
       },
       errorPlacement : function(error, element) {
        $(element).closest('.form-group').find('.help-block').html(error.html());
       },
       highlight : function(element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
       },
       unhighlight: function(element, errorClass, validClass) {
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        $(element).closest('.form-group').find('.help-block').html('');
       },
       
          submitHandler: function(form){
          
          alert('Posted');
          form.submit();
          //var url = $('#register-form').attr('action');
          //location.href=url;
          
        }
        
        /*submitHandler: function() 
                 { 
                    alert("Submitted!");
                  $("#register-form").resetForm(); 
                 }*/
       
       }); 
       
       
       /*function submitForm(){
       
         
         /*$('#message').slideDown(200, function(){
           
           $('#message').delay(3000).slideUp(100);
           $("#register-form")[0].reset();
           $(element).closest('.form-group').find("error").removeClass("has-success");
            
         });
         
         alert('form submitted...');
         $("#register-form").resetForm();
            
       }*/

      $("#edit-bug-form").validate({
          
      rules:
      {
        title_input: {
          required: true
        },
        detail_input: {
          required: true
        },
        des_input: {
          required: true
        },
        product_input: {
          required: true
        },
        component_input: {
          required: true
        }
       },
       messages:
       {
        title_input: {
          required: "Please Enter The Title"
            },
        detail_input: {
          required: "Please Enter The Details"
        },
        des_input: {
          required: "Please Enter The Description"
        },
        product_input: {
          required: "Please Enter The Product"

        },
        component_input: {
          required: "Please Enter The Component"
        }
       },
       errorPlacement : function(error, element) {
        $(element).closest('.form-group').find('.help-block').html(error.html());
       },
       highlight : function(element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
       },
       unhighlight: function(element, errorClass, validClass) {
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        $(element).closest('.form-group').find('.help-block').html('');
       },
       
          submitHandler: function(form){
          
          alert('Changeds');
          form.submit();
          //var url = $('#register-form').attr('action');
          //location.href=url;
          
        }
        
        /*submitHandler: function() 
                 { 
                    alert("Submitted!");
                  $("#register-form").resetForm(); 
                 }*/
       
       }); 
       
       
       /*function submitForm(){
       
         
         /*$('#message').slideDown(200, function(){
           
           $('#message').delay(3000).slideUp(100);
           $("#register-form")[0].reset();
           $(element).closest('.form-group').find("error").removeClass("has-success");
            
         });
         
         alert('form submitted...');
         $("#register-form").resetForm();
            
       }*/
});