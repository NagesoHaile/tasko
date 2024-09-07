import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasko/features/settings/services/settings_service.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsService settingsService;
  SettingsBloc(this.settingsService) : super(SettingsState.initialState) {
    on<ThemeChangedEvent>(_themeChangedEventHandler);
    on<GetInitialSettings>(_getInitialSettingsHandler);
    add(GetInitialSettings());
  }

  FutureOr<void> _themeChangedEventHandler(
    ThemeChangedEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await settingsService.changeTheme(event.appTheme);
    emit(state.copyWith(appTheme: event.appTheme));
  }

  FutureOr<void> _getInitialSettingsHandler(
    GetInitialSettings event,
    Emitter<SettingsState> emit,
  ) async {
    AppTheme appTheme = await settingsService.getAppTheme();
    emit(state.copyWith(appTheme: appTheme));
  }
}
