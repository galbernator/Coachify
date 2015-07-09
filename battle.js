function() {
  var text = prompt("Please enter a sentence");
  var letters = text.slice('');
  var count = 0
  for (var i = 0; i < letters.length; i += 1) {
    if (letters[i] === "a") {
      count += 1;
    }
  }
  alert(count);
};
