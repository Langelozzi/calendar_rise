import 'package:calendar_rise/models/authorized_user.dart';
import 'package:calendar_rise/models/calendar.dart';

abstract class CalendarService {
  AuthorizedUser user;

  CalendarService(this.user);

  Future<List<Calendar>> getAllCalendars();
}
