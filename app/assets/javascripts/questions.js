$(document).ready(function() {

  //get the value of the dropdown menu of question type
    var sel = $('#question_kind');
    var kindValue = $("#question_kind option:selected").text();

    var getCurrentValue = function(){
        kindValue = $("#question_kind option:selected").text();
    }

    $('#question_kind').change(function(){
      getCurrentValue();
      $('.nested-fields').slideUp();
      checkAndShowAnswerOptions();
    });

var checkAndShowAnswerOptions = function() {
    if (kindValue === "True or False") {
      //show True and False answer options with an N/A option
      $('.nested-fields').slideDown();
      $('#question_answers_attributes_0_answer').val('True');
      $('#question_answers_attributes_1_answer').val('False');
      $('.remove_fields').addClass('hidden')
    } else if (kindValue === "Scale") {
      //show values 1 through 10 options with an N/A option
    } else if (kindValue === "Grade") {
      //show A - F grade scale options with an N/A option
    } else if (kindValue === "Multiple Choice") {
      //show 4 answer option boxes to start with and an N/A option
    } else if (kindValue === "Multiple Answer") {
      //show 5 answer option boxes to start with and an N/A option
    } else if (kindValue === "Yes or No") {
      //show Yes and No options with an N/A option
      $('.nested-fields').slideDown();
      $('#question_answers_attributes_0_answer').val('Yes');
      $('#question_answers_attributes_1_answer').val('No');
    } else if (kindValue === "Other") {
      //show 2 blank answer options
    }
  };






  // end of documnet on ready
});
