$(document).ready(function() {

  $('.answer-button').click(function(){
    var answer = $(this).html();
    var questionId = $(this).parent().attr('id');
    $(this).fadeTo(100, 0.1).fadeTo(100, 1.0);
    console.log(answer);
    console.log(questionId);
  });







});
