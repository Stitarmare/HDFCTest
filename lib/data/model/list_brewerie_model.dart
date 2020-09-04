import 'package:hdfcTestApp/domain/entity/list_reweries_entity.dart';

class ListBreweriesModel extends ListBreweriesEntity {
  ListBreweriesModel({
    id,
    name,
    breweryType,
    street,
    city,
    state,
    postalCode,
    country,
    longitude,
    latitude,
    phone,
    websiteUrl,
    updatedAt,
  }) : super(
            id: id,
            name: name,
            breweryType: breweryType,
            street: street,
            state: state,
            postalCode: postalCode,
            country: country,
            longitude: longitude,
            latitude: latitude,
            phone: phone,
            websiteUrl: websiteUrl,
            updatedAt: updatedAt);
  factory ListBreweriesModel.fromMap(Map<String, dynamic> json) {
    return ListBreweriesModel(
      id: json["id"],
      name: json["name"],
      breweryType: json["brewery_type"],
      street: json["street"],
      city: json["city"],
      state: json["state"],
      postalCode: json["postal_code"],
      country: json["country"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      phone: json["phone"],
      websiteUrl: json["website_url"],
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}
