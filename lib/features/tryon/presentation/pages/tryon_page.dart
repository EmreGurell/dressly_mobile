import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/tryon/presentation/bloc/tryon_bloc.dart';
import 'package:ai_try_on/features/tryon/presentation/bloc/tryon_event.dart';
import 'package:ai_try_on/features/tryon/presentation/bloc/tryon_state.dart';
import 'package:ai_try_on/shared/theme/app_colors.dart';
import 'package:ai_try_on/shared/theme/app_sizes.dart';
import 'package:ai_try_on/shared/widgets/app_snackbar.dart';

class TryOnPage extends StatelessWidget {
  final Product? product;
  const TryOnPage({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TryonBloc>(),
      child: _TryOnView(product: product),
    );
  }
}

class _TryOnView extends StatelessWidget {
  final Product? product;
  const _TryOnView({this.product});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TryonBloc, TryonState>(
      listener: (context, state) {
        state.whenOrNull(
          resultSaved: () => AppSnackbar.success(context, 'Görsel galerinize kaydedildi!'),
          error: (msg) => AppSnackbar.error(context, msg),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text('AI Try-On', style: TextStyle(color: Colors.white)),
          actions: [
            BlocBuilder<TryonBloc, TryonState>(
              builder: (context, state) => state.maybeWhen(
                initial: () => const SizedBox.shrink(),
                photoSelected: (_) => TextButton(
                  onPressed: () => context.read<TryonBloc>().add(const TryonEvent.reset()),
                  child: const Text('Sıfırla', style: TextStyle(color: AppColors.white)),
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
        body: BlocBuilder<TryonBloc, TryonState>(
          builder: (context, state) => state.when(
            initial: () => _TryOnBody(product: product, photo: null),
            photoSelected: (photo) => _TryOnBody(product: product, photo: photo),
            loading: (_) => const _LoadingView(),
            success: (result) => _ResultView(
              resultImageUrl: result.resultImageUrl,
              productId: result.productId,
            ),
            resultSaved: () => _ResultView(
              resultImageUrl: '',
              productId: product?.id ?? 0,
            ),
            error: (msg) => _TryOnBody(product: product, photo: null),
          ),
        ),
      ),
    );
  }
}

class _TryOnBody extends StatelessWidget {
  final Product? product;
  final XFile? photo;
  const _TryOnBody({this.product, this.photo});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source, imageQuality: 85);
    if (picked != null && context.mounted) {
      context.read<TryonBloc>().add(TryonEvent.photoSelected(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Product image (top half)
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (product != null)
                CachedNetworkImage(
                  imageUrl: product!.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => const ColoredBox(color: AppColors.grey200),
                  errorWidget: (_, __, ___) => const ColoredBox(color: AppColors.grey300),
                )
              else
                const ColoredBox(color: AppColors.grey200),
              const Positioned(
                top: 12,
                left: 12,
                child: _Label(text: 'Ürün'),
              ),
            ],
          ),
        ),

        const Divider(height: 1, color: AppColors.grey700),

        // User photo area (bottom half)
        Expanded(
          child: photo == null
              ? _PhotoPickerPrompt(
                  onCamera: () => _pickImage(context, ImageSource.camera),
                  onGallery: () => _pickImage(context, ImageSource.gallery),
                )
              : _PhotoPreview(
                  photo: photo!,
                  product: product,
                  onCamera: () => _pickImage(context, ImageSource.camera),
                  onGallery: () => _pickImage(context, ImageSource.gallery),
                ),
        ),
      ],
    );
  }
}

