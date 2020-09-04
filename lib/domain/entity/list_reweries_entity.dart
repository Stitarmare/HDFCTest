class ListBreweriesEntity {
  int id;
  String name;
  String breweryType;
  String street;
  String city;
  String state;
  String postalCode;
  String country;
  String longitude;
  String latitude;
  String phone;
  String websiteUrl;
  DateTime updatedAt;

  ListBreweriesEntity({
    this.id,
    this.name,
    this.breweryType,
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.longitude,
    this.latitude,
    this.phone,
    this.websiteUrl,
    this.updatedAt,
  }) : super();
}
