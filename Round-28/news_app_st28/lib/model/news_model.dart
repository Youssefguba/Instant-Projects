// {
//    "status":"ok",
//    "totalResults":10,
//    "articles":[
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"Hackers leak more 23andMe data, X cracks down on porn and Andreessen writes a manifesto",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/21/hackers-leak-more-23andme-data-x-cracks-down-on-porn-and-andreessen-writes-a-manifesto/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-21T20:37:17.1888182Z",
//          "content":null
//       },
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"Humanoid robots face a major test with Amazon&#8217;s Digit pilots",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/21/humanoid-robots-face-their-first-major-test-with-amazons-digit-pilots/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-21T20:37:16.5952157Z",
//          "content":null
//       },
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"This week in AI: Can we trust DeepMind to be ethical?",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/21/this-week-in-ai-can-we-trust-deepmind-to-be-ethical/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-21T17:22:22.8296987Z",
//          "content":null
//       },
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"Deal Dive: Tucker Carlson is a media startup founder — again",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/21/tucker-carlson-last-country-media-startup/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-21T17:22:22.2360972Z",
//          "content":null
//       },
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"In insurtech, too, business models aren&#8217;t one-size-fits-all",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/21/insurtech-business-models-dtc/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-21T17:22:21.4081781Z",
//          "content":null
//       },
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"Paddy Cosgrave has stepped down as CEO of Web Summit",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/21/paddy-cosgrave-has-stepped-down-as-ceo-of-web-summit/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-21T17:22:20.5021532Z",
//          "content":null
//       },
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"TC+ Roundup: Did Atlassian pay a fair price for Loom?",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/20/tc-roundup-did-atlassian-pay-a-fair-price-for-loom/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-20T23:52:14.9559153Z",
//          "content":null
//       },
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"Toyota hops on Tesla&#8217;s EV charging standard, leaving Stellantis and VW as holdouts",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/20/toyota-hops-on-teslas-ev-charging-standard-leaving-stellantis-and-vw-as-holdouts/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-20T23:52:14.3935555Z",
//          "content":null
//       },
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"TAM/SAM/SOM is only for founders who think small",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/20/tam-sam-som-is-only-for-founders-who-think-small/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-20T23:52:13.8624381Z",
//          "content":null
//       },
//       {
//          "source":{
//             "id":"techcrunch",
//             "name":"TechCrunch"
//          },
//          "author":null,
//          "title":"Okta says hackers stole customer access tokens from support unit",
//          "description":null,
//          "url":"https://techcrunch.com/2023/10/20/okta-says-hackers-stole-customer-access-tokens-from-support-unit/",
//          "urlToImage":null,
//          "publishedAt":"2023-10-20T23:52:13.1573886Z",
//          "content":null
//       }
//    ]
// }

class NewsGeneralResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsGeneralResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsGeneralResponse.fromJson(Map<String, dynamic> json) => NewsGeneralResponse(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  final Source source;
  final String? author;
  final String? title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] ?? 'Anonymous Author',
    title: json["title"] ?? '',
    description: json["description"] ?? 'No Description',
    url: json["url"] ?? '',
    urlToImage: json["urlToImage"] ?? 'https://upload.wikimedia.org/wikipedia/commons/b/b7/TechCrunch_favicon_gradient.png',
    publishedAt: DateTime.parse(json["publishedAt"] ?? '12-12-2012'),
    content: json["content"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt?.toIso8601String(),
    "content": content,
  };
}

class Source {
  final Id id;
  final Name name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: idValues.map[json["id"]]!,
    name: nameValues.map[json["name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "name": nameValues.reverse[name],
  };
}

enum Id {
  TECHCRUNCH
}

final idValues = EnumValues({
  "techcrunch": Id.TECHCRUNCH
});

enum Name {
  TECH_CRUNCH
}

final nameValues = EnumValues({
  "TechCrunch": Name.TECH_CRUNCH
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
