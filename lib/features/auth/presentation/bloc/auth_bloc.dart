import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/features/auth/domain/usecases/auth_usecases.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_event.dart';
import 'package:ai_try_on/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  final LoginWithAppleUseCase _loginWithAppleUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetMeUseCase _getMeUseCase;
  final UpdateMeasurementsUseCase _updateMeasurementsUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required LoginWithGoogleUseCase loginWithGoogleUseCase,
    required LoginWithAppleUseCase loginWithAppleUseCase,
    required LogoutUseCase logoutUseCase,
    required GetMeUseCase getMeUseCase,
    required UpdateMeasurementsUseCase updateMeasurementsUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
  })  : _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        _loginWithGoogleUseCase = loginWithGoogleUseCase,
        _loginWithAppleUseCase = loginWithAppleUseCase,
        _logoutUseCase = logoutUseCase,
        _getMeUseCase = getMeUseCase,
        _updateMeasurementsUseCase = updateMeasurementsUseCase,
        _forgotPasswordUseCase = forgotPasswordUseCase,
        super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        loginRequested: (email, password) => _onLogin(email, password, emit),
        registerRequested: (email, password, name) =>
            _onRegister(email, password, name, emit),
        loginWithGoogleRequested: () => _onLoginWithGoogle(emit),
        loginWithAppleRequested: () => _onLoginWithApple(emit),
        logoutRequested: () => _onLogout(emit),
        getMeRequested: () => _onGetMe(emit),
        forgotPasswordRequested: (email) => _onForgotPassword(email, emit),
        updateMeasurementsRequested: (gender, heightCm, weightKg, chestCm, waistCm, hipsCm) =>
            _onUpdateMeasurements(gender, heightCm, weightKg, chestCm, waistCm, hipsCm, emit),
      );
    });
  }

  Future<void> _onLogin(
    String email,
    String password,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(email: email, password: password);
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onRegister(
    String email,
    String password,
    String name,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _registerUseCase(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onLogout(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _logoutUseCase();
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> _onLoginWithGoogle(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _loginWithGoogleUseCase();
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onLoginWithApple(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _loginWithAppleUseCase();
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onForgotPassword(
    String email,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _forgotPasswordUseCase(email);
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.forgotPasswordSent()),
    );
  }

  Future<void> _onGetMe(Emitter<AuthState> emit) async {
    final result = await _getMeUseCase();
    result.fold(
      (_) => emit(const AuthState.unauthenticated()),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onUpdateMeasurements(
    String? gender,
    int? heightCm,
    int? weightKg,
    int? chestCm,
    int? waistCm,
    int? hipsCm,
    Emitter<AuthState> emit,
  ) async {
    final currentUser = state.whenOrNull(authenticated: (u) => u);
    final result = await _updateMeasurementsUseCase(
      gender: gender,
      heightCm: heightCm,
      weightKg: weightKg,
      chestCm: chestCm,
      waistCm: waistCm,
      hipsCm: hipsCm,
    );
    result.fold(
      (_) {
        // Hata olursa mevcut authenticated state'de kal
        if (currentUser != null) emit(AuthState.authenticated(currentUser));
      },
      (user) => emit(AuthState.authenticated(user)),
    );
  }
}

