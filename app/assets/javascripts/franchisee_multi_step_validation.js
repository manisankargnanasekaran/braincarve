$(document).ready(function(){
    $('#submitBtn').hide();
  })




// Script for multistep form - start


var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
   //document.getElementById("nextBtn").innerHTML = "Submit";
    $('#nextBtn').hide();
    $('#submitBtn').show();
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()){
    sweetAlert("Please fill all the * Fields");
    return false; 
  }
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByClassName("mandatory");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}



// Script for multistep form - end 





// Script for Rails normal UI Form - start



  $(document).ready(function () {
     $('#royalty_to').hide()
  });

  $('#franchisee_parent').change(function(){
  var parent = $(this).val()
    if (parent == "BrainCarve"){
      //alert(parent);
      $('#royalty_to').hide()
  } else {
  //alert("no");
    $('#royalty_to').show()
  }

});
  //alert(franchisee);






 
  
// $('#franchisee_parent').on("change",function(){

//   var franchisee_type = $('#franchisee_type').val()
//    var franchisee_parent = $('#franchisee_parent').val()

//  $.ajax({
//         type: "GET",
//         url: "/franchisees/franchisee_level?franchisee_parent="+franchisee_parent + "&franchisee_type=" +franchisee_type,

//       success: function (data) {
//         //alert(data.message);
//        count = data.enable
//        pid1 = data.id1
//        pid2 = data.id2
//        pid3 = data.id3
//       /*   alert(pid1);
//           alert(pid2);
//           alert(pid3);*/
//          //alert(count);
//            if (count == 1){
//             $('.royalty1').attr('disabled',true);
//             $('.royalty2').attr('disabled',true);
//             $('.royalty3').attr('disabled',true);
//            }
//           else if (count == 2) {
//             $('.royalty1').attr('disabled',false);
//             $('.royalty2').attr('disabled',true);
//             $('.royalty3').attr('disabled',true);
//             $('#nf_royalty').val(pid1);

//           }
//           else if (count == 3){
//             $('.royalty1').attr('disabled',true);
//             $('.royalty2').attr('disabled',false);
//             $('.royalty3').attr('disabled',true);
//             $('#mf_royalty').val(pid1);
//           }
//            else if (count == 4){
//             $('.royalty1').attr('disabled',false);
//             $('.royalty2').attr('disabled',false);
//             $('.royalty3').attr('disabled',true);
//             $('#nf_royalty').val(pid2);
//             $('#mf_royalty').val(pid1);
//           }
//           else if (count == 5){
//             $('.royalty1').attr('disabled',true);
//             $('.royalty2').attr('disabled',true);
//             $('.royalty3').attr('disabled',false);
//             $('#df_royalty').val(pid1);

//           }
//           else if (count == 6){
//             $('.royalty1').attr('disabled',true);
//             $('.royalty2').attr('disabled',false);
//             $('.royalty3').attr('disabled',false);
//             $('#mf_royalty').val(pid2);
//             $('#df_royalty').val(pid1);

//           }
//           else if (count == 7){
//             $('.royalty1').attr('disabled',false);
//             $('.royalty2').attr('disabled',false);
//             $('.royalty3').attr('disabled',false);
//             $('#nf_royalty').val(pid3);
//             $('#mf_royalty').val(pid2);
//             $('#df_royalty').val(pid1);
//           }
//       }

//   //$.get( "/franchisees/franchisee_level?franchisee_parent="+franchisee_parent + "&franchisee_type=" +franchisee_type,);

//   /* success: function(data) { 
//         //$('#usersList').append(data.users);
//     }*/
//            // "/franchisees/get_type?franchisee_type_id="+ id+"&&id="+franchisee_id,
//          });
// });



$(".pin").on('change', function(){
    var pattern = new RegExp(/^[1-9][0-9]{5}$/);     
        if(pattern.test($(".pin").val())){
            $("#nextBtn").prop('disabled', false)
            $("#pincode_error").hide();
        }
        else
          {
            $("#nextBtn").prop('disabled', true)
            $("#pincode_error").html("Invalid");
            $("#pincode_error").show();
        } 
});


