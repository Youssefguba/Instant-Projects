final Map<String, dynamic> map = {
  "data": [
    {
      "conversation_id": "1304102743196356610",
      "id": "1307025659294674945",
      "possibly_sensitive": false,
      "public_metrics": {
        "retweet_count": 11,
        "reply_count": 2,
        "like_count": 70,
        "quote_count": 1
      },
      "entities": {
        "urls": [
          {
            "start": 74,
            "end": 97,
            "url": "https://t.co/oeF3ZHeKQQ",
            "expanded_url": "https://dev.to/twitterdev/understanding-the-new-tweet-payload-in-the-twitter-api-v2-1fg5",
            "display_url": "dev.to/twitterdev/und…",
            "images": [
              {
                "url": "https://pbs.twimg.com/news_img/1317156296982867969/2uLfv-Bh?format=jpg&name=orig",
                "width": 1128,
                "height": 600
              },
              {
                "url": "https://pbs.twimg.com/news_img/1317156296982867969/2uLfv-Bh?format=jpg&name=150x150",
                "width": 150,
                "height": 150
              }
            ],
            "status": 200,
            "title": "Understanding the new Tweet payload in the Twitter API v2",
            "description": "Twitter recently announced the new Twitter API v2, rebuilt from the ground up to deliver new features...",
            "unwound_url": "https://dev.to/twitterdev/understanding-the-new-tweet-payload-in-the-twitter-api-v2-1fg5"
          }
        ]
      },
      "text": "Here’s an article that highlights the updates in the new Tweet payload v2 https://t.co/oeF3ZHeKQQ",
      "in_reply_to_user_id": "2244994945",
      "created_at": "2020-09-18T18:36:15.000Z",
      "author_id": "2244994945",
      "referenced_tweets": [
        {
          "type": "replied_to",
          "id": "1304102743196356610"
        }
      ],
      "lang": "en",
      "source": "Twitter Web App"
    }
  ],
  "includes": {
    "users": [
      {
        "created_at": "2013-12-14T04:35:55.000Z",
        "profile_image_url": "https://pbs.twimg.com/profile_images/1283786620521652229/lEODkLTh_normal.jpg",
        "entities": {
          "url": {
            "urls": [
              {
                "start": 0,
                "end": 23,
                "url": "https://t.co/3ZX3TNiZCY",
                "expanded_url": "https://developer.twitter.com/en/community",
                "display_url": "developer.twitter.com/en/community"
              }
            ]
          },
          "description": {
            "hashtags": [
              {
                "start": 17,
                "end": 28,
                "tag": "TwitterDev"
              },
              {
                "start": 105,
                "end": 116,
                "tag": "TwitterAPI"
              }
            ]
          }
        },
        "id": "2244994945",
        "verified": true,
        "location": "127.0.0.1",
        "description": "The voice of the #TwitterDev team and your official source for updates, news, and events, related to the #TwitterAPI.",
        "pinned_tweet_id": "1293593516040269825",
        "username": "TwitterDev",
        "public_metrics": {
          "followers_count": 513961,
          "following_count": 2039,
          "tweet_count": 3635,
          "listed_count": 1672
        },
        "name": "Twitter Dev",
        "url": "https://t.co/3ZX3TNiZCY",
        "protected": false
      }
    ],
    "tweets": [
      {
        "conversation_id": "1304102743196356610",
        "id": "1304102743196356610",
        "possibly_sensitive": false,
        "public_metrics": {
          "retweet_count": 31,
          "reply_count": 12,
          "like_count": 104,
          "quote_count": 4
        },
        "entities": {
          "mentions": [
            {
              "start": 146,
              "end": 158,
              "username": "suhemparack"
            }
          ],
          "urls": [
            {
              "start": 237,
              "end": 260,
              "url": "https://t.co/CjneyMpgCq",
              "expanded_url": "https://twitter.com/TwitterDev/status/1304102743196356610/video/1",
              "display_url": "pic.twitter.com/CjneyMpgCq"
            }
          ],
          "hashtags": [
            {
              "start": 8,
              "end": 19,
              "tag": "TwitterAPI"
            }
          ]
        },
        "attachments": {
          "media_keys": [
            "13_1303848070984024065"
          ]
        },
        "text": "The new #TwitterAPI includes some improvements to the Tweet payload. You’re probably wondering — what are the main differences? 🧐\n\nIn this video, @SuhemParack compares the v1.1 Tweet payload with what you’ll find using our v2 endpoints. https://t.co/CjneyMpgCq",
        "created_at": "2020-09-10T17:01:37.000Z",
        "author_id": "2244994945",
        "lang": "en",
        "source": "Twitter Media Studio"
      }
    ]
  }
};


