var toPigLatin = function(word) {
  var consonantSequence = '';
  var initialVowelIndex;
  var wordInPigLatin = '';
  var letters = word.split('');

  word = word.toLowerCase()

  var findStartsVowel = /^[aeiou][a-z]*$/;
  var firstVowelIsU = /[^q]u/;
  var findVowel = /[aeioy]|(?:[^q]u)/;
  var indexFirstVowel;

  if(findStartsVowel.test(word)) {
    wordInPigLatin = word + 'ay';
  } else if (firstVowelIsU.test(word)) {
    indexFirstVowel = findVowel.exec(word).index;
    wordInPigLatin = word.substr((indexFirstVowel+1),word.length) + word.substr(0,(indexFirstVowel+1)) + 'ay'; 
  } else {
    indexFirstVowel = findVowel.exec(word).index;
    wordInPigLatin = word.substr(indexFirstVowel,word.length) + word.substr(0,indexFirstVowel) + 'ay';
  }

  return wordInPigLatin;
};

var pigLatinSentence = function(sentence) {
  var initialWords = sentence.split(' ');
  var pigLatinWords = [];

  initialWords.forEach(function (word) {
    pigLatinWords.push(toPigLatin(word));
  });

  var unformatted = pigLatinWords.join(" ");
  return unformatted.charAt(0).toUpperCase() + unformatted.substr(1);
};

$(document).ready(function() {
  $("form#pig-latin").submit(function(event) {
    var sentence = $("input#sentence").val();
    var result = pigLatinSentence(sentence);

    $(".pigLatinSentence").text(result);
    

    $("#result").show();
    event.preventDefault();
  });
});
