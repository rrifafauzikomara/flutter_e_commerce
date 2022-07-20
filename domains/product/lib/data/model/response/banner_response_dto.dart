class BannerResponseDTO {
  BannerResponseDTO({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final List<BannerDataDTO>? data;

  factory BannerResponseDTO.fromJson(Map<String, dynamic> json) =>
      BannerResponseDTO(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<BannerDataDTO>.from(
            json["data"].map((x) => BannerDataDTO.fromJson(x))),
      );
}

class BannerDataDTO {
  BannerDataDTO({
    this.id,
    this.name,
    this.headline,
    this.caption,
    this.imageUrl,
    this.sellerId,
    this.productId,
  });

  final String? id;
  final String? name;
  final String? headline;
  final String? caption;
  final String? imageUrl;
  final String? sellerId;
  final String? productId;

  factory BannerDataDTO.fromJson(Map<String, dynamic> json) => BannerDataDTO(
        id: json["id"],
        name: json["name"],
        headline: json["headline"],
        caption: json["caption"],
        imageUrl: json["image_url"],
        sellerId: json["seller_id"],
        productId: json["product_id"],
      );
}
