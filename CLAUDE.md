# CLAUDE.md — Ouranos Bloc Starter

Bu proje **Feature-based Clean Architecture** + **Bloc** kullanır.
DI: `get_it` | Router: `go_router` | Serialization: `freezed` + `json_serializable`

---
## Proje Dökümanları

- Mobile (Flutter) task listesi: `mobile_doc.md`

Bu dosyaları her zaman oku ve task'lara göre geliştirme yap.
Bir task tamamlandığında ilgili dosyada durumu ✅ DONE olarak güncelle.
## 📚 Detaylı Kurallar

| Konu | Dosya |
|---|---|
| Theme & design system | `docs/ai/theme.md` |
| Feature ekleme (clean arch) | `docs/ai/feature.md` |
| Network / API katmanı | `docs/ai/network.md` |
| State management (Bloc) | `docs/ai/state_management.md` |
| Navigation / routing | `docs/ai/navigation.md` |
| Naming conventions | `docs/ai/naming.md` |

---

## ⚡ Hızlı Kurallar (Her Zaman Geçerli)

- `freezed` + `json_serializable` kullan — manuel `fromJson/toJson` yazma.
- `dartz` Either kullan — `Left(Failure)` / `Right(data)` dön.
- Her özel exception `AppException` extend eder (`core/error/`).
- Ham renk, padding, radius, size kullanma — `AppColors`, `AppPadding`, `AppRadius`, `AppSizes` kullan.
- Route string sayfada yazma — `AppRoutes` kullan.
- İş mantığı Bloc'ta, UI sadece state'i dinler.

### Import
```dart
import 'package:ai_try_on/core/theme/theme.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_router.dart';
```

---

## 📁 Proje Yapısı

```
lib/
├── features/
│   └── [feature]/
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── remote/
│       │   │   ├── local/
│       │   │   └── mock/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── pages/
│           ├── widgets/
│           └── bloc/
├── core/
│   ├── network/
│   ├── error/
│   ├── router/
│   ├── di/
│   ├── constants/
│   ├── extensions/
│   └── utils/
│       ├── logger/
│       ├── helpers/
│       └── device/
├── shared/
│   ├── widgets/
│   ├── theme/
│   ├── services/
│   └── enums/
└── l10n/
```

