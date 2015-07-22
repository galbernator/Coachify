$(document).on('ready page:load', function(event) {

  console.log("Observations.js!!!")

  var subject
  var eval

  var employeeButton = $('.subject-button')

  //Dispable the default action when selecting an employee for an observation
  employeeButton.click(function(e){
    e.preventDefault();
    employeeButton.removeClass('selected-subject')
    subject = $(this).attr('id')
    $('#subject-id').val(subject);
    $(this).addClass('selected-subject');
  });


  $('.eval-button').click(function(e){
    e.preventDefault();
    eval = $(this).attr('id')
    $('#evaluation-id').val(eval);
  });

  var submitSuccess = function(){
    console.log("Should have saved user number " + subject + " and eval number " + eval + "successfully!");
  }


  //
  // $('#start-observation').click(function(){
  //   $.post('/observations', { observation: {subject_id: subject, evaluation_id: eval}}, submitSuccess);
  // })

  // Observation Show Page Scripts
  var questionText;

  $('a').click(function() {
    questionText = $(this).attr('data-question-text');
    $('#myModalLabel').html(questionText);
   });


  // get the observations for the current user's company as json (to be able to pass info to JS)
  // save the information in variables to be passed in to the charting functions
  // call the charting functions to display on the screen when "button" is clicked

  $('button[data-dismiss="modal"]').on('hidden.bs.modal', function () {
    $('#breakdown-chart').html("");
    $('#myModalLabel').html("");
  })

  $('#evaluation-select').hide();
  $('#continue-select').hide();

  $('#employee-select').click(function(){
    $('#employee-select').addClass('animated bounceOutUp').hide();
    $('#evaluation-select').show().addClass('animated bounceInUp');
  })

  $('#evaluation-select').click(function(){
    $('#evaluation-select').addClass('animated bounceOutUp').hide();
    $('#continue-select').show().addClass('animated bounceInUp');
  })

});
