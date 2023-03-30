import 'package:flutter_test/flutter_test.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

void main(){

  final Map<String,dynamic> jsonResponse = {
    "meta": {
      "code": 200,
      "status": "success",
      "message": "success login"
    },
    "data": {
      "user": {
        "id": 9,
        "name": "ary boby siregar",
        "email": "boby5@gmail.com",
        "email_verified_at": null,
        "created_at": "2022-07-31T15:39:22.000000Z",
        "updated_at": "2022-07-31T15:39:22.000000Z"
      },
      "access-token": "7|HxDVwowO1FRrcI1CbyLCQlFuBVHXhTOf4CHWaMwH",
      "token-type": "Bearer"
    }
  };

  test("TEST MODEL", (){

    final _base = BaseResponse.fromJson(jsonResponse, (json) => User.fromJson((json as Map<String, dynamic>)['user']));

    print(_base.data);

    User user = User.fromJson(jsonResponse['data']['user']);

    print(user);
  });
}