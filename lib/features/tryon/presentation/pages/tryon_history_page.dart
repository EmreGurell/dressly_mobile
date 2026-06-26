import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';
import 'package:ai_try_on/features/tryon/domain/usecases/tryon_usecases.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:ai_try_on/shared/widgets/app_empty_widget.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';

class TryonHistoryPage extends StatelessWidget {
  const TryonHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TryonHistoryView();
  }
}

class _TryonHistoryView extends StatefulWidget {
  const _TryonHistoryView();

  @override
  State<_TryonHistoryView> createState() => _TryonHistoryViewState();
}

class _TryonHistoryViewState extends State<_TryonHistoryView> {
  List<TryonResult>? _items;
  String? _error;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    final result = await sl<ListTryOnsUseCase>()();
    if (!mounted) return;
    result.fold(
      (failure) => setState(() { _error = failure.message; _loading = false; }),
      (items)   => setState(() { _items = items; _loading = false; }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deneme Geçmişi'),
      ),
      body: _loading
          ? const AppLoadingWidget()
          : _error != null
              ? AppErrorWidget(message: _error!, onRetry: _load)
              : _items == null || _items!.isEmpty
                  ? AppEmptyWidget(
                      icon: PhosphorIcons.tShirt(),
                      title: 'Henüz deneme yok',
                      message: 'AI Try-On ile ürünleri üstünde dene!',
                    )
                  : ListView.separated(
                      padding: AppPadding.p16,
                      itemCount: _items!.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: AppSizes.space12),
                      itemBuilder: (context, i) =>
                          _TryonHistoryCard(item: _items![i]),
                    ),
    );
  }
}

class _TryonHistoryCard extends StatelessWidget {
  final TryonResult item;
  const _TryonHistoryCard({required this.item});

  void _openResult(BuildContext context) {
    final url = item.resultImageUrl;
    if (url == null || url.isEmpty) return;
    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (_) => _FullImageDialog(imageUrl: url, title: item.productName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final hasResult = item.resultImageUrl != null && item.resultImageUrl!.isNotEmpty;
    return GestureDetector(
      onTap: hasResult ? () => _openResult(context) : null,
      child: Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: AppRadius.circular12,
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Row(
        children: [
          // Product image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: item.productImageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: item.productImageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    placeholder: (_, __) =>
                        ColoredBox(color: cs.surfaceContainerHighest,
                            child: const SizedBox(width: 100, height: 100)),
                    errorWidget: (_, __, ___) =>
                        ColoredBox(color: cs.surfaceContainerHighest,
                            child: const SizedBox(width: 100, height: 100)),
                  )
                : Container(
                    width: 100,
                    height: 100,
                    color: cs.surfaceContainerHighest,
                  ),
          ),
          const SizedBox(width: AppSizes.space12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.space12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: context.appTextTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: cs.onSurface,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSizes.space4),
                  _StatusChip(status: item.status),
                ],
              ),
            ),
          ),
          // Result thumbnail
          if (item.resultImageUrl != null && item.resultImageUrl!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(AppSizes.space8),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: AppRadius.circular8,
                    child: CachedNetworkImage(
                      imageUrl: item.resultImageUrl!,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => ColoredBox(
                          color: cs.surfaceContainerHighest,
                          child: const SizedBox(width: 72, height: 72)),
                      errorWidget: (_, __, ___) => ColoredBox(
                          color: cs.surfaceContainerHighest,
                          child: const SizedBox(width: 72, height: 72)),
                    ),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: AppRadius.circular4,
                      ),
                      child: const Icon(Icons.zoom_in,
                          color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
            )
          else
            const SizedBox(width: AppSizes.space16),
        ],
      ),
    ),
    );
  }
}

class _FullImageDialog extends StatelessWidget {
  final String imageUrl;
  final String title;
  const _FullImageDialog({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                placeholder: (_, __) => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
                errorWidget: (_, __, ___) => const Icon(
                  Icons.broken_image,
                  color: Colors.white54,
                  size: 64,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black45,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final (label, color) = switch (status) {
      'completed' => ('Tamamlandı', Colors.green),
      'failed' => ('Başarısız', cs.error),
      'processing' => ('İşleniyor', cs.primary),
      _ => ('Bekliyor', cs.onSurfaceVariant),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.space8, vertical: AppSizes.space4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: AppRadius.circular100,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