$(".amount").on('change keyup paste', function(){
    var pattern = new RegExp(/(?:^\d{1,3}(?:\.?\d{3})*(?:,\d{2})?$)|(?:^\d{1,3}(?:,?\d{3})*(?:\.\d{2})?$)/);     
        if(pattern.test($(".amount").val())){
            $("#nextBtn").prop('disabled', false)
            $("#amount_error").hide();
        }
        else
          {
            $("#nextBtn").prop('disabled', true)
            $("#amount_error").html("Invalid");
            $("#amount_error").show();
        } 
});

$(".gst").on('change keyup paste', function(){
    var pattern = new RegExp(/^[+-]?\d+(\.\d+)?$/);     
        if(pattern.test($(".gst").val())){
            $("#nextBtn").prop('disabled', false)
            $("#gst_error").hide();
        }
        else
          {
            $("#nextBtn").prop('disabled', true)
            $("#gst_error").html("Invalid");
            $("#gst_error").show();
        } 
});

$(".advance_amount").on('change keyup paste', function(){
    var pattern = new RegExp(/(?:^\d{1,3}(?:\.?\d{3})*(?:,\d{2})?$)|(?:^\d{1,3}(?:,?\d{3})*(?:\.\d{2})?$)/);     
        if(pattern.test($(".advance_amount").val())){
            $("#nextBtn").prop('disabled', false)
            $("#advance_amount_error").hide();
        }
        else
          {
            $("#nextBtn").prop('disabled', true)
            $("#advance_amount_error").html("Invalid");
            $("#advance_amount_error").show();
        } 
});

$(".student_fee").on('change keyup paste', function(){
    var pattern = new RegExp(/(?:^\d{1,3}(?:\.?\d{3})*(?:,\d{2})?$)|(?:^\d{1,3}(?:,?\d{3})*(?:\.\d{2})?$)/);     
        if(pattern.test($(".student_fee").val())){
            $("#nextBtn").prop('disabled', false)
            $("#student_fee_error").hide();
        }
        else
          {
            $("#nextBtn").prop('disabled', true)
            $("#student_fee_error").html("Invalid");
            $("#student_fee_error").show();
        } 
});


$(".contact_no").on('change keyup paste', function(){
    var pattern = new RegExp(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/);     
        if(pattern.test($(".contact_no").val())){
            $("#nextBtn").prop('disabled', false)
            $("#contact_no_error").hide();
        }
        else
          {
            $("#nextBtn").prop('disabled', true)
            $("#contact_no_error").html("Invalid");
            $("#contact_no_error").show();
        } 
});

$(".experience").on('change keyup paste', function(){
    var pattern = new RegExp(/^\d+$/);  
    if (($(".experience").val()).length > 0) {   
        if(pattern.test($(".experience").val())){
            $("#nextBtn").prop('disabled', false)
            $("#experience_error").hide();
        }
        else
          {
            $("#nextBtn").prop('disabled', true)
            $("#experience_error").html("Invalid");
            $("#experience_error").show();
        }
    } 
    else{
        $("#nextBtn").prop('disabled', false)
        $("#experience_error").hide();
    }
});


$(".first_name").on('change keyup paste', function(){
   //var pattern = new RegExp(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/);     
        if(($(".first_name").val()).length >= 3){
            $("#nextBtn").prop('disabled', false)
            $("#first_name_error").hide();
        }
        else
          {
            $("#nextBtn").prop('disabled', true)
            $("#first_name_error").html("Min 3 char required");
            $("#first_name_error").show();
        } 
});


$(".last_name").on('change keyup paste', function(){
   //var pattern = new RegExp(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/);     
        if(($(".last_name").val()).length >= 3){
            $("#nextBtn").prop('disabled', false)
            $("#last_name_error").hide();
        }
        else
          {
            $("#nextBtn").prop('disabled', true)
            $("#last_name_error").html("Min 3 char required");
            $("#last_name_error").show();
        } 
});


$('#select').selectize({
    create: true,
    sortField: 'text'
});





  $(document).ready(function () {
    $("#fold").change(function () {
      var id=($(this).val());

      $.ajax({
        type: "GET",
         url: "/franchisees/get_type?franchisee_type_id=" + id,
      })
    });
  });



$(document).ready(function() {
  $(".remove_label")[0].style.display="none";
  $(".remove_button")[0].style.display="none";
  $('#birthdate').flatpickr({
       maxDate: 'today',  
  });
});

// $(document).ready(function() {
//   $('.installment_date').flatpickr();
// });

$(document).ready(function() {
  $('#agreement_date').flatpickr();
});

$(document).ready(function() {
  $('#renewal_date_input').flatpickr();
});




  $(document).ready(function () {
    populateCountries("country", "state");
    //populateCountries("country2");
  });





  $(document).on('nested:fieldRemoved', function(e){
  // this field was just inserted into your form
  var field = e.field; 
  var link = $(e.currentTarget.activeElement);
  $('#owner_first_name', e.field).removeClass('mandatory');
  $('#owner_last_name', e.field).removeClass('mandatory');
  $('#birthdate', e.field).removeClass('mandatory');
  $('#franchisee_owner_contact_no', e.field).removeClass('mandatory');
  $('#id_proof', e.field).removeClass('mandatory');
  $('#id_proof_number', e.field).removeClass('mandatory');
  $('#owner_address', e.field).removeClass('mandatory');
  $('#franchisee_owner_state', e.field).removeClass('mandatory');
  $('#franchisee_owner_country', e.field).removeClass('mandatory');
  $('#installment_amount', e.field).removeClass('mandatory');
  $('#installment_date', e.field).removeClass('mandatory');
});






// for automatic calculation of renewal date 

  $('#duration_in_month').on('change', function () {
  agreement_date = $('#agreement_date').val();
  duration = $(this).val();
  renewal_date = getRenewal(agreement_date, duration);
  $('#renewal_date_input').val(renewal_date);
});
  $('#agreement_date').on('change', function () {
  agreement_date = $(this).val();
  duration = $('#duration_in_month').val();
  renewal_date = getRenewal(agreement_date, duration);
  $('#renewal_date_input').val(renewal_date);
});
function getRenewal(agreement_date, duration) {
    var startDate = new Date(agreement_date);
    var endDate = startDate.setMonth(startDate.getMonth() + parseInt(duration));   
    var output_endDate = new Date(endDate);
    return output_endDate.toISOString().split('T')[0];
}





// for automatic calculation of Total amount, GST and Balance amount 



  $('#gst').on('change', function () {
    amount = $("#amount").val();
    gst = $(this).val();
    advance = $("#advance_amount_gst").val();
    total = getTotal(amount, gst);
    $('#total_amount_gst').val(total);
     balance = getBalance(total, advance);
    $('#balance_amount_gst').val(balance);
    // $('#due_balance').val(balance);
    // $('#actual_balance').val(balance);
  });
  $('#amount').on('change', function () {
    amount = $(this).val();
    gst = $("#gst").val();
    advance = $("#advance_amount_gst").val();
    total = getTotal(amount, gst);
    $('#total_amount_gst').val(total);
    balance = getBalance(total, advance);
    $('#balance_amount_gst').val(balance);
    // $('#due_balance').val(balance);
    // $('#actual_balance').val(balance);
  });
  function getTotal(amount, gst) {
    var gstAmount = (gst / 100) * amount;
    var total = parseFloat(amount) + parseFloat(gstAmount);
    return total;
  }

  $('#advance_amount_gst').on('change', function () {
    total = $("#total_amount_gst").val();
    advance = $(this).val();
    balance = getBalance(total, advance);
    $('#balance_amount_gst').val(balance);
    // $('#due_balance').val(balance);
    // $('#actual_balance').val(balance);
  });
  /*$('#total_amount_gst').on('change', function () {
  total = $(this).val(); 
  advance = $("#advance_amount_gst").val();
  balance = getBalance(total, advance);
  $('#balance_amount_gst').val(balance);
});*/
function getBalance(total, advance) {
    var balance = total - advance;
    return parseFloat(balance);
}





$('.select').selectize({
    sortField: 'text'
});
$('.datepicker').datepicker();




    // $('#no_of_owners').on('change', function () {
    //     var count = $(this).val();
    //     if (parseInt(count)>1) {
    //       $("#ownerBlock").prop('disabled', false);
    //       document.getElementById( 'ownerBlock' ).style.display = 'block';
    //     } else {
    //       $("#ownerBlock").prop('disabled', true);
    //       document.getElementById( 'ownerBlock' ).style.display = 'none';
    //     }
    //   });