class _PhotoPickerPrompt extends StatelessWidget {
  final VoidCallback onCamera;
  final VoidCallback onGallery;
  const _PhotoPickerPrompt({required this.onCamera, required this.onGallery});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.grey900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhosphorIcon(PhosphorIcons.user(), color: AppColors.grey500, size: 64),
          const SizedBox(height: AppSizes.space16),
          const Text(
            'Fotoğrafını ekle',
            style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSizes.space8),
          const Text(
            'Kamerandan çek veya galerinden seç',
            style: TextStyle(color: AppColors.grey400, fontSize: 13),
          ),
          const SizedBox(height: AppSizes.space24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _PickButton(
                icon: PhosphorIcons.camera(),
                label: 'Kamera',
                onTap: onCamera,
              ),
              const SizedBox(width: AppSizes.space16),
              _PickButton(
                icon: PhosphorIcons.image(),
                label: 'Galeri',
                onTap: onGallery,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PhotoPreview extends StatelessWidget {
  final XFile photo;
  final Product? product;
  final VoidCallback onCamera;
  final VoidCallback onGallery;
  const _PhotoPreview({
    required this.photo,
    required this.product,
    required this.onCamera,
    required this.onGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.file(File(photo.path), fit: BoxFit.cover),
        const Positioned(
          top: 12,
          left: 12,
          child: _Label(text: 'Senin Fotoğrafın'),
        ),
        Positioned(
          bottom: 24,
          left: 16,
          right: 16,
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: product != null
                    ? () => context
                        .read<TryonBloc>()
                        .add(TryonEvent.tryOnRequested(product!.id))
                    : null,
                icon: PhosphorIcon(PhosphorIcons.sparkle(PhosphorIconsStyle.fill)),
                label: const Text('Dene!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: AppSizes.space8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: onCamera,
                    icon: PhosphorIcon(PhosphorIcons.camera(), size: 16, color: AppColors.grey300),
                    label: const Text('Kamera', style: TextStyle(color: AppColors.grey300)),
                  ),
                  TextButton.icon(
                    onPressed: onGallery,
                    icon: PhosphorIcon(PhosphorIcons.image(), size: 16, color: AppColors.grey300),
                    label: const Text('Galeri', style: TextStyle(color: AppColors.grey300)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.primary),
          SizedBox(height: AppSizes.space16),
          Text(
            'AI deneme kıyafet oluşturuyor...',
            style: TextStyle(color: AppColors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _ResultView extends StatelessWidget {
  final String resultImageUrl;
  final int productId;
  const _ResultView({required this.resultImageUrl, required this.productId});

  @override
  Widget build(BuildContext context) {
    if (resultImageUrl.isEmpty) return const SizedBox.shrink();
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: resultImageUrl,
          fit: BoxFit.cover,
          placeholder: (_, __) => const ColoredBox(color: Colors.black),
          errorWidget: (_, __, ___) => const ColoredBox(color: AppColors.grey900),
        ),
        const Positioned(
          top: 12,
          left: 12,
          child: _Label(text: 'Sonuç'),
        ),
        Positioned(
          bottom: 32,
          left: 16,
          right: 16,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => context
                      .read<TryonBloc>()
                      .add(TryonEvent.saveResult(resultImageUrl)),
                  icon: PhosphorIcon(PhosphorIcons.downloadSimple()),
                  label: const Text('Kaydet'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.black,
                    minimumSize: const Size(0, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.space12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => context.read<TryonBloc>().add(const TryonEvent.reset()),
                  icon: PhosphorIcon(PhosphorIcons.arrowCounterClockwise(), color: AppColors.white),
                  label: const Text('Tekrar Dene', style: TextStyle(color: AppColors.white)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.white),
                    minimumSize: const Size(0, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _PickButton extends StatelessWidget {
  final PhosphorIconData icon;
  final String label;
  final VoidCallback onTap;
  const _PickButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.grey800,
              borderRadius: BorderRadius.circular(16),
            ),
            child: PhosphorIcon(icon, color: AppColors.white, size: 28),
          ),
          const SizedBox(height: AppSizes.space8),
          Text(label, style: const TextStyle(color: AppColors.grey300, fontSize: 12)),
        ],
      ),
    );
  }
}
