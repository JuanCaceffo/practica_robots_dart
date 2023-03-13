import "package:practic_robots/bots.dart";
import "package:practic_robots/twitter.dart";
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  test("usuario juan realiza un tweet y dataBot se guarda el tweet, pero los demas bots no hacen nada", (){
    twitter.publicateATweet("vivo like boss toy cocinado jolines en tu flow", "juan");
    expect(botData.getUsersTweets.single.getMessage, twitter.getAllTweets.single.getMessage);
  });
  test("pedro hace un tweet con la palabra linkdin y el bot publicitario le responde con su publicidad", (){
    twitter.publicateATweet("amo linkedin", "pedro");
    expect(twitter.getAllTweets.single.getAnswers.single.getMessage,"@pedro : hola unete a mi comunidad de linkdin. link: https://www.linkedin.com/in/juan-caceffo/");
  });
}