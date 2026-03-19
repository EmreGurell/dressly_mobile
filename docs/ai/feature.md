# Feature Ekleme — Clean Architecture Kuralları

## Ne Zaman Bu Dosyaya Bak
- Yeni feature/ekran ekliyorsun
- Mevcut feature'a yeni sayfa, widget, usecase, model ekliyorsun
- "Feature", "clean arch", "katman", "usecase", "repository", "datasource" geçen istekler

---

## Klasör Yapısı

```
features/[feature_name]/
├── data/
│   ├── datasources/
│   │   ├── remote/[feature]_remote_datasource.dart
│   │   ├── local/[feature]_local_datasource.dart
│   │   └── mock/[feature]_mock_datasource.dart
│   ├── models/
│   │   └── [model_name]_model.dart
│   └── repositories/
│       └── [feature]_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── [entity_name].dart
│   ├── repositories/
│   │   └── [feature]_repository.dart
│   └── usecases/
│       └── [usecase_name]_usecase.dart
└── presentation/
    ├── pages/
    │   └── [feature]_page.dart
    ├── widgets/
    │   └── [widget_name]_widget.dart
    └── bloc/                    ← GetX'te: controllers/
        ├── [feature]_bloc.dart
        ├── [feature]_event.dart
        └── [feature]_state.dart
```

---

## Katman Kuralları

### Domain (saf Dart — bağımlılık yok)
- Entity: `freezed` ile tanımla, JSON bağımlılığı yok.
- Repository interface: sadece abstract method tanımı.
- UseCase: tek sorumluluk, `Either<Failure, T>` döner.

```dart
class GetUserUseCase {
  final UserRepository _repository;
  GetUserUseCase(this._repository);

  Future<Either<Failure, User>> call(String userId) =>
      _repository.getUser(userId);
}
```

### Data (dış dünya — API, local)
- Model: `toEntity()` metodu içerir. `freezed` + `json_serializable` kullan.
- Datasource: sadece ham veriyi alır, iş mantığı yok, try/catch yok.
- Repository impl: exception'ı `Left(Failure)` ile sarar.

```dart
@override
Future<Either<Failure, User>> getUser(String userId) async {
  try {
    final model = await _remoteDataSource.getUser(userId);
    return Right(model.toEntity());
  } on AppException catch (e) {
    return Left(e.toFailure());
  }
}
```

### Presentation (UI)
- Sadece Bloc/Controller state'ini dinler, iş mantığı içermez.
- Büyüyen widget `widgets/` klasörüne taşınır.

---

## Hata Yönetimi

```dart
abstract class AppException implements Exception {
  Failure toFailure();
}

class NetworkException extends AppException {
  @override
  Failure toFailure() => NetworkFailure(message: toString());
}
```

---

## Checklist — Yeni Feature

- [ ] `features/[name]/` klasörü oluşturuldu
- [ ] Entity tanımlandı (domain/entities/)
- [ ] Repository interface tanımlandı (domain/repositories/)
- [ ] UseCase(lar) yazıldı (domain/usecases/)
- [ ] Model yazıldı, `toEntity()` eklendi (data/models/)
- [ ] Remote datasource yazıldı (data/datasources/remote/)
- [ ] Repository impl yazıldı (data/repositories/)
- [ ] Bloc/Controller yazıldı
- [ ] DI kaydı yapıldı
- [ ] Route eklendi (core/router/)

