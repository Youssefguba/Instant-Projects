import 'test_twitter_model.dart';

void main() {
  final tweet = TweetModel.fromJson(map);
  print(tweet.includes.users[0].username);

  tweet.data[0].text;

  final include = Includes.fromJson(map['includes']);
  print(include.users[0].username);

}
