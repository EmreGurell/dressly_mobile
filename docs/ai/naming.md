# Naming Conventions

## Ne Zaman Bu Dosyaya Bak
- Yeni dosya, class, değişken, metod adı koyuyorsun
- "İsimlendirme", "naming", "convention" geçen istekler

---

## Dosya İsimlendirme

| Tür | Format | Örnek |
|---|---|---|
| Dart dosyası | `snake_case.dart` | `user_profile_page.dart` |
| Model | `[name]_model.dart` | `user_model.dart` |
| Entity | `[name].dart` | `user.dart` |
| UseCase | `[verb]_[noun]_usecase.dart` | `get_user_usecase.dart` |
| Repository interface | `[feature]_repository.dart` | `user_repository.dart` |
| Repository impl | `[feature]_repository_impl.dart` | `user_repository_impl.dart` |
| Datasource interface | `[feature]_remote_datasource.dart` | `user_remote_datasource.dart` |
| Datasource impl | `[feature]_remote_datasource_impl.dart` | `user_remote_datasource_impl.dart` |
| Bloc | `[feature]_bloc.dart` | `user_bloc.dart` |
| Event | `[feature]_event.dart` | `user_event.dart` |
| State | `[feature]_state.dart` | `user_state.dart` |
| GetX Controller | `[feature]_controller.dart` | `user_controller.dart` |
| Page | `[feature]_page.dart` | `user_profile_page.dart` |
| Widget | `[name]_widget.dart` | `user_card_widget.dart` |

---

## Class İsimlendirme

| Tür | Format | Örnek |
|---|---|---|
| Model | `PascalCase` + `Model` | `UserModel` |
| Entity | `PascalCase` | `User` |
| UseCase | `PascalCase` + `UseCase` | `GetUserUseCase` |
| Repository interface | `PascalCase` + `Repository` | `UserRepository` |
| Repository impl | `PascalCase` + `RepositoryImpl` | `UserRepositoryImpl` |
| Bloc | `PascalCase` + `Bloc` | `UserBloc` |
| GetX Controller | `PascalCase` + `Controller` | `UserController` |
| Page | `PascalCase` + `Page` | `UserProfilePage` |
| Widget | `PascalCase` + `Widget` | `UserCardWidget` |
| Exception | `PascalCase` + `Exception` | `NetworkException` |
| Failure | `PascalCase` + `Failure` | `NetworkFailure` |

---

## Değişken & Metod

```dart
// değişken — camelCase
final userName = 'John';

// private — _ prefix
final _repository = UserRepository();

// Rx (GetX) — .obs suffix
final _isLoading = false.obs;
final _user = Rxn<User>();

// bool — is/has/can prefix
bool isLoading = false;
bool hasError = false;

// metod — fiil ile başla
Future<void> getUser() async {}
void _handleError() {}

// event factory (freezed) — fiil ile başla
const factory UserEvent.getUser(String id) = _GetUser;
```

---

## Genel Kurallar

- Abbreviation kullanma: `btn` ❌ → `button` ✅
- Belirsiz isim verme: `data` ❌ → `user` ✅
- Suffix tutarlılığı: her zaman `Page`, `Widget`, `Model`, `UseCase` ekle.
- Feature klasörü: `snake_case` tekil — `user_profile` ✅, `products` ❌
- Test dosyası: `[dosya_adı]_test.dart`

