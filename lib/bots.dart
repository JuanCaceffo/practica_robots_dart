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

  Benito(this.blackListWords);
  
  bool analyzeTweet(Tweet tweet) => blackListWords!.any((word) => tweet.messageContains(word));
  void reportUser(Tweet tweet){
    if (analyzeTweet(tweet)){
      police.registerSuspect(tweet.getUserName, tweet.getMessage);
    }
  }
}
class BotPublisher{
  String? wordMatch;
  String? messageAdvertising;
  String? linkAdvertising;
  String? userName = "botPublisher";

  BotPublisher(this.linkAdvertising,this.wordMatch,this.messageAdvertising);

  bool analyzeTweet(Tweet tweet) => tweet.messageContains(wordMatch);

  void replyUserTweet(Tweet tweet){
    final personalizedMessageAdvertising = "@${tweet.getUserName} : ${messageAdvertising!}";
    
    if (analyzeTweet(tweet)){
      twitter.replyTweet(tweet, personalizedMessageAdvertising, userName!);
    }
  }  

}
