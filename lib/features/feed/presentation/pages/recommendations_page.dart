import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/feed/domain/usecases/feed_usecases.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:ai_try_on/shared/widgets/app_empty_widget.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';
import 'package:ai_try_on/shared/widgets/catalog_product_card.dart';

class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({super.key});

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  List<Product>? _products;
  String? _error;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    final result = await sl<GetRecommendationsUseCase>()();
    if (!mounted) return;
    result.fold(
      (f) => setState(() { _error = f.message; _loading = false; }),
      (p) => setState(() { _products = p; _loading = false; }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sana Özel')),
      body: _loading
          ? const AppLoadingWidget()
          : _error != null
              ? AppErrorWidget(message: _error!, onRetry: _load)
              : (_products == null || _products!.isEmpty)
                  ? AppEmptyWidget(
                      icon: PhosphorIcons.sparkle(),
                      title: 'Henüz öneri yok',
                      message:
                          'Ürünleri beğen ve kaydet, öneriler otomatik gelişir.',
                    )
                  : GridView.builder(
                      padding: AppPadding.p16,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppSizes.space12,
                        mainAxisSpacing: AppSizes.space12,
                        mainAxisExtent: 320,
                      ),
                      itemCount: _products!.length,
                      itemBuilder: (_, i) =>
                          CatalogProductCard(product: _products![i]),
                    ),
    );
  }
}
