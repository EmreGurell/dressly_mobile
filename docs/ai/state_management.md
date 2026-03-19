# State Management — Bloc

## Ne Zaman Bu Dosyaya Bak
- Bloc veya Cubit yazıyorsun
- State, event, emit tanımlıyorsun
- "Bloc", "Cubit", "state", "event", "emit" geçen istekler

---

## Dosya Yapısı

```
presentation/bloc/
├── [feature]_bloc.dart
├── [feature]_event.dart
└── [feature]_state.dart
```

---

## Event

```dart
@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUser(String id) = _GetUser;
  const factory UserEvent.updateUser(User user) = _UpdateUser;
}
```

## State

```dart
@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded(User user) = _Loaded;
  const factory UserState.error(String message) = _Error;
}
```

## Bloc

```dart
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase _getUserUseCase;

  UserBloc(this._getUserUseCase) : super(const UserState.initial()) {
    on<UserEvent>((event, emit) async {
      await event.when(
        getUser: (id) => _onGetUser(id, emit),
        updateUser: (user) => _onUpdateUser(user, emit),
      );
    });
  }

  Future<void> _onGetUser(String id, Emitter<UserState> emit) async {
    emit(const UserState.loading());
    final result = await _getUserUseCase(id);
    result.fold(
      (failure) => emit(UserState.error(failure.message)),
      (user) => emit(UserState.loaded(user)),
    );
  }
}
```

## UI

```dart
BlocBuilder<UserBloc, UserState>(
  builder: (context, state) => state.when(
    initial: () => const SizedBox(),
    loading: () => const AppLoadingWidget(),
    loaded: (user) => UserContent(user: user),
    error: (message) => AppErrorWidget(message: message),
  ),
)
```

## DI (get_it)

```dart
sl.registerFactory(() => UserBloc(sl()));
```

```dart
BlocProvider(
  create: (_) => sl<UserBloc>()..add(const UserEvent.getUser(userId)),
  child: const UserPage(),
)
```

## Kurallar
- State `freezed` sealed union ile tanımlanır.
- İş mantığı Bloc'ta, UI sadece state'i dinler.
- UseCase her zaman kullanılır, repository doğrudan çağrılmaz.

