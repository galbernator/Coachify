$(document).ready(function() {

  var subject
  var eval

  $('.user-button').click(function(e){
    e.preventDefault();
    $(".user-button").removeClass('selected-user')
    subject = $(".user-button").attr('id')
    $('#subject-id').val(subject);
    console.log(subject);
    $(this).addClass('selected-user');
  })

  $('.eval-button').click(function(e){
    e.preventDefault();
    eval = $(this).attr('id')
    $('#evaluation-id').val(eval)
    console.log(eval);
  });

  var submitSuccess = function(){
    console.log("Should have saved user number " + subject + " and eval number " + eval + "successfully!");
  }

  //
  // $('#start-observation').click(function(){
  //   $.post('/observations', { observation: {subject_id: subject, evaluation_id: eval}}, submitSuccess);
  // })


});
