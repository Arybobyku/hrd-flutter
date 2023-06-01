import 'package:hrd/src/common/common.dart';

class OrganizationHierarchy extends BaseModel {
  final String? id;
  final String? parentId;
  final String? type;
  final String? name;
  final Map<String, dynamic>? additionalData;

  OrganizationHierarchy({
    this.id,
    this.parentId,
    this.type,
    this.name,
    this.additionalData,
  });

  factory OrganizationHierarchy.fromJsonApi(Map<String, dynamic> json) =>
      OrganizationHierarchy(
        id: json['id'],
        parentId: json['parent_id'],
        type: json['type'],
        name: json['name'],
        additionalData: json['additional_data'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "type": type,
        "name": name,
        "additional_data": additionalData,
      };

  @override
  copyWith({
    String? id,
    String? parentId,
    String? type,
    String? name,
    Map<String, dynamic>? additionalData,
  }) =>
      OrganizationHierarchy(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        name: id ?? this.name,
        additionalData: additionalData ?? this.additionalData,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        parentId,
        type,
        name,
        additionalData,
      ];
}
