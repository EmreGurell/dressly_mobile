# 📱 AI Try-On — Mobile (Flutter) Documentation
> Task-Based Development Guide

---

## 1. Genel Bakış

AI Try-On uygulamasının Flutter mobile geliştirme sürecini task bazlı olarak açıklar. Her task bağımsız olarak tamamlanabilir ve bir sonraki task'a geçmeden önce test edilmelidir.

**Tech Stack:**
- Flutter (Dart) — Mobile framework
- Clean Architecture + BLoC — Mimari ve state management
- go_router — Navigasyon
- get_it — Dependency injection
- dio — HTTP client
- Google Sign-In + Sign in with Apple — Authentication

---

## 2. Mimari

### 2.1 Klasör Yapısı
```
lib/
├── core/               # Shared utilities, theme, constants
└── features/
    ├── auth/           # Login, Google/Apple sign-in
    ├── feed/           # TikTok tarzı ürün akışı
    ├── product/        # Ürün detay sayfası
    ├── brand/          # Marka katalog sayfası
    ├── saved/          # Kaydedilen ürünler
    ├── tryon/          # AI Try-On ekranı
    └── profile/        # Kullanıcı profili
```


## 3. Task Listesi

### 📦 Phase 1 — Proje Kurulumu

| # | Task | Açıklama | Durum |
|---|------|----------|-------|
| 1 | Flutter projesini starter pack ile oluştur | new_project.sh çalıştır, Bloc versiyonunu seç | ✅ DONE |
| 2 | Bağımlılıkları pubspec.yaml'a ekle | dio, flutter_bloc, go_router, get_it, google_sign_in, sign_in_with_apple | ✅ DONE |
| 3 | flutter pub get çalıştır | Tüm paketleri indir | ✅ DONE |
| 4 | build_runner çalıştır | dart run build_runner build --delete-conflicting-outputs | ✅ DONE |
| 5 | Klasör yapısını oluştur | core/ ve features/ altında tüm klasörleri oluştur | ✅ DONE |
| 6 | Theme ve renk paletini tanımla | AppTheme, AppColors, AppTextStyles | ✅ DONE |
| 7 | AppRouter'ı kur (go_router) | Tüm route'ları tanımla | ✅ DONE |
| 8 | DI (get_it) setup | ServiceLocator'ı yapılandır, tüm dependency'leri register et | ✅ DONE |

---

### 🔐 Phase 2 — Authentication

| # | Task | Açıklama | Durum |
|---|------|----------|-------|
| 9 | Auth feature klasör yapısını oluştur | domain/entities, data/models, presentation/screens | ✅ DONE |
| 10 | UserEntity oluştur | id, email, displayName, photoUrl | ✅ DONE |
| 11 | AuthRepository interface tanımla | signInWithGoogle(), signInWithApple(), signOut() | ✅ DONE |
| 12 | AuthRepositoryImpl yaz | Google ve Apple sign-in implementasyonu | ✅ DONE |
| 13 | AuthBloc oluştur | AuthEvent, AuthState, AuthBloc | ✅ DONE |
| 14 | Login ekranını tasarla | Google ve Apple butonları, logo | ✅ DONE |
| 15 | Google Sign-In entegre et | google_sign_in paketi ile | ✅ DONE |
| 16 | Apple Sign-In entegre et | sign_in_with_apple paketi ile | ✅ DONE |
| 17 | Token'ı secure storage'a kaydet | flutter_secure_storage kullan | ✅ DONE |
| 18 | Auto-login kontrolü yap | Uygulama açılışında token kontrolü | ✅ DONE |

---

### 📰 Phase 3 — Feed (TikTok Style)

| # | Task | Açıklama | Durum |
|---|------|----------|-------|
| 19 | ProductEntity oluştur | id, brand, name, price, imageUrl, productUrl, category | ✅ DONE |
| 20 | FeedRepository interface tanımla | getFeed(page), likeProduct(), saveProduct() | ✅ DONE |
| 21 | FeedRepositoryImpl yaz | Django API'den veri çek | ✅ DONE |
| 22 | FeedBloc oluştur | FeedEvent, FeedState, FeedBloc | ✅ DONE |
| 23 | Sayfa bazlı feed ekranını yap | PageView.builder ile dikey scroll | ✅ DONE |
| 24 | ProductCard widget'ını tasarla | Görsel, marka, fiyat, butonlar | ✅ DONE |
| 25 | Like butonu ve animasyonunu ekle | Kalp animasyonu, API call | ✅ DONE |
| 26 | Save butonu ekle | Bookmark animasyonu, API call | ✅ DONE |
| 27 | AI Try-On butonunu ekle | Kamera ikonu, try-on sayfasına yönlendir | ✅ DONE |
| 28 | Infinite scroll / pagination yap | Sayfa sonuna gelince yeni data çek | ✅ DONE |
| 29 | Loading ve error state'lerini ekle | Shimmer loading, hata mesajı | ✅ DONE |

