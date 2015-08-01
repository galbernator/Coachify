$(document).on('ready page:load', function(event) {

  console.log("Observations.js!!!")

  var location
  var subject
  var eval

  var locationButton = $('.location-button')
  var subjectButton = $('.subject-button')
  var employeeButton = $('#employee-button')
  var evaluationButton = $('.eval-button')

  //Dispable the default action when selecting an employee for an observation
  locationButton.click(function(e){
    e.preventDefault();
    location = $(this).attr('id')
    $('#location-id').val(location);
  });

  subjectButton.click(function(e){
    e.preventDefault();
    subject = $(this).attr('id')
    $('#subject-id').val(subject);
    $(this).addClass('selected-subject');
  });

  employeeButton.click(function(e){
    e.preventDefault();
    employee = $('select').find('option:selected').attr('id')
    $('#employee-id').val(employee);
    $(this).addClass('selected-subject');
  });


  evaluationButton.click(function(e){
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

  $('#employee-select').hide();
  $('#evaluation-select').hide();
  $('#continue-select').hide();

  $('#location-select').click(function(e){
    e.preventDefault();
    $('#store-select').addClass('animated bounceOutUp').hide();
    $('#employee-select').show().addClass('animated bounceInUp');
  })

  $('#employee-button').click(function(e){
    e.preventDefault();
    $('#employee-select').addClass('animated bounceOutUp').hide();
    $('#evaluation-select').show().addClass('animated bounceInUp');
  })

  $('#subject-select').click(function(e){
    e.preventDefault();
    $('#employee-select').addClass('animated bounceOutUp').hide();
    $('#evaluation-select').show().addClass('animated bounceInUp');
  })

  $('#evaluation-select').click(function(){
    $('#evaluation-select').addClass('animated bounceOutUp').hide();
    $('#continue-select').show().addClass('animated bounceInUp');
  })

});
