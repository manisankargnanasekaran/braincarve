           $(document.body).on("focusout",".job_card_customer_name",function(){
              if($(".job_card_customer_name").val())
                     {
                          $("#name_error").hide();
                   }
                   else
                   {
                    $("#name_error").html("Please Select or Enter Customer Name");
                   $("#name_error").show();
                   error_email = true;
                   } 
              });
          $(document.body).on("focusout",".job_card_customer_email",function(){
              var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
              if(pattern.test($(".job_card_customer_email").val())){
                $("#email_error").hide();
                   }
                   else
                   {
                    $("#email_error").html("Please fill Correct Email");
                   $("#email_error").show();
                   error_email = true;
                   } 
              });
             $(document.body).on("focusout",".job_card_customer_number",function(){
                var pattern = new RegExp(/^[1-9][0-9]{9}$/);
           
                if(pattern.test($(".job_card_customer_number").val())){
                $("#number_error").hide();
                  
                   }
                   else
                   {
                     $("#number_error").html("Please fill correct Mobile Number");
                   $("#number_error").show();
                   error_mobile = true;
                   } 

              });
             $(document.body).on("focusout",".job_card_customer_pincode",function(){
                var pattern = new RegExp(/^[1-9][0-9]{5}$/);
                  if(pattern.test($(".job_card_customer_pincode").val())){
                  $("#pincode_error").hide();
                    
                     }
                     else
                     {
                       $("#pincode_error").html("Please fill Correct Pincode");
                     $("#pincode_error").show();
                     error_pincode = true;
                     } 
             });
             $(document.body).on("focusout",".job_card_customer_address",function(){
                  if($(".job_card_customer_address").val()){
                  $("#address_error").hide();
                    
                     }
                     else
                     {
                       $("#address_error").html("Please fill Address");
                     $("#address_error").show();
                     error_pincode = true;
                     } 
             });
             $(document.body).on("focusout",".job_card_customer_city",function(){
                  if($(".job_card_customer_city").val()){
                  $("#city_error").hide();
                    
                     }
                     else
                     {
                       $("#city_error").html("Please fill City");
                     $("#city_error").show();
                     error_pincode = true;
                     } 
             });
                 $(document.body).on("focusout",".job_card_vehicle_brand",function(){
                  if($(".job_card_vehicle_brand").val()){
                  $("#brand_error").hide();
                    
                     }
                     else
                     {
                       $("#brand_error").html("Please fill Vehicle Brand Name");
                     $("#brand_error").show();
                     error_pincode = true;
                     } 
             });
                  $(document.body).on("focusout",".job_card_vehicle_name",function(){
                  if($(".job_card_vehicle_name").val()){
                  $("#vname_error").hide();
                    
                     }
                     else
                     {
                       $("#vname_error").html("Please fill Vehicle Name");
                     $("#vname_error").show();
                     error_pincode = true;
                     } 
             });  
                  $(document.body).on("focusout",".job_card_vehicle_model",function(){
                  if($(".job_card_vehicle_model").val()){
                  $("#model_error").hide();
                    
                     }
                     else
                     {
                       $("#model_error").html("Please fill Vehicle Model");
                     $("#model_error").show();
                     error_pincode = true;
                     } 
             });
                $(document.body).on("focusout",".job_card_vehicle_vin",function(){
                  if($(".job_card_vehicle_vin").val()){
                  $("#vin_error").hide();
                    
                     }
                     else
                     {
                       $("#vin_error").html("Please fill Vehicle Vin Number");
                     $("#vin_error").show();
                     error_pincode = true;
                     } 
             });
             $(document.body).on("focusout",".job_card_vehicle_year",function(){
                  if($(".job_card_vehicle_year").val()){
                  $("#year_error").hide();
                    
                     }
                     else
                     {
                       $("#year_error").html("Please fill Vehicle Year");
                     $("#year_error").show();
                     error_pincode = true;
                     } 
             });
              $(document.body).on("focusout",".jc_info_hand",function(){
                  if($(".jc_info_hand").val()){
                  $("#hand_error").hide();
                    
                     }
                     else
                     {
                       $("#hand_error").html("Please fill Handover Person Name");
                     $("#hand_error").show();
                     error_pincode = true;
                     } 
             });
              $(document.body).on("focusout",".jc_info_contact",function(){
                var pattern = new RegExp(/^[1-9][0-9]{9}$/);
           
                if(pattern.test($(".jc_info_contact").val())){
                  $("#contact_error").hide();
                    
                     }
                     else
                     {
                       $("#contact_error").html("Please fill Handover Person Contact Number");
                     $("#contact_error").show();
                     error_pincode = true;
                     } 
             });
                $(document.body).on("select",".jc_info_fuel",function(){
                  alert("");
                  if($(".jc_info_fuel").val() != ""){
                  $("#fuel_error").hide();
                    
                     }
                     else
                     {
                       $("#fuel_error").html("Please Select Fuel Level");
                     $("#fuel_error").show();
                     error_pincode = true;
                     } 
             });
                 $(document.body).on("focusout",".particulars",function(){
                  if($(".particulars").val()){
                  $("#part_error").hide();
                    
                     }
                     else
                     {
                       $("#part_error").html("Please fill Particulars");
                     $("#part_error").show();
                     error_pincode = true;
                     } 
             });
              $(document.body).on("focusout",".description",function(){
                  if($(".description").val()){
                  $("#desc_error").hide();
                    
                     }
                     else
                     {
                       $("#desc_error").html("Please fill Description");
                     $("#desc_error").show();
                     error_pincode = true;
                     } 
             });
    

       // $(document.body).on("hover",".next_vheicle",function(){
       $(document.body).on("keypress",".job_card_customer_pincode",function(){
        var pattern = new RegExp(/^[1-9][0-9]{5}$/);
             if($(".job_card_customer_email").val() == '' || $(".job_card_customer_number").val() == '' || pattern.test($(".job_card_customer_pincode").val())   ) {
              $('.next_vheicle').attr("disabled", true);
            }
            else{
             $('.next_vheicle').attr("disabled", false);
            }
       });
        $(document.body).on("mouseenter",".next_vheicle",function(){
             if($(".job_card_customer_email").val() == '' || $(".job_card_customer_number").val() == '' || $(".job_card_customer_pincode").val() == '' ) {
              $('.next_vheicle').attr("disabled", true);
            }
            else{
             $('.next_vheicle').attr("disabled", false);
            }
       });
 $(document.body).on("keypress",".job_card_vehicle_year",function(){
        if($(".job_card_vehicle_brand").val() == '' || $(".job_card_vehicle_name").val() == '' || $(".job_card_vehicle_model").val() == '' || $(".job_card_vehicle_vin").val() == '' || $(".job_card_vehicle_year").val() == ''){
          $('.jc_next').attr("disabled", true);

        }
        else{
          $('.jc_next').attr("disabled", false);
         $("#service_id").removeClass("disabled");

        }
       });

       $(document.body).on("mouseenter",".jc_next",function(){
        if($(".job_card_vehicle_brand").val() == '' || $(".job_card_vehicle_name").val() == '' || $(".job_card_vehicle_model").val() == '' || $(".job_card_vehicle_vin").val() == '' || $(".job_card_vehicle_year").val() == ''){
          $('.jc_next').attr("disabled", true);

        }
        else{
          $('.jc_next').attr("disabled", false);
         $("#service_id").removeClass("disabled");

        }
       });

 $(document.body).on("mouseenter",".sub",function(){
    if($(".jc_info_km").val() == '' || $(".jc_info_hand").val() == '' || $(".jc_info_km").val() == '' || $(".particular").val() == '' || $(".desc").val() == '') {
          $('.sub').attr("disabled", true);
        }
        else{
          $('.sub').attr("disabled", false);
         $("#service_id").removeClass("disabled");
        }
 });
  $(document.body).on("keypress",".jc_info_km",function(){
    if($(".jc_info_km").val() == '' || $(".jc_info_hand").val() == '' || $(".jc_info_km").val() == '' || $(".particular").val() == '' || $(".desc").val() == '') {
          $('.sub').attr("disabled", true);
        }
        else{
          $('.sub').attr("disabled", false);
         $("#service_id").removeClass("disabled");
        }
 })
