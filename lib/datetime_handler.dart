import 'package:intl/intl.dart';

String dateNow(int dateFromMilisec) {
  final now = DateTime.now();
  final thedate = DateTime.fromMillisecondsSinceEpoch(dateFromMilisec);
  if (now.month - thedate.month == 0 &&
      now.year - thedate.year == 0 &&
      now.day - thedate.day == 1) {
    return "Yesterday";
  }
  if (now.month - thedate.month == 0 &&
      now.year - thedate.year == 0 &&
      now.day - thedate.day == 0) {
    return DateFormat('hh:mm').format(thedate);
  } else {
    return DateFormat('yyyy-MM-dd').format(thedate);
  }
}
