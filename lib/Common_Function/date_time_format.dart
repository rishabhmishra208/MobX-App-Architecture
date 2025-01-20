import 'package:intl/intl.dart';

// ------ String for start timer in 00:00 ------

String strDigits(int n) => n.toString().padLeft(2, '0');

// ------ Date formate ------

dateTimeFormat(String dateFromAPI) {
  var input1Format = DateFormat('yyy-MM-dd');
  var apiDate = input1Format.parse(dateFromAPI);

  var outputFormat = DateFormat('d MMM yyyy');
  var finalDate = outputFormat.format(apiDate);

  return finalDate; // 28 May 2023
}

//

dateTimeFormat5(String dateFromAPI) {
  var input1Format = DateFormat('yyy-MM-dd');
  var apiDate = input1Format.parse(dateFromAPI);

  var outputFormat = DateFormat('yyyy');
  var finalDate = outputFormat.format(apiDate);

  return finalDate; // 2023
}

//

dateTimeFormat2(String dateFromAPI) {
  var input1Format = DateFormat('yyy-MM-dd');
  var apiDate = input1Format.parse(dateFromAPI);
  var outputFormat = DateFormat('yMMMMd');
  var finalDate = outputFormat.format(apiDate);
  return finalDate; // November 7, 2022
}

dateTimeFormat3(String dateFromAPI) {
  var input1Format = DateFormat('yyy-MM-dd');
  var apiDate = input1Format.parse(dateFromAPI);
  var outputFormat = DateFormat('dd/MM/yyyy');
  var finalDate = outputFormat.format(apiDate);
  return finalDate; // 12/10/2023
}

dateTimeFormat4(String dateFromAPI) {
  var input1Format = DateFormat('yyy-MM-dd');
  var apiDate = input1Format.parse(dateFromAPI);
  var outputFormat = DateFormat('yyyy-MM-dd');
  var finalDate = outputFormat.format(apiDate);
  return finalDate; // 1996-08-20
}

// ------ Time formate ------

timeFormat(String dateFromAPI) {
  var inputFormat = DateTime.parse(dateFromAPI).toLocal();
  var outputFormat = DateFormat.jm().format(inputFormat).toString();

  return outputFormat; // 1.30PM
}

// ------ Date utc formate ------

dateTimeUTCFormat(int utcFromAPI) {
  var localDateTime = DateTime.fromMillisecondsSinceEpoch(
    utcFromAPI * 1000,
    isUtc: true,
  ).toLocal();

  var input1Format = DateFormat('yyy-MM-dd');
  var apiDate = input1Format.parse(localDateTime.toString());

  var outputFormat = DateFormat('dd.MM.yyyy');
  var finalDate = outputFormat.format(apiDate);

  return finalDate; // 30.07.2023
}

dateTimeUTCFormat2(int utcFromAPI) {
  var localDateTime = DateTime.fromMillisecondsSinceEpoch(
    utcFromAPI * 1000,
    isUtc: true,
  ).toLocal();

  var input1Format = DateFormat('yyy-MM-dd');
  var apiDate = input1Format.parse(localDateTime.toString());

  var outputFormat = DateFormat('MMM dd yyyy');
  var finalDate = outputFormat.format(apiDate);

  return finalDate; // 30.07.2023
}

// ------ UTC time formate ------

utcTimeFormat(int utcFromAPI) {
  var localDateTime = DateTime.fromMillisecondsSinceEpoch(
    utcFromAPI,
    isUtc: true,
  ).toLocal();

  var outputFormat = DateFormat.jm().format(localDateTime).toString();

  return outputFormat; // 1.30PM
}

// ------ Deference Between to Days ------

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (from.difference(to).inHours / 24).round();
}

// ------ DateHelper ------

const String dateFormatter = 'dd/MM/yyyy';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this); // 12/10/2023
  }

  bool isSameDate(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day; // compare with same date time
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}

