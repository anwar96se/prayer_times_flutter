## Pray Times

Islamic project aimed at providing a Dart library for calculating Muslim prayers times.

## Usage

```dart
import 'package:pray_times/pray_times.dart';

main() {
  double latitude = 31.7775067;
  double longitude = 35.2368801;
  double timezone = 2;

  PrayerTimes prayers = new PrayerTimes();
  prayers.setTimeFormat(prayers.Time24);
  prayers.setCalcMethod(prayers.MWL);
  prayers.setAsrJuristic(prayers.Shafii);
  prayers.setAdjustHighLats(prayers.AngleBased);
  var offsets = [0, 0, 0, 0, 0, 0, 0];
  prayers.tune(offsets);

  final date = DateTime(2023, DateTime.january, 20);
  List<String> prayerTimes =
  prayers.getPrayerTimes(date, latitude, longitude, timezone);
  List<String> prayerNames = prayers.getTimeNames();

  for (int i = 0; i < prayerTimes.length; i++) {
    print("${prayerNames[i]} - ${prayerTimes[i]}");
  }
}
```

## Configuration

**Calculation Methods**

| Name          | Fajr Angle | Isha Angle | Maghrib Duration | Description                                                                                              |
|---------------|------------|------------|------------------|----------------------------------------------------------------------------------------------------------|
| `MWL`         | 18         | 17         |                  | Muslim World League, usually used in Europe, Far East and parts of America. Default in most calculators. |
| `ISNA`        | 15         | 15         |                  | Islamic Society of North America, used in Canada and USA.                                                |
| `Umm al-Qura` | 18.5       |            | 90 minutes       | Umm al-Qura University in Makkah which used in Saudi Arabia.                                             |
| `Karachi`     | 18         | 18         |                  | University of Islamic Sciences, Karachi.                                                                 |
| `Egypt`       | 19.5       | 17.5       |                  | Egyptian General Authority of Survey.                                                                    |
| `Tehran`      | 17.7       | 14         |                  | Institute of Geophysics at University of Tehran.                                                         |
| `Jafari`      | 16         | 14         |                  | Shia Ithna Ashari that used in some Shia communities worldwide.                                          |
| `Custom`      | 0          | 0          |                  | Calculation method for customization .                                                                   |

**Madhab**

| Value    | Factor | Description                                                                                                                               |
|----------|--------|-------------------------------------------------------------------------------------------------------------------------------------------|
| `Shafi`  | 1      | Asr begins when the length of any object's shadow equals the length of the object itself plus the length of that object's shadow at noon. |
| `Hanafi` | 2      | Asr begins when the length of any object's shadow is twice the length of the object plus the length of that object's shadow at noon.      |

**High Latitude**

In locations at higher latitude, twilight may persist throughout the night during some months of the
year. In these abnormal periods, the determination of Fajr and Isha is not possible using the usual
formulas mentioned in the previous section. To overcome this problem, several solutions have been
proposed, three of which are described below.

| Value                  | Description                                                                                                                                                |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `MIDDLE_OF_THE_NIGHT`  | Fajr will never be earlier than the middle of the night and Isha will never be later than the middle of the night                                          |
| `SEVENTH_OF_THE_NIGHT` | Fajr will never be earlier than the beginning of the last seventh of the night and Isha will never be later than the end of the first seventh of the night |
| `TWILIGHT_ANGLE`       | Similar to `SEVENTH_OF_THE_NIGHT`, but instead of 1/7, the fraction of the night used is fajrAngle/60 and ishaAngle/60                                     |

## License

[MIT](https://choosealicense.com/licenses/mit/)


## References

* [PrayTimes.org](http://praytimes.org/calculation)
* [Computing Approximate Solar Coordinates](https://aa.usno.navy.mil/faq/sun_approx)
* [International Astronomical Center](https://www.astronomycenter.net/latitude.html)
* [The Islamic Fiqh Council](https://ar.themwl.org/node/48)