import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteModel {
  String? id;
  String? userId;
  String? title;
  String? content;
  DateTime? dateadded;
  NoteModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.dateadded,
  });

  NoteModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? content,
    DateTime? dateadded,
  }) {
    return NoteModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      dateadded: dateadded ?? this.dateadded,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      'dateadded': dateadded?.millisecondsSinceEpoch,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      dateadded: DateTime.tryParse(map['dateadded']) != null ? DateTime.fromMillisecondsSinceEpoch(map['dateadded'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
