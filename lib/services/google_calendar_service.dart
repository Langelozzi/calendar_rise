import 'dart:convert';

import 'package:calendar_rise/interfaces/calendar_service_interface.dart';
import 'package:calendar_rise/models/authorized_user.dart';
import 'package:calendar_rise/models/calendar.dart';
import 'package:http/http.dart' as http;

class GoogleCalendarService implements CalendarService {
  @override
  AuthorizedUser user;

  GoogleCalendarService(this.user);

  @override
  Future<List<Calendar>> getAllCalendars() async {
    var url =
        Uri.https('www.googleapis.com', 'calendar/v3/users/me/calendarList');

    http.Response response;
    try {
      response = await http
          .get(url, headers: {'Authorization': 'Bearer ${user.accessToken}'});

      if (response.statusCode > 400) {
        throw Exception(
            'Error fetching calendar data from google api. Response returned status code ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (ex) {
      throw Exception('Request failed: $ex');
    }

    Map<String, dynamic> responseBody = json.decode(response.body);
    if (!responseBody.containsKey('items')) {
      throw Exception("Failed to find items in calendar list.");
    }

    final calendarList = <Calendar>[];
    for (var calendarJson in responseBody['items']) {
      calendarList.add(Calendar.fromJson(calendarJson));
    }

    return calendarList;
  }
}
