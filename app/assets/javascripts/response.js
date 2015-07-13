$(document).ready(function() {


    // this will be the action to close the modal once the survey is completed
    $('close-modal').click(function(){
      var list = $('.answer-list')
      var finishedButton = '<button id="close-modal">Click to Finish</li>'
      list.append(finishedButton);
    });



   var nextQuestion = function () {
       $($questions.get(currentQuestion)).fadeOut(20);
      //increment the current question by one
      currentQuestion = currentQuestion + 1;

      //if there are no more questions do stuff
      if (currentQuestion == totalQuestions) {

        // Button to close the modal window appears that let them know that the observation is complete
        return '<button id="close-modal">Click to Finish</li>';

      } else {

          //otherwise show the next question
          $($questions.get(currentQuestion)).fadeIn(20);
          $($questions.get(currentQuestion)).addClass('animated bounceInUp');

      }
  };

  // store the observation ID that is created upon saving the new observation in a
  // session variable and add that as a data to the container of each question


  var saveAnswer = function(answer, questionId, evalId) {
    var observationId = parseInt($('ul[data-observation]').data()['observation']);
      // The AJAX save request is sent containing the question, evaluation and
      $.post('/evaluations/' + evalId + '/responses', { response: {question_id: questionId, answer_id: answer, observation_id: observationId, evaluation_id: evalId}}, nextQuestion);
  }

  //Store the total number of questions
  var totalQuestions = $('.question-box').size();
  //Set the current question to display to 1
  var currentQuestion = 0;

  //Store the selector in a variable.
  //It is good practice to prefix jQuery selector variables with a $
  $questions = $('.question-box');

  //Hide all the questions
  $questions.hide();

  //Show the first question
  $($questions.get(currentQuestion)).fadeIn();

  //attach a click listener to the HTML element with the id of 'next'
  $('.answer-button').click(function () {
      $(this).addClass('active')
      var answer = $(this).attr('id');
      var questionId = $(this).parent().attr('id');
      var url = $(this).data()['url']
      var evalId = parseInt(url[url.length - 1]);
      $(this).fadeTo(100, 0.1).fadeTo(100, 1.0);
       //bounce up the current question,
       //putting a function inside of bounceOutUp calls that function
       //We then listen for the animation to complete and call to save the answer ,
       //that was bounced up. This is for a smoother transition animation.
       $($questions.get(currentQuestion)).addClass('animated bounceOutUp');
       $($questions.get(currentQuestion)).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', saveAnswer(answer, questionId, evalId))

  });








});
