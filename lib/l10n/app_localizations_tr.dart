// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Dressly';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get errorOccurred => 'Bir hata oluştu';

  @override
  String get noContent => 'İçerik bulunamadı';

  @override
  String get cancel => 'İptal';

  @override
  String get save => 'Kaydet';

  @override
  String get ok => 'Tamam';

  @override
  String get confirm => 'Onayla';

  @override
  String get remove => 'Kaldır';

  @override
  String get searchProducts => 'Ürün ara...';

  @override
  String get allCategories => 'Tümü';

  @override
  String productCount(int count) {
    return '$count ürün';
  }

  @override
  String priceTl(String price) {
    return '$price TL';
  }

  @override
  String get navFeed => 'Keşfet';

  @override
  String get navBrands => 'Markalar';

  @override
  String get navSaved => 'Kaydedilenler';

  @override
  String get navProfile => 'Profil';

  @override
  String get loginTitle => 'Giriş Yap';

  @override
  String get loginSubtitle => 'Hesabına erişmek için\nbilgilerini gir.';

  @override
  String get loginWithGoogle => 'Google ile Giriş Yap';

  @override
  String get loginWithApple => 'Apple ile Giriş Yap';

  @override
  String get loginWithEmail => 'E-posta ile giriş yap';

  @override
  String get email => 'E-posta';

  @override
  String get password => 'Şifre';

  @override
  String get emailRequired => 'E-posta gerekli';

  @override
  String get passwordRequired => 'Şifre gerekli';

  @override
  String get forgotPassword => 'Şifremi unuttum';

  @override
  String get noAccount => 'Hesabın yok mu? ';

  @override
  String get registerTitle => 'Hesap Oluştur';

  @override
  String get registerSubtitle =>
      'Moda dünyasına katılmak için\nbilgilerini gir.';

  @override
  String get fullName => 'Ad Soyad';

  @override
  String get nameRequired => 'Ad gerekli';

  @override
  String get passwordMinLength => 'En az 6 karakter gerekli';

  @override
  String get alreadyHaveAccount => 'Zaten hesabın var mı? ';

  @override
  String get register => 'Kayıt Ol';

  @override
  String get brandsTitle => 'Markalar';

  @override
  String get allProductsTitle => 'Tüm Ürünler';

  @override
  String get allBrandsBanner => 'Tümü';

  @override
  String get tryOn => 'Dene';

  @override
  String get buyNow => 'Satın Al';

  @override
  String get tryOnTitle => 'AI Try-On';

  @override
  String get tryOnReset => 'Sıfırla';

  @override
  String get tryOnStarting => 'AI deneme başlatılıyor...';

  @override
  String get tryOnProcessing => 'AI kıyafet işleniyor...';

  @override
  String get tryOnQueued => 'Sıraya alındı, bekleniyor...';

  @override
  String get tryOnSaved => 'Görsel galerinize kaydedildi!';

  @override
  String get tryOnAddPhoto => 'Fotoğrafını ekle';

  @override
  String get tryOnAddPhotoSubtitle => 'Kameradan çek veya galerinden seç';

  @override
  String get tryOnProduct => 'Ürün';

  @override
  String get tryOnYourPhoto => 'Senin Fotoğrafın';

  @override
  String get tryOnResult => 'Sonuç';

  @override
  String get tryOnTryButton => 'Dene!';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galeri';

  @override
  String get savedTitle => 'Wishlist';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileLoadError => 'Profil yüklenemedi';

  @override
  String get profileDefaultName => 'Kullanıcı';

  @override
  String get subscription => 'Abonelik';

  @override
  String get manageSubscription => 'Planını yönet';

  @override
  String get measurements => 'Ölçülerim';

  @override
  String get measurementsSubtitle => 'Boy, kilo, beden';

  @override
  String get measurementsTitle => 'Ölçülerim';

  @override
  String get measurementsDescription =>
      'Daha iyi sonuçlar için ölçülerini gir.';

  @override
  String get height => 'Boy';

  @override
  String get weight => 'Kilo';

  @override
  String get chest => 'Göğüs';

  @override
  String get waist => 'Bel';

  @override
  String get hips => 'Kalça';

  @override
  String get size => 'Beden';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get theme => 'Tema';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get logout => 'Çıkış Yap';
}
