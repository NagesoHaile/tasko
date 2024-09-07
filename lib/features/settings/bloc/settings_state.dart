part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.appTheme});

  final AppTheme appTheme;
  static const initialState = SettingsState(appTheme: AppTheme.light);
  @override
  List<Object> get props => [appTheme];

  SettingsState copyWith({
    AppTheme? appTheme,
  }) {
    return SettingsState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
