import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

void main() {
  final Map<String, dynamic> jsonResponse = {
    "meta": {"code": 200, "status": "success", "message": "success login"},
    "data": {
      "user": {
        "id": "994e5e40-a3e5-44e7-b68b-02dce94c302a",
        "role": 1,
        "first_name": "Ary",
        "last_name": "Siregar",
        "mobile_phone": "+6282273025671",
        "birth_place": "Medan",
        "birth_date": "2023-06-01",
        "martial_status": "Belum Kawin",
        "religion": "Islam",
        "blood_type": "A",
        "email": "boby@gmail.com",
        "is_active": 1,
        "email_verified_at": null,
        "created_at": "2023-06-01T11:24:37.000000Z",
        "updated_at": "2023-06-01T11:25:45.000000Z",
        "user_identity": {
          "id": "994e5e40-a4a2-4ee1-a7ea-346aac403e5e",
          "user_id": "994e5e40-a3e5-44e7-b68b-02dce94c302a",
          "identity_type": "KTP",
          "identity_number": "1231313131",
          "postal_code": "20228",
          "citizen_id_address": "234242423424",
          "residential_address": "Jl Menteng Perumahan Menteng",
          "created_at": "2023-06-01T11:24:37.000000Z",
          "updated_at": "2023-06-01T11:25:53.000000Z"
        },
        "employee": {
          "id": "994e5e40-a504-4bd4-871f-91bbca15e84b",
          "user_id": "994e5e40-a3e5-44e7-b68b-02dce94c302a",
          "branch_id": "994e5e40-a55c-4ae1-b543-e80b25f4c7ce",
          "department_id": "994e5e40-a61a-4ab8-a5d6-645a0a3175f7",
          "position_id": "994e5e40-a667-4cb9-9662-f191516a5def",
          "employment_status": "Permanen",
          "join_date": "2023-06-01",
          "resign_date": null,
          "created_at": "2023-06-01T11:24:37.000000Z",
          "updated_at": "2023-06-01T11:26:03.000000Z",
          "branch": {
            "id": "994e5e40-a55c-4ae1-b543-e80b25f4c7ce",
            "parent_id": null,
            "type": "branch",
            "name": "PPSU SUMUT",
            "additional_data": null,
            "created_at": "2023-06-01T11:24:37.000000Z",
            "updated_at": "2023-06-01T11:24:37.000000Z"
          },
          "department": {
            "id": "994e5e40-a61a-4ab8-a5d6-645a0a3175f7",
            "parent_id": "994e5e40-a55c-4ae1-b543-e80b25f4c7ce",
            "type": "department",
            "name": "Keuangan",
            "additional_data": null,
            "created_at": "2023-06-01T11:24:37.000000Z",
            "updated_at": "2023-06-01T11:24:37.000000Z"
          },
          "position": {
            "id": "994e5e40-a667-4cb9-9662-f191516a5def",
            "parent_id": "994e5e40-a61a-4ab8-a5d6-645a0a3175f7",
            "type": "position",
            "name": "Kepala Keuangan",
            "additional_data": null,
            "created_at": "2023-06-01T11:24:37.000000Z",
            "updated_at": "2023-06-01T11:24:37.000000Z"
          }
        }
      },
      "access-token": "7|HxDVwowO1FRrcI1CbyLCQlFuBVHXhTOf4CHWaMwH",
      "token-type": "Bearer"
    }
  };

  test("test mapping from api", () {
    final _base = BaseResponse.fromJson(jsonResponse,
        (json) => User.fromJsonAPI((json as Map<String, dynamic>)['user']));

    print(_base.data);

    User user = User.fromJsonAPI(jsonResponse['data']['user']);

    print(user);
    print(user.userIdentity);
    print(user.employee);
    print(user.employee?.branch);
    print(user.employee?.department);
    print(user.employee?.position);
  });

  test("test mapping from sharePref", () {
    User user = User.fromJsonAPI(jsonResponse['data']['user']);

    var userEncode = jsonEncode(user.toJson());

    User userDecode = User.fromJson(jsonDecode(userEncode));

    print(userDecode);
    print(userDecode.userIdentity);
    print(userDecode.employee);
    print(userDecode.employee?.branch);
    print(userDecode.employee?.department);
    print(userDecode.employee?.position);
  });
}
