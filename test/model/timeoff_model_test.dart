import 'package:flutter_test/flutter_test.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';

void main() {
  final Map<String, dynamic> response = {
    "meta": {
      "code": 200,
      "status": "success",
      "message": "Berhasil mengambil data cuti"
    },
    "data": [
      {
        "id": 1,
        "user_id": 1,
        "start_date": "2023-01-12",
        "end_date": "2023-01-15",
        "total_days": 3,
        "reasons": "Cuti Lebaran",
        "approver_id": null,
        "approval_date": null,
        "status": "PENDING",
        "note": null,
        "created_at": "2023-05-27T04:20:27.000000Z",
        "updated_at": "2023-05-27T04:20:27.000000Z"
      },
      {
        "id": 2,
        "user_id": 1,
        "start_date": "2023-01-12",
        "end_date": "2023-01-18",
        "total_days": 6,
        "reasons": "Cuti Lebaran",
        "approver_id": null,
        "approval_date": null,
        "status": "PENDING",
        "note": null,
        "created_at": "2023-05-27T04:23:13.000000Z",
        "updated_at": "2023-05-27T04:23:13.000000Z"
      }
    ]
  };

  test('TEST Time Off Parsing', () {
    final result = BaseResponse<List<Map>>.fromJson(
        response, (json) => json as List<Map>).data;
    // result.data;

    List<Leave> timeOff = [];
    for (Map data in result) {
      timeOff.add(
        Leave.fromJsonApi(
          Map<String, dynamic>.from(data),
        ),
      );
    }


    print(timeOff);
  });
}
