import 'package:practic_robots/bots.dart';

final botBenito1 = Benito(['nashe',"falopa",'droga',"dea"]);
final BotAdvertising1 = BotAdvertising("https://www.linkedin.com/in/juan-caceffo/", "linkedin", "hola unete a mi comunidad de linkdin.");
final botData = DataBot();

class Pdpwitter{
  List<Tweet>? allTweets = <Tweet>[];
  List botList = [botBenito1,BotAdvertising1,botData];

  List<Tweet> get getAllTweets => allTweets!;
  
  void publicateATweet(String message,String userName){
    cantNotSurpassFiveteenWords(message);
    allTweets!.add(Tweet(userName,message));
    botsTakeAction();
  }
  void botsTakeAction(){
    for (var bot in botList){
      bot.takeAccions(allTweets!.last);
    }
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
  List<Tweet>? answers = <Tweet>[];

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