// Function to convert time stamp to date
// DateTime returnDateAndTimeFormat(String time) {
//   // print('------- time: ${int.parse(time.toString())} --------');
//   var dateTime = DateFormat('yyyy-MM-ddThh:mm:ss').parse(time);
//   var dt = DateTime.fromMicrosecondsSinceEpoch(
//     dateTime.millisecondsSinceEpoch * 1000,
//     isUtc: true,
//   );
//   // var dt = dateTime.millisecondsSinceEpoch;
//   // var originalDate = DateFormat('MM/dd/yyyy').format(dt);
//   return DateTime(dt.year, dt.month, dt.day);
// }

// // Function to return message time in 24 hours format AM/PM
// String messageTime(String time) {
//   var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time.toString()));
//   String difference = '';
//   difference = DateFormat('jm').format(dt).toString();
//   return difference;
// }

// Function to return date if date changes based on your local date and time

String groupMessageDateAndTime(String time) {
  var dateTime = DateFormat('yyyy-MM-ddThh:mm:ss').parse(time);

  var utcdt = DateTime.fromMicrosecondsSinceEpoch(
    dateTime.millisecondsSinceEpoch * 1000,
    isUtc: true,
  );

  var dt = utcdt.toLocal();

  // var originalDate = DateFormat('MM/dd/yyyy').format(dt);

  final todayDate = DateTime.now();

  final today = DateTime(todayDate.year, todayDate.month, todayDate.day);
  final yesterday =
      DateTime(todayDate.year, todayDate.month, todayDate.day - 1);
  String difference = '';
  final aDate = DateTime(dt.year, dt.month, dt.day);

  if (aDate == today) {
    difference = 'today';
  } else if (aDate == yesterday) {
    difference = 'yesterday';
  } else {
    // difference = DateFormat.yMMMd().format(dt).toString(); // Oct 11, 2023
    difference = DateFormat('dd/MM/yyyy').format(dt).toString(); // 13/10/2023
  }

  return difference;
}

// Time conversion milliseconds to Hrs and Minutes

String durationToString({
  required double minutes,
  String? message,
  bool? displayLeft,
}) {
  String stringMinutes = '';
  String stringHours = '';
  var d = Duration(minutes: minutes.toInt());
  List<String> parts = d.toString().split(':');

  if (parts[1].padLeft(2, '0') == '00' && message != null) {
    return '${parts[0].padLeft(2, '0')}$message';
  } else if (parts[1].padLeft(2, '0') == '00') {
    if (parts[0].padLeft(2, '0') == '01' || parts[0].padLeft(2, '0') == '00') {
      stringHours = ' HOUR';
    } else {
      stringHours = ' HOURS';
    }

    return '${parts[0].padLeft(2, '0')}$stringHours';
  } else if (parts[0].padLeft(2, '0') == '00') {
    if (parts[1].padLeft(2, '0') == '01' || parts[1].padLeft(2, '0') == '00') {
      stringMinutes = ' MINUTE';
    } else {
      stringMinutes = ' MINUTES';
    }

    return '${parts[1].padLeft(2, '0')}$stringMinutes';
  } else {
    if (parts[0].padLeft(2, '0') == '01' || parts[0].padLeft(2, '0') == '00') {
      stringHours = ' HOUR';
    } else {
      stringHours = ' HOURS';
    }

    if (parts[1].padLeft(2, '0') == '01' || parts[1].padLeft(2, '0') == '00') {
      stringMinutes = ' MINUTE';
    } else {
      stringMinutes = ' MINUTES';
    }

    if (displayLeft == true) {
      return '${parts[0].padLeft(2, '0')}$stringHours ${parts[1].padLeft(2, '0')} $stringMinutes';
    } else {
      return '${parts[0].padLeft(2, '0')}$stringHours ${parts[1].padLeft(2, '0')} $stringMinutes';
    }
  }
}
