// To parse this JSON data, do
//
//     final storyblok = storyblokFromJson(jsonString);

import 'dart:convert';

Storyblok storyblokFromJson(String str) => Storyblok.fromJson(json.decode(str));

String storyblokToJson(Storyblok data) => json.encode(data.toJson());

class Storyblok {
  Story story;
  int cv;
  List<dynamic> rels;
  List<dynamic> links;

  Storyblok({
    required this.story,
    required this.cv,
    required this.rels,
    required this.links,
  });

  factory Storyblok.fromJson(Map<String, dynamic> json) => Storyblok(
    story: Story.fromJson(json["story"]),
    cv: json["cv"],
    rels: List<dynamic>.from(json["rels"].map((x) => x)),
    links: List<dynamic>.from(json["links"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "story": story.toJson(),
    "cv": cv,
    "rels": List<dynamic>.from(rels.map((x) => x)),
    "links": List<dynamic>.from(links.map((x) => x)),
  };
}

class Story {
  String name;
  DateTime createdAt;
  DateTime publishedAt;
  int id;
  String uuid;
  Content content;
  String slug;
  String fullSlug;
  dynamic sortByDate;
  int position;
  List<dynamic> tagList;
  bool isStartpage;
  dynamic parentId;
  dynamic metaData;
  String groupId;
  DateTime firstPublishedAt;
  dynamic releaseId;
  String lang;
  dynamic path;
  List<dynamic> alternates;
  dynamic defaultFullSlug;
  dynamic translatedSlugs;

  Story({
    required this.name,
    required this.createdAt,
    required this.publishedAt,
    required this.id,
    required this.uuid,
    required this.content,
    required this.slug,
    required this.fullSlug,
    this.sortByDate,
    required this.position,
    required this.tagList,
    required this.isStartpage,
    this.parentId,
    this.metaData,
    required this.groupId,
    required this.firstPublishedAt,
    this.releaseId,
    required this.lang,
    this.path,
    required this.alternates,
    this.defaultFullSlug,
    this.translatedSlugs,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    publishedAt: DateTime.parse(json["published_at"]),
    id: json["id"],
    uuid: json["uuid"],
    content: Content.fromJson(json["content"]),
    slug: json["slug"],
    fullSlug: json["full_slug"],
    sortByDate: json["sort_by_date"],
    position: json["position"],
    tagList: List<dynamic>.from(json["tag_list"].map((x) => x)),
    isStartpage: json["is_startpage"],
    parentId: json["parent_id"],
    metaData: json["meta_data"],
    groupId: json["group_id"],
    firstPublishedAt: DateTime.parse(json["first_published_at"]),
    releaseId: json["release_id"],
    lang: json["lang"],
    path: json["path"],
    alternates: List<dynamic>.from(json["alternates"].map((x) => x)),
    defaultFullSlug: json["default_full_slug"],
    translatedSlugs: json["translated_slugs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "published_at": publishedAt.toIso8601String(),
    "id": id,
    "uuid": uuid,
    "content": content.toJson(),
    "slug": slug,
    "full_slug": fullSlug,
    "sort_by_date": sortByDate,
    "position": position,
    "tag_list": List<dynamic>.from(tagList.map((x) => x)),
    "is_startpage": isStartpage,
    "parent_id": parentId,
    "meta_data": metaData,
    "group_id": groupId,
    "first_published_at": firstPublishedAt.toIso8601String(),
    "release_id": releaseId,
    "lang": lang,
    "path": path,
    "alternates": List<dynamic>.from(alternates.map((x) => x)),
    "default_full_slug": defaultFullSlug,
    "translated_slugs": translatedSlugs,
  };
}

class Content {
  String uid;
  String about;
  String title;
  String component;
  String creationTime;

  Content({
    required this.uid,
    required this.about,
    required this.title,
    required this.component,
    required this.creationTime,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    uid: json["_uid"],
    about: json["About"],
    title: json["Title"],
    component: json["component"],
    creationTime: json["creation_time"],
  );

  Map<String, dynamic> toJson() => {
    "_uid": uid,
    "About": about,
    "Title": title,
    "component": component,
    "creation_time": creationTime,
  };
}
