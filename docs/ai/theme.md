# Theme & Design System

## Ne Zaman Bu Dosyaya Bak
- Renk ekleme/değiştirme (primary, success, warning, card, shimmer)
- Padding / radius / size sabiti kullanma veya ekleme
- Text style kullanma veya ekleme
- ThemeExtension veya MaterialApp theme değişikliği
- "Tema", "AppTheme", "AppColors", "AppPadding", "AppRadius", "appTheme" geçen her istek

---

## Kurallar

### 1. Import
```dart
import 'package:ouranos_bloc/core/theme/theme.dart';
```
Tek import — tüm tema dosyaları buradan export edilir.

### 2. Renk
```dart
// MaterialTheme renkleri
Theme.of(context).colorScheme.primary
Theme.of(context).colorScheme.error
Theme.of(context).colorScheme.surface

// Custom extension renkleri
context.appTheme.success
context.appTheme.warning
context.appTheme.cardBackground
context.appTheme.shimmerBase
context.appTheme.shimmerHighlight
```
❌ Asla `Colors.blue`, `Color(0xFF...)` gibi ham renk kullanma.

### 3. Padding
```dart
AppPadding.p16
AppPadding.horizontal16
AppPadding.vertical8
```
❌ Asla `EdgeInsets.all(16)` gibi sabit sayı kullanma.

### 4. Sayfa Padding / Margin
```dart
AppPagePadding.all20()
AppPagePadding.horizontalSymmetric()
AppPagePadding.marginBottom15()
AppPagePadding.horizontalSymmetricFree(24)
```

### 5. Radius
```dart
AppRadius.circular12
AppRadius.top8
```

### 6. Metin Stili
```dart
Theme.of(context).textTheme.titleLarge
context.appTextTheme.bodyMedium
AppTextStyles.bodyMedium
```

### 7. Boyut
```dart
AppSizes.iconMedium
AppSizes.buttonHeightMedium
```

### 8. Metin Widget
```dart
ProductText.h1(context, 'Başlık')
ProductText.bodyMedium(context, 'Metin')
```

---

## Hızlı Eşleme

| İstek / Bağlam | Kullan |
|---|---|
| Primary / error / surface rengi | `Theme.of(context).colorScheme.*` |
| Başarı / uyarı / bilgi / kart / shimmer | `context.appTheme.*` |
| Boşluk | `AppPadding.*` |
| Sayfa boşluk / margin | `AppPagePadding.all20()` vb. |
| Köşe yuvarlama | `AppRadius.*` |
| İkon / buton yüksekliği | `AppSizes.*` |
| Metin stili | `context.appTextTheme.*` |
| Metin widget | `ProductText.h1(context, '...')` |

---

## Yeni Şey Ekleme

- Yeni renk → `app_theme_extension.dart`: alan ekle, light/dark değer ver, copyWith ve lerp güncelle.
- Yeni padding/radius → `app_padding.dart` / `app_radius.dart`: static getter ekle.
- Yeni sayfa padding → `app_page_padding.dart`: const constructor ekle.
- Yeni size → `app_sizes.dart`: static const double ekle.
- Yeni text style → `app_text_styles.dart`: getter ekle, textTheme'e bağla.

---

## Dosya Konumları

```
lib/core/theme/
├── theme.dart
├── app_theme.dart
├── app_theme_extension.dart
├── app_colors.dart
├── app_text_styles.dart
├── app_padding.dart
├── app_page_padding.dart
├── app_radius.dart
└── app_sizes.dart
```

> Tüm sabitler için proje kökündeki `theme.md` dosyasına bak.

