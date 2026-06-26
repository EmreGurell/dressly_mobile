import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';

part 'tryon_model.freezed.dart';
part 'tryon_model.g.dart';

@freezed
sealed class TryonResultModel with _$TryonResultModel {
  const factory TryonResultModel({
    required int id,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_image_url') required String productImageUrl,
    @JsonKey(name: 'user_photo_url') required String userPhotoUrl,
    required String status,
    @JsonKey(name: 'result_image_url') String? resultImageUrl,
    @JsonKey(name: 'error_message') String? errorMessage,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _TryonResultModel;

  factory TryonResultModel.fromJson(Map<String, dynamic> json) =>
      _$TryonResultModelFromJson(json);
}

extension TryonResultModelX on TryonResultModel {
  TryonResult toEntity() => TryonResult(
        id: id,
        productId: productId,
        productName: productName,
        productImageUrl: productImageUrl,
        userPhotoUrl: userPhotoUrl,
        status: status,
        resultImageUrl: resultImageUrl,
        errorMessage: errorMessage,
        createdAt: createdAt,
      );
}