---

### 🏪 Phase 4 — Brand Catalog

| # | Task | Açıklama | Durum |
|---|------|----------|-------|
| 30 | BrandEntity oluştur | id, name, logoUrl, productCount | ✅ DONE |
| 31 | BrandRepository interface tanımla | getBrands(), getBrandProducts(id) | ✅ DONE |
| 32 | BrandBloc oluştur | BrandEvent, BrandState, BrandBloc + BrandDetailBloc | ✅ DONE |
| 33 | Markalar listesi ekranını yap | Grid veya liste görünümü | ✅ DONE |
| 34 | Marka detay sayfasını tasarla | Logo, kategori filtreleri, ürün grid | ✅ DONE |
| 35 | Kategori filtrelerini ekle | Yatay scroll filter chips | ✅ DONE |
| 36 | Ürün grid'ini paginate et | Sonsuz kaydırma | ✅ DONE |

---

### 💾 Phase 5 — Save System

| # | Task | Açıklama | Durum |
|---|------|----------|-------|
| 37 | SavedRepository interface tanımla | getSaved(), removeSaved() | ✅ DONE |
| 38 | SavedBloc oluştur | SavedEvent, SavedState | ✅ DONE |
| 39 | Kaydedilenler ekranını tasarla | Wishlist ve Outfit Ideas sekmeleri | ✅ DONE |
| 40 | Collection tab'larını ekle | TabBar, TabBarView | ✅ DONE |
| 41 | Ürün kaldırma özelliğini ekle | Swipe to delete veya uzun bas | ✅ DONE |

---

### 🤖 Phase 6 — AI Try-On

| # | Task | Açıklama | Durum |
|---|------|----------|-------|
| 42 | TryOnRepository interface tanımla | tryOn(userPhoto, productId) | ✅ DONE |
| 43 | TryOnBloc oluştur | TryOnEvent, TryOnState | ✅ DONE |
| 44 | Try-On ekranını tasarla | Fotoğraf alanı, ürün görseli, sonuç alanı | ✅ DONE |
| 45 | Kameradan fotoğraf alma özelliği | image_picker paketi | ✅ DONE |
| 46 | Galeriden fotoğraf seçme özelliği | image_picker paketi | ✅ DONE |
| 47 | API'ye fotoğraf gönder | Multipart form data ile | ✅ DONE |
| 48 | Sonuç görselini göster | Loading animasyonu, sonuç ekranı | ✅ DONE |
| 49 | Sonucu kaydetme özelliği ekle | Galeriye kaydet | ✅ DONE |

---

### 👤 Phase 7 — Profil & Navigasyon

| # | Task | Açıklama | Durum |
|---|------|----------|-------|
| 50 | Bottom navigation bar yap | Feed, Brands, Saved, Profile | ✅ DONE |
| 51 | Profil ekranını tasarla | Avatar, isim, istatistikler | ✅ DONE |
| 52 | Çıkış yapma özelliğini ekle | Logout, token sil | ✅ DONE |
| 53 | Dark/Light mode desteği ekle | ThemeBloc, sistem temasına göre | ✅ DONE |

---

### 🚀 Phase 8 — Polish & Deploy

| # | Task | Açıklama | Durum |
|---|------|----------|-------|
| 54 | Error handling geliştir | Global error handler, retry mekanizması | 📋 TODO |
| 55 | Offline desteği ekle | Hive veya local cache ile | 📋 TODO |
| 56 | App ikonu ve splash screen | flutter_launcher_icons, flutter_native_splash | 📋 TODO |
| 57 | iOS için Info.plist izinleri | Kamera, galeri izinleri | 📋 TODO |
| 58 | flutter doctor çalıştır | Tüm hataları çöz | 📋 TODO |
| 59 | TestFlight'a yükle (iOS) | Xcode Archive ile | 📋 TODO |
| 60 | App Store'a gönder | App Store Connect | 📋 TODO |

---

## 4. API Endpoint Referansı

| Method | Endpoint | Açıklama |
|--------|----------|----------|
| POST | /auth/google | Google token ile giriş |
| POST | /auth/apple | Apple token ile giriş |
| GET | /feed?page=1 | Ürün feed'i |
| GET | /products/{id} | Ürün detayı |
| GET | /brands | Marka listesi |
| GET | /brands/{id}/products | Marka ürünleri |
| POST | /like | Ürün beğen |
| POST | /save | Ürün kaydet |
| GET | /saved | Kaydedilen ürünler |
| POST | /tryon | AI Try-On |

---

## 5. Önemli Notlar

- Her task'ı tamamladıktan sonra `flutter run` ile test et
- BLoC test'lerini task tamamlanınca yaz
- API base URL'i `.env` dosyasında tut (`flutter_dotenv`)
- Image caching için `cached_network_image` kullan
- Google Sign-In için Firebase projesi gerekebilir
- Apple Sign-In sadece iOS 13+ cihazlarda çalışır