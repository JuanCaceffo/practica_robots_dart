import 'package:practic_robots/twitter.dart';

class Police{
  Map? usersRegistreds;

  Map get getUsers => usersRegistreds!; 

  void registerSuspect(String userName,String message){
    usersRegistreds![userName] = message;
  }
}
var police = Police();

class Benito{
  List<String>? blackListWords;
  String? userName = "botBenito";

  Benito(this.blackListWords,{this.userName});
  
  bool analyzeTweet(Tweet tweet) => blackListWords!.any((word) => tweet.messageContains(word));
  void takeAccions(Tweet tweet){
    if (analyzeTweet(tweet)){
      police.registerSuspect(tweet.getUserName, tweet.getMessage);
    }
  }
}
class BotAdvertising{
  String? wordMatch;
  String? messageAdvertising;
  String? linkAdvertising;
  String? userName = "BotAdvertising";

  BotAdvertising(this.linkAdvertising,this.wordMatch,this.messageAdvertising,{this.userName});

  bool analyzeTweet(Tweet tweet) => tweet.messageContains(wordMatch);

  void takeAccions(Tweet tweet){
    final personalizedMessageAdvertising = "@${tweet.getUserName} : ${messageAdvertising!} link: ${linkAdvertising}";
    
    if (analyzeTweet(tweet)){
      twitter.replyTweet(tweet, personalizedMessageAdvertising, userName ?? "BotAdvertisingVarNull");
    }
  }  
}
class DataBot{
  List<Tweet>? usersTweets = <Tweet>[];

  List<Tweet> get getUsersTweets => usersTweets!;

  void takeAccions(Tweet tweet){
    usersTweets!.add(tweet);
  }
}
