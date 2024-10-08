part of 'settings_bloc.dart';

class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends SettingsEvent {
  final AppTheme appTheme;
  const ThemeChangedEvent({required this.appTheme});
}

class GetInitialSettings extends SettingsEvent {}
