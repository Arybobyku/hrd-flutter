import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable(ignoreUnannotated: true, explicitToJson: true)
class Meta {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "message")
  String message;

  Meta({required this.status, required this.message, required this.code});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
