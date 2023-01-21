import 'package:pray_times/pray_times.dart';

main() {
  double latitude = 31.7775067;
  double longitude = 35.2368801;
  double timezone = 2;
  // Test Prayer times here
  PrayerTimes prayers = new PrayerTimes();

  prayers.setTimeFormat(prayers.Time24);
  prayers.setCalcMethod(prayers.MWL);
  prayers.setAsrJuristic(prayers.Shafii);
  prayers.setAdjustHighLats(prayers.AngleBased);
  // {Fajr,Sunrise,Dhuhr,Asr,Sunset,Maghrib,Isha}
  var offsets = [0, 0, 0, 0, 0, 0, 0];
  prayers.tune(offsets);
  final date = DateTime.now();
  // final date = DateTime(2023, DateTime.january, 20);
  List<String> prayerTimes =
      prayers.getPrayerTimes(date, latitude, longitude, timezone);
  List<String> prayerNames = prayers.getTimeNames();

  for (int i = 0; i < prayerTimes.length; i++) {
    print("${prayerNames[i]} - ${prayerTimes[i]}");
  }
}
