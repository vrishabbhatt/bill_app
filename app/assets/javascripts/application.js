// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require cocoon
//= require_tree .

$(document).on('ready page:load', function () {

	$('#split_form_simple').click(function(){
		var total = $('#total').val();
  		var user_no = $('#users').val();
  		var individual_user_amount = total/user_no;
  		$('#sample_form_result').removeClass('hidden');
  		$('#default_individual_amount').val(individual_user_amount);
  		$('#submit-button').removeClass('hidden');
  		$('#complex-form-generation').empty();
  		$('#complex-form-generation').addClass('hidden');
  		$('#complex-form-result-button').addClass('hidden');

  		console.log(individual_user_amount);
	});
	$('#split_form_complex').click(function(){
		console.log("complex form clicked");
		var total = $('#total').val();
  		var user_no = $('#users').val();
  		var individual_user_amount = total/user_no;
  		$('#sample_form_result').removeClass('hidden');
  		$('#default_individual_amount').val(individual_user_amount);
  		$('#submit-button').addClass('hidden');
  		$('#complex-form-generation').empty();
  		$('#complex-form-generation').removeClass('hidden');
  		for(i = 1 ;i<= user_no; i++){

  			var $newdiv = $("<div/>")   
                 .attr("id", "bill_role"+i)  
                 .addClass("row form-group")   
                 .html("<label class='control-label'>User"+ i +" paid </label>");

  			var input = $('<input>').attr({
  				type: 'text',
  				name: "amount_"+ i,
  				id: "amount_"+ i,
  				class: 'form-control'
  			});
  			
  			input.appendTo($newdiv);
  			$newdiv.appendTo('#complex-form-generation');
			$("#complex-form-generation").append("<br />");
  		}

  		$('#complex-form-result-button').removeClass('hidden');

	});

	$('#complex-form-result-button').click(function(){
		console.log('complex results are to be displayed');
		var user_no = $('#users').val();
  		var individual_user_amount = $('#default_individual_amount').val();
  		var user_amounts = new Array ();
  		var user_amounts_to_pay = new Array ();
  		for(i=1 ; i<= user_no; i++){
  			var user_amount = $('#amount_'+i).val();
  			if(user_amount === "")
  			{ user_amounts.push(0);
  			  user_amounts_to_pay.push(individual_user_amount);		
  			}
  			else
  			{ user_amounts.push(user_amount);
  			  user_amounts_to_pay.push(individual_user_amount - user_amount);	
  			}
  			  
  		}
  		console.log(user_amounts);
  		console.log(user_amounts_to_pay);
  		var $complex_result = $('#complex-form-result');
  		$complex_result.empty();
  		for(i = 0 ; i<user_no ; i++)
  		{
  			var str = new String();
  			var num = i+1;
  			if (user_amounts_to_pay[i] > 0)
  			{
  				str = "User "+ num + " has to pay "  +user_amounts_to_pay[i]; 
  			}
  			else if (user_amounts_to_pay[i] == 0)
  			{
  				str = "User " + num + " has paid his share" ;
  			}
  			else
  			{   var amount = -user_amounts_to_pay[i];
  				str = "User " + num + " has to recieve " + amount; 
  			}

  			var $newdiv = $("<div/>")   
                 .attr("id", "user_amount"+i)  
                 .addClass("row")   
                 .html("<h3>"+str+"</h3>");
  		
            $newdiv.appendTo($complex_result);
  		}
  		$complex_result.removeClass("hidden");	
  		$('#submit-button').removeClass("hidden");
  		var offset = $complex_result.offset();
      	window.scrollTo(offset.left , offset.top);
	});

  $('#bill-split').click(function(){

    $('#bill_default_individual_amount').val(0);
    var total = $('#bill_total').val();
    var user_no = $('#bill_no_of_users').val();
    var individual_user_amount = total/user_no ;
    console.log(individual_user_amount);
    $('#bill_default_individual_amount').val(individual_user_amount);
    $('#bill-simple-result').removeClass('hidden');

  })

});