class TweetModel {
  final List<TweetData> data;
  final Includes includes;

  TweetModel({
    required this.data,
    required this.includes,
  });

  factory TweetModel.fromJson(Map<String, dynamic> json) => TweetModel(
    data: List<TweetData>.from(json["data"].map((x) => TweetData.fromJson(x))),
    includes: Includes.fromJson(json["includes"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "includes": includes.toJson(),
  };
}

class TweetData {
  final String conversationId;
  final String id;
  final bool possiblySensitive;
  final DatumPublicMetrics publicMetrics;
  final DatumEntities entities;
  final String text;
  final String inReplyToUserId;
  final DateTime createdAt;
  final String authorId;
  final List<ReferencedTweet> referencedTweets;
  final String lang;
  final String source;

  TweetData({
    required this.conversationId,
    required this.id,
    required this.possiblySensitive,
    required this.publicMetrics,
    required this.entities,
    required this.text,
    required this.inReplyToUserId,
    required this.createdAt,
    required this.authorId,
    required this.referencedTweets,
    required this.lang,
    required this.source,
  });

  factory TweetData.fromJson(Map<String, dynamic> json) => TweetData(
    conversationId: json["conversation_id"],
    id: json["id"],
    possiblySensitive: json["possibly_sensitive"],
    publicMetrics: DatumPublicMetrics.fromJson(json["public_metrics"]),
    entities: DatumEntities.fromJson(json["entities"]),
    text: json["text"],
    inReplyToUserId: json["in_reply_to_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    authorId: json["author_id"],
    referencedTweets: List<ReferencedTweet>.from(json["referenced_tweets"].map((x) => ReferencedTweet.fromJson(x))),
    lang: json["lang"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "conversation_id": conversationId,
    "id": id,
    "possibly_sensitive": possiblySensitive,
    "public_metrics": publicMetrics.toJson(),
    "entities": entities.toJson(),
    "text": text,
    "in_reply_to_user_id": inReplyToUserId,
    "created_at": createdAt.toIso8601String(),
    "author_id": authorId,
    "referenced_tweets": List<dynamic>.from(referencedTweets.map((x) => x.toJson())),
    "lang": lang,
    "source": source,
  };
}

class DatumEntities {
  final List<PurpleUrl> urls;

  DatumEntities({
    required this.urls,
  });

  factory DatumEntities.fromJson(Map<String, dynamic> json) => DatumEntities(
    urls: List<PurpleUrl>.from(json["urls"].map((x) => PurpleUrl.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
  };
}

class PurpleUrl {
  final int start;
  final int end;
  final String url;
  final String expandedUrl;
  final String displayUrl;
  final List<Image> images;
  final int status;
  final String title;
  final String description;
  final String unwoundUrl;

  PurpleUrl({
    required this.start,
    required this.end,
    required this.url,
    required this.expandedUrl,
    required this.displayUrl,
    required this.images,
    required this.status,
    required this.title,
    required this.description,
    required this.unwoundUrl,
  });

  factory PurpleUrl.fromJson(Map<String, dynamic> json) => PurpleUrl(
    start: json["start"],
    end: json["end"],
    url: json["url"],
    expandedUrl: json["expanded_url"],
    displayUrl: json["display_url"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    status: json["status"],
    title: json["title"],
    description: json["description"],
    unwoundUrl: json["unwound_url"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
    "url": url,
    "expanded_url": expandedUrl,
    "display_url": displayUrl,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "status": status,
    "title": title,
    "description": description,
    "unwound_url": unwoundUrl,
  };
}

class Image {
  final String url;
  final int width;
  final int height;

  Image({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class DatumPublicMetrics {
  final int retweetCount;
  final int replyCount;
  final int likeCount;
  final int quoteCount;

  DatumPublicMetrics({
    required this.retweetCount,
    required this.replyCount,
    required this.likeCount,
    required this.quoteCount,
  });

  factory DatumPublicMetrics.fromJson(Map<String, dynamic> json) => DatumPublicMetrics(
    retweetCount: json["retweet_count"],
    replyCount: json["reply_count"],
    likeCount: json["like_count"],
    quoteCount: json["quote_count"],
  );

  Map<String, dynamic> toJson() => {
    "retweet_count": retweetCount,
    "reply_count": replyCount,
    "like_count": likeCount,
    "quote_count": quoteCount,
  };
}

class ReferencedTweet {
  final String type;
  final String id;

  ReferencedTweet({
    required this.type,
    required this.id,
  });

  factory ReferencedTweet.fromJson(Map<String, dynamic> json) => ReferencedTweet(
    type: json["type"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
  };
}

class Includes {
  final List<User> users;
  final List<Tweet> tweets;

  Includes({
    required this.users,
    required this.tweets,
  });

  factory Includes.fromJson(Map<String, dynamic> json) => Includes(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    tweets: List<Tweet>.from(json["tweets"].map((x) => Tweet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
    "tweets": List<dynamic>.from(tweets.map((x) => x.toJson())),
  };
}

class Tweet {
  final String conversationId;
  final String id;
  final bool possiblySensitive;
  final DatumPublicMetrics publicMetrics;
  final TweetEntities entities;
  final Attachments attachments;
  final String text;
  final DateTime createdAt;
  final String authorId;
  final String lang;
  final String source;

  Tweet({
    required this.conversationId,
    required this.id,
    required this.possiblySensitive,
    required this.publicMetrics,
    required this.entities,
    required this.attachments,
    required this.text,
    required this.createdAt,
    required this.authorId,
    required this.lang,
    required this.source,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
    conversationId: json["conversation_id"],
    id: json["id"],
    possiblySensitive: json["possibly_sensitive"],
    publicMetrics: DatumPublicMetrics.fromJson(json["public_metrics"]),
    entities: TweetEntities.fromJson(json["entities"]),
    attachments: Attachments.fromJson(json["attachments"]),
    text: json["text"],
    createdAt: DateTime.parse(json["created_at"]),
    authorId: json["author_id"],
    lang: json["lang"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "conversation_id": conversationId,
    "id": id,
    "possibly_sensitive": possiblySensitive,
    "public_metrics": publicMetrics.toJson(),
    "entities": entities.toJson(),
    "attachments": attachments.toJson(),
    "text": text,
    "created_at": createdAt.toIso8601String(),
    "author_id": authorId,
    "lang": lang,
    "source": source,
  };
}

class Attachments {
  final List<String> mediaKeys;

  Attachments({
    required this.mediaKeys,
  });

  factory Attachments.fromJson(Map<String, dynamic> json) => Attachments(
    mediaKeys: List<String>.from(json["media_keys"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "media_keys": List<dynamic>.from(mediaKeys.map((x) => x)),
  };
}

class TweetEntities {
  final List<Mention> mentions;
  final List<UrlUrl> urls;
  final List<Hashtag> hashtags;

  TweetEntities({
    required this.mentions,
    required this.urls,
    required this.hashtags,
  });

  factory TweetEntities.fromJson(Map<String, dynamic> json) => TweetEntities(
    mentions: List<Mention>.from(json["mentions"].map((x) => Mention.fromJson(x))),
    urls: List<UrlUrl>.from(json["urls"].map((x) => UrlUrl.fromJson(x))),
    hashtags: List<Hashtag>.from(json["hashtags"].map((x) => Hashtag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mentions": List<dynamic>.from(mentions.map((x) => x.toJson())),
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
    "hashtags": List<dynamic>.from(hashtags.map((x) => x.toJson())),
  };
}

class Hashtag {
  final int start;
  final int end;
  final String tag;

  Hashtag({
    required this.start,
    required this.end,
    required this.tag,
  });

  factory Hashtag.fromJson(Map<String, dynamic> json) => Hashtag(
    start: json["start"],
    end: json["end"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
    "tag": tag,
  };
}

class Mention {
  final int start;
  final int end;
  final String username;

  Mention({
    required this.start,
    required this.end,
    required this.username,
  });

  factory Mention.fromJson(Map<String, dynamic> json) => Mention(
    start: json["start"],
    end: json["end"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
    "username": username,
  };
}

class UrlUrl {
  final int start;
  final int end;
  final String url;
  final String expandedUrl;
  final String displayUrl;

  UrlUrl({
    required this.start,
    required this.end,
    required this.url,
    required this.expandedUrl,
    required this.displayUrl,
  });

  factory UrlUrl.fromJson(Map<String, dynamic> json) => UrlUrl(
    start: json["start"],
    end: json["end"],
    url: json["url"],
    expandedUrl: json["expanded_url"],
    displayUrl: json["display_url"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
    "url": url,
    "expanded_url": expandedUrl,
    "display_url": displayUrl,
  };
}

class User {
  final DateTime createdAt;
  final String profileImageUrl;
  final UserEntities entities;
  final String id;
  final bool verified;
  final String location;
  final String description;
  final String pinnedTweetId;
  final String username;
  final UserPublicMetrics publicMetrics;
  final String name;
  final String url;
  final bool protected;

  User({
    required this.createdAt,
    required this.profileImageUrl,
    required this.entities,
    required this.id,
    required this.verified,
    required this.location,
    required this.description,
    required this.pinnedTweetId,
    required this.username,
    required this.publicMetrics,
    required this.name,
    required this.url,
    required this.protected,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    createdAt: DateTime.parse(json["created_at"]),
    profileImageUrl: json["profile_image_url"],
    entities: UserEntities.fromJson(json["entities"]),
    id: json["id"],
    verified: json["verified"],
    location: json["location"],
    description: json["description"],
    pinnedTweetId: json["pinned_tweet_id"],
    username: json["username"],
    publicMetrics: UserPublicMetrics.fromJson(json["public_metrics"]),
    name: json["name"],
    url: json["url"],
    protected: json["protected"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt.toIso8601String(),
    "profile_image_url": profileImageUrl,
    "entities": entities.toJson(),
    "id": id,
    "verified": verified,
    "location": location,
    "description": description,
    "pinned_tweet_id": pinnedTweetId,
    "username": username,
    "public_metrics": publicMetrics.toJson(),
    "name": name,
    "url": url,
    "protected": protected,
  };
}

class UserEntities {
  final FluffyUrl url;
  final Description description;

  UserEntities({
    required this.url,
    required this.description,
  });

  factory UserEntities.fromJson(Map<String, dynamic> json) => UserEntities(
    url: FluffyUrl.fromJson(json["url"]),
    description: Description.fromJson(json["description"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url.toJson(),
    "description": description.toJson(),
  };
}

class Description {
  final List<Hashtag> hashtags;

  Description({
    required this.hashtags,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    hashtags: List<Hashtag>.from(json["hashtags"].map((x) => Hashtag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hashtags": List<dynamic>.from(hashtags.map((x) => x.toJson())),
  };
}

class FluffyUrl {
  final List<UrlUrl> urls;

  FluffyUrl({
    required this.urls,
  });

  factory FluffyUrl.fromJson(Map<String, dynamic> json) => FluffyUrl(
    urls: List<UrlUrl>.from(json["urls"].map((x) => UrlUrl.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
  };
}

class UserPublicMetrics {
  final int followersCount;
  final int followingCount;
  final int tweetCount;
  final int listedCount;

  UserPublicMetrics({
    required this.followersCount,
    required this.followingCount,
    required this.tweetCount,
    required this.listedCount,
  });

  factory UserPublicMetrics.fromJson(Map<String, dynamic> json) => UserPublicMetrics(
    followersCount: json["followers_count"],
    followingCount: json["following_count"],
    tweetCount: json["tweet_count"],
    listedCount: json["listed_count"],
  );

  Map<String, dynamic> toJson() => {
    "followers_count": followersCount,
    "following_count": followingCount,
    "tweet_count": tweetCount,
    "listed_count": listedCount,
  };
}
