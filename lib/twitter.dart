class Pdpwitter{
  List<Tweet>? allTwitts = <Tweet>[];

  void publicateATweet(String message,String userName){
    cantNotSurpassFiveteenWords(message);
    allTwitts!.add(Tweet(userName,message));
  }
  void replyTweet(Tweet tweet,String message,String userName){
    cantNotSurpassFiveteenWords(message);
    tweet.addAnswer(Tweet(userName,message));
  }
  //validations
  void cantNotSurpassFiveteenWords(String message){
    if(message.split(' ').length > 15){
      throw Exception("su tweet supero el limite de palabras");
    }
  }
}
var twitter = Pdpwitter();

class Tweet{
  String? userName;
  String? message;
  List<Tweet>? answers;

  Tweet(this.userName,this.message);

  String get getUserName => userName!;
  String get getMessage => message!;
  List<Tweet> get getAnswers => answers!;

  //get all the answers in a list of strings
  List<String> messagesAnswers() => answers!.map((tweet) => tweet.getMessage).toList();
  bool messageContains(word) => message!.contains(word);
  void addAnswer(Tweet answer){
    answers!.add(answer);
  }
}