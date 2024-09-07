import 'package:tasko/core/helper/localdb.dart';
import 'package:tasko/injector.dart';

class SettingsService {
  Future<LocalDB> get localDB => sl.getAsync<LocalDB>();

  /// [newTheme]  should be in this set {'light','dark','system'}

  Future<void> changeTheme(AppTheme newTheme) async {
    String sql = """
       UPDATE UserInfo SET theme = ?
    """;

    await (await localDB).db.rawUpdate(sql, [newTheme.toJson()]);
  }

  Future<AppTheme> getAppTheme() async {
    String sql = """
     SELECT theme FROM UserInfo
""";

    List<Map<String, Object?>> result = await (await localDB).db.rawQuery(sql);
    return AppTheme.fromJson(result.first.values.first as String);
  }
}

enum AppTheme {
  light,
  dark,
  system;

  String toJson() {
    switch (this) {
      case AppTheme.light:
        return 'LIGHT';
      case AppTheme.dark:
        return 'DARK';
      case AppTheme.system:
      default:
        return 'SYSTEM';
    }
  }

  static AppTheme fromJson(String? appTheme) {
    switch (appTheme) {
      case 'LIGHT':
        return AppTheme.light;
      case 'DARK':
        return AppTheme.dark;
      case 'SYSTEM':
      default:
        return AppTheme.system;
    }
  }
}
