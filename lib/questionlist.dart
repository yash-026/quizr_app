class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() { 
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Who constructed the Versailles mansion?",
    [
      Answer("Julius Caesar", false),
      Answer("Genghis Khan", false),
      Answer("Louis XIV", true),
      Answer("Sigvaldi", false),
    ],
  ));

  list.add(Question(
    "Which ancient civilization was responsible for the construction of the Great Pyramid of Giza?",
    [
      Answer("Ancient Greece", false),
      Answer("Ancient Rome", false),
      Answer("Ancient Egypt", true),
      Answer("Ancient Mesopotamia", false),
    ],
  ));

  list.add(Question(
    "The Renaissance, a period of great cultural and intellectual growth, originated in which country?",
    [
      Answer("Italy", true),
      Answer("France", false),
      Answer("Spain", false),
      Answer("England", false),
    ],
  ));

  list.add(Question(
    "The Industrial Revolution began in which country?",
    [
      Answer("Germany", false),
      Answer("United States", false),
      Answer("England", true),
      Answer("Japan", false),
    ],
  ));

  list.add(Question(
    "Who was the leader of the Soviet Union during World War II?",
    [
      Answer("Vladimir Lenin", false),
      Answer("Nikita Khrushchev", false),
      Answer("Joseph Stalin", true),
      Answer("Mikhail Gorbachev", false),
    ],
  ));

  list.add(Question(
    "Who was the first President of the United States?",
    [
      Answer("Thomas Jefferson", false),
      Answer("George Washington", true),
      Answer("John Adams", false),
      Answer("James Madison", false),
    ],
  ));

  list.add(Question(
    "The Treaty of Versailles, signed in 1919, officially ended which war?",
    [
      Answer("World War I", true),
      Answer("World War II", false),
      Answer("Korean War", false),
      Answer("Cold War", false),
    ],
  ));

  list.add(Question(
    "Who won the Battle of Sekigahara?",
    [
      Answer("Miyamoto Musashi", false),
      Answer("Oda Nobunaga", false),
      Answer("Toyotomi Hideyoshi", false),
      Answer("Tokugawa Ieyasu", true),
    ],
  ));

  list.add(Question(
    "Who was the famous Viking leader known for discovering and settling Greenland?",
    [
      Answer("Ragnar Lothbrok", false),
      Answer("Erik the Red", true),
      Answer("Leif Erikson", false),
      Answer("Thorfinn Karlsefni", false),
    ],
  ));

  list.add(Question(
    "Which event marked the end of the samurai era in Japan?",
    [
      Answer("Battle of Sekigahara", false),
      Answer("Sengoku Period", false),
      Answer("Heian Period", false),
      Answer("Meiji Restoration", true),
    ],
  ));

  return list;
}