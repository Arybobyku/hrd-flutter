import 'package:hrd/src/common/common.dart';

class Announcement extends BaseModel {
  final String? id;

  final String? title;

  final String? publish;

  final String? description;

  final String? createdAt;

  final String? updatedAt;

  Announcement({
    this.id,
    this.title,
    this.publish,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Announcement.fromJsonApi(Map<String, dynamic> json) => Announcement(
        id: json['id'],
        title: json['title'],
        publish: json['publish'],
        description: json['desc'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  @override
  copyWith({
    String? id,
    String? title,
    String? publish,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) =>
      Announcement(
        id: id ?? this.id,
        title: title ?? this.title,
        publish: publish ?? this.publish,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        publish,
        description,
        createdAt,
        updatedAt,
      ];
}
