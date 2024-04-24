class Product {
  final int? id;
  final String? brand;
  final String? name;
  final String? price;
  final String? priceSign;
  final String? currency;
  final String? imageLink;
  final String? productLink;
  final String? websiteLink;
  final String? description;
  final double? rating;
  final String? category;
  final String? productType;
  final List<dynamic>? tagList;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? productApiUrl;
  final String? apiFeaturedImage;
  final List<ProductColor>? productColors;

  Product({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        priceSign: json["price_sign"],
        currency: json["currency"],
        imageLink: json["image_link"],
        productLink: json["product_link"],
        websiteLink: json["website_link"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        category: json["category"],
        productType: json["product_type"],
        tagList: json["tag_list"] == null
            ? []
            : List<dynamic>.from(json["tag_list"]!.map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        productApiUrl: json["product_api_url"],
        apiFeaturedImage: json["api_featured_image"],
        productColors: json["product_colors"] == null
            ? []
            : List<ProductColor>.from(
                json["product_colors"]!.map((x) => ProductColor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "name": name,
        "price": price,
        "price_sign": priceSign,
        "currency": currency,
        "image_link": imageLink,
        "product_link": productLink,
        "website_link": websiteLink,
        "description": description,
        "rating": rating,
        "category": category,
        "product_type": productType,
        "tag_list":
            tagList == null ? [] : List<dynamic>.from(tagList!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_api_url": productApiUrl,
        "api_featured_image": apiFeaturedImage,
        "product_colors": productColors == null
            ? []
            : List<dynamic>.from(productColors!.map((x) => x.toJson())),
      };
}

class ProductColor {
  final String? hexValue;
  final String? colourName;

  ProductColor({
    this.hexValue,
    this.colourName,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        colourName: json["colour_name"],
      );

  Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        "colour_name": colourName,
      };
}
