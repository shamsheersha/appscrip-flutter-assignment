class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    {
      return UserModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        username: json['username'] ?? '',
        email: json['email'] ?? '',
        address: Address.fromJson(json['address'] ?? {}),
        phone: json['phone'] ?? '',
        website: json['website'] ?? '',
        company: Company.fromJson(json['company'] ?? {}),
      );
    }
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] ?? '',
      suite: json['suite'] ?? '',
      city: json['city'] ?? '',
      zipcode: json['zipcode'] ?? '',
      geo: Geo.fromJson(json['geo'] ?? {}),
    );
  }
}

//! Geo Class

class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: json['lat'] ?? '0', lng: json['lng'] ?? '0');
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] ?? '',
      catchPhrase: json['catchPhrase'] ?? '',
      bs: json['bs'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
  }
}
