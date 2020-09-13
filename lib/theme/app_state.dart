import 'package:hive/hive.dart';

part 'app_state.g.dart';

@HiveType(
  typeId: 0,
)
class AppState {
  @HiveField(0)
  bool isDarkModeOn = false;

  void updateTheme(bool isDarkModeOn) {
    this.isDarkModeOn = isDarkModeOn;
  }
}