// $(document.body).on("mouseenter","#select2-customername-container",function(){
//  if($("#job_card_customer_name").val() == ''){
//   alert("empty");
// }
// else{
//   alert("full");
//  }

// });

$('.customername').select2({
  allowClear: true,
  escapeMarkup: function (markup) { return markup; },
  placeholder: "Customer Name",
  language: { 
    noResults: function () {
      return "<span onclick='new_customer();' onmouseover='' style='color: #4925A1; cursor: pointer;'>New Customer</span>";
    }
  }
});

function new_customer() {
  $('.customername').attr('disabled',true);
  $('.customername').next(".select2-container").hide();
  $('#job_card_customer_name').attr('disabled',false);
  $('#job_card_customer_name').show();
  $(".job_card_customer").val('');
  $(".job_card_customer").attr('readonly', false);
  $(".job_card_vehicle").val('');
  $(".job_card_vehicle").attr('readonly', false);
  $('#registration_number').attr('disabled',true);
  $('#registration_number').next(".select2-container").hide();
  $('#job_card_vehicle_registration_number').attr('disabled',false);
  $('#job_card_vehicle_registration_number').show();
          $('.jc_next').attr("disabled", true);
         $("#service_id").addClass("disabled");
         $("#vehicle_id").addClass("disabled");

}

$('#registration_number').select2({
  allowClear: true,
  escapeMarkup: function (markup) { return markup; },
  placeholder: "Registraion Number",
  language: {
    noResults: function () {
      return "<span onclick='new_vehicle();' onmouseover='' style='color: #4925A1; cursor: pointer;'>New Vehicle</span> ";
    }
  }
});
function new_vehicle() {
  $('#registration_number').attr('disabled',true);
  $('#registration_number').next(".select2-container").hide();
  $('#job_card_vehicle_registration_number').attr('disabled',false);
  $('#job_card_vehicle_registration_number').show();
  $(".job_card_vehicle").attr('readonly', false);
  $(".job_card_vehicle").val("");
}

$('#job_card_service_incharge').select2({
  allowClear: true,
  escapeMarkup: function (markup) { return markup; },
  placeholder: "Service Incharge"
  });
$(document.body).on("click","#add_btn",function(){
        var cls_count = $(".particular_rows").length
        var id = cls_count + 1
        $("#row"+id).addClass("particular_rows");
        $("#row"+id).slideDown('show');
      });
        $(document.body).on("click",".rm_particular",function(){
          
          var id = $(this).attr("id");
          $("#row"+id).slideUp('hide');
        });
      $(document.body).on("change",".customername",function(){
        var customer_id = this.value;
        $.get( "/customer_check?customer_id="+customer_id);
        $.get( "/customer_vehicle_check?customer_id="+customer_id);
        $('.next_vheicle').attr("disabled", false);
        $("#vehicle_id").removeClass("disabled");
        $('.jc_next').attr("disabled", false);
         $("#service_id").removeClass("disabled");
      });
      $(document.body).on("change","#registration_number",function(){
        var customer_vehicle_id = this.value;
        $.get( "/customer_vehicle_check?customer_id="+customer_id
         );
          $('.jc_next').attr("disabled", false);
         $("#service_id").removeClass("disabled");
      });
    $(document.body).on("click",".next_vheicle",function(){
        $("#vehicle_id").addClass("active");
        //$("#vehicle_id").addClass("active");
        $("#customer_id").removeClass("active");

        $("#vehicle").addClass("active");
        $("#vehicle").addClass("in");
        
        $("#customer").removeClass("active");
        $("#customer").removeClass("in");

        $("#vehicle").removeClass("disabled");
      });

    $(document.body).on("click",".jc_next",function(){
        $("#service_id").addClass("active");

        $("#service").addClass("active");
        $("#service").addClass("in");

        $("#customer_id").removeClass("active");
        $("#vehicle_id").removeClass("active");

        $("#customer").removeClass("active");
        $("#vehicle").removeClass("active");
        $("#customer").removeClass("in");
        $("#vehicle").removeClass("in");
        $("#vehicle_id").removeClass("disabled");
    });

  $('#select-all').click(function(event) {   
    if(this.checked) {
        // Iterate each checkbox
        $(':checkbox').each(function() {
            this.checked = true;                        
        });

    }
    else{
        $(':checkbox').each(function() {
            this.checked = false;                        
        });
    }

});
