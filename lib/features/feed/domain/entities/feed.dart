import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed.freezed.dart';

@freezed
sealed class Feed with _$Feed {
  const factory Feed({
    required String id,
    // TODO: Add fields
  }) = _Feed;
}

