import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_event.freezed.dart';

@freezed
sealed class FeedEvent with _$FeedEvent {
  const factory FeedEvent.loadFeed() = _LoadFeed;
  const factory FeedEvent.refreshFeed() = _RefreshFeed;
  const factory FeedEvent.loadMoreFeed() = _LoadMoreFeed;
  const factory FeedEvent.likeProduct(int productId) = _LikeProduct;
  const factory FeedEvent.saveProduct(int productId) = _SaveProduct;
}
