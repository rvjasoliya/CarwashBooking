import 'package:carwash_booking/Service/Api.dart';
import 'package:carwash_booking/others/storageManager.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  loginApi({mobile, pass}) async {
    http.Response response = await http.post(Api.login, body: {
      'mobile': mobile,
      'password': pass,
    });
    return response;
  }

  viewProfile() async {
    http.Response response = await http.post(Api.viewProfile, body: {
      'user_id': profileData.userId,
    });
    return response;
  }

  washerAttan({id, date, lat, log}) async {
    http.Response response = await http.post(
      Api.washerattan,
      body: {
        'washer_id': "$id",
        'today_date': "$date",
        'lat': "$lat",
        'log': "$log",
      },
    );
    return response;
  }

  checkTodayAttr({id}) async {
    http.Response response = await http.post(
      Api.checktodayattr,
      body: {
        'washer_id': "$id",
      }
    );
    return response;
  }

  washerDailyDuty() async {
    http.Response response = await http.post(Api.washerDailyDuty, body: {
      'washer_id': profileData.userId,
    });
    return response;
  }

  starttime({calendar_id, starttime}) async {
    http.Response response = await http.post(Api.startTime, body: {
      'calendar_id': calendar_id,
      'start_time': starttime,
    });
    return response;
}

  endtime({calendar_id, endtime}) async {
    http.Response response = await http.post(Api.startTime, body: {
      'calendar_id': calendar_id,
      'end_time': endtime,
    });
    return response;
  }
}
