import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';

part 'base_response.g.dart';

@JsonSerializable(ignoreUnannotated: true, explicitToJson: true, genericArgumentFactories: true)
class BaseResponse<T>{
  @JsonKey(name: "meta") Meta meta;
  @JsonKey(name: 'data') T data;

  BaseResponse({required this.meta,required this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json,T Function(Object? json) fromJsonT)=>_$BaseResponseFromJson(json,fromJsonT);
}