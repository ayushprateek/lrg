import 'package:intl/intl.dart';

String dateFormat = 'dd/MM/yyyy';

String getFormattedDate(DateTime? now) {
  if (now == null) {
    now = DateTime.parse("1900-01-01");
    DateFormat formatter = DateFormat(dateFormat);
    String formatted = formatter.format(now);
    return formatted;
  } else {
    DateFormat formatter = DateFormat(dateFormat);
    String formatted = formatter.format(now);
    return formatted;
  }
}

String getFormattedDateAndTime(DateTime? now) {
  DateFormat formatter = DateFormat('$dateFormat HH:mm a');
  if (now != null) {
    String formatted = formatter.format(now);
    return formatted;
  }
  String formatted = "";
  return formatted;
}

DateTime getDateFromString(String? now) {
  if (now == null || now == '') {
    return DateTime.parse("1900-01-01");
  }
  DateTime tempDate = DateFormat(dateFormat).parse(now);
  return tempDate;
}

DateTime getTimeFromString(String? time) {
  if (time == null || time == '') {
    return DateTime.parse("1900-01-01");
  }
  DateTime date = DateFormat('HH:mm').parse(time);
  print(date.toIso8601String());
  return date;
}

String getStringFromTime(DateTime? time) {
  if (time == null || time == '') {
    return '';
  }
  String formattedTime = DateFormat.Hm().format(time);
  print(formattedTime);
  return formattedTime;
}
DateTime getDateAndTimeFromString(String? now) {
  if (now == null || now == '') {
    return DateTime.parse("1900-01-01");
  }
  DateTime tempDate = DateFormat('$dateFormat HH:mm a').parse(now);
  return tempDate;
}