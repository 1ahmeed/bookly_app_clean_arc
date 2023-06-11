import 'package:bookly_app/feature/home/domains/entities/book_entity.dart';

import 'volume_info.dart';
import 'sale_info.dart';
import 'access_info.dart';

class BookModel extends BookEntity {
  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  }) : super(
            image: volumeInfo?.imageLinks?.thumbnail ?? "",
            author: volumeInfo?.authors?.first ?? "no name",
            bookId: id,
            price: 0,
            rating: volumeInfo?.averageRating ?? 3.5,
            title: volumeInfo?.title,
            count: volumeInfo?.ratingsCount ?? 250,
            categories: volumeInfo?.categories?.first,
            previewLink: volumeInfo!.previewLink!);

  factory BookModel.fromJson(dynamic json) => BookModel(
        kind: json['kind'],
        id: json['id'],
        etag: json['etag'],
        selfLink: json['selfLink'],
        volumeInfo: json['volumeInfo'] != null
            ? VolumeInfo.fromJson(json['volumeInfo'])
            : null,
        saleInfo: json['saleInfo'] != null
            ? SaleInfo.fromJson(json['saleInfo'])
            : null,
        accessInfo: json['accessInfo'] != null
            ? AccessInfo.fromJson(json['accessInfo'])
            : null,
      );

  // BookModel.fromJson(dynamic json) {
  //   kind = json['kind'];
  //   id = json['id'];
  //   etag = json['etag'];
  //   selfLink = json['selfLink'];
  //   volumeInfo =
  //   json['volumeInfo'] != null ? VolumeInfo.fromJson(json['volumeInfo']) : null;
  //   saleInfo =
  //   json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
  //   accessInfo =
  //   json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null;
  // }

  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    return map;
  }
}
