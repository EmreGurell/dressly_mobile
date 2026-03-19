import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';

part 'tryon_model.freezed.dart';
part 'tryon_model.g.dart';

@freezed
sealed class TryonResultModel with _$TryonResultModel {
  const factory TryonResultModel({
    required int id,
    @JsonKey(name: 'result_image_url') required String resultImageUrl,
    @JsonKey(name: 'product_id') required int productId,
  }) = _TryonResultModel;

  factory TryonResultModel.fromJson(Map<String, dynamic> json) =>
      _$TryonResultModelFromJson(json);
}

extension TryonResultModelX on TryonResultModel {
  TryonResult toEntity() => TryonResult(
        id: id,
        resultImageUrl: resultImageUrl,
        productId: productId,
      );
}
