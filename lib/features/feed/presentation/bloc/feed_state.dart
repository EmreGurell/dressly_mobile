import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

part 'feed_state.freezed.dart';

@freezed
sealed class FeedState with _$FeedState {
  const factory FeedState.initial() = _Initial;
  const factory FeedState.loading() = _Loading;
  const factory FeedState.loaded({
    required List<Product> products,
    required int currentPage,
    required bool hasMore,
  }) = _Loaded;
  const factory FeedState.error(String message) = _Error;
}
