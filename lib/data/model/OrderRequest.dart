/// auth_token : "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2laWGh3SWpveE5qWTVOekk0Tmpnd0xDSndhR0Z6YUNJNklqYzJPV05sWXpZNU1tUmhPVFkyT0RjME5qaG1OVEUxTjJVM09UWTBNVEkxTTJOaE5UUXhZalEzWlRWbE5UTmxOVGhqTVRkbU1UUmlZbVkxTkRrMFkyTWlMQ0p3Y205bWFXeGxYM0JySWpveU5EYzBNekY5LmNhYnhrcFZvV1dHQnFVcHJ5SkxnQWRXVmtKTXVtZG9tX1ZUMEd6UDRETnZ3QVpPdm1aUVJ6emtLRDJUMFlZMjdvTFJHZFNSS0k0aVBscjJIc1ZHOXRB"
/// delivery_needed : "false"
/// amount_cents : "100"
/// currency : "EGP"
/// merchant_order_id : 4
/// items : [{"name":"ASC1515","amount_cents":"500000","description":"Smart Watch","quantity":"1"},{"name":"ERT6565","amount_cents":"200000","description":"Power Bank","quantity":"1"}]
/// shipping_data : {"apartment":"803","email":"claudette09@exa.com","floor":"42","first_name":"Clifford","street":"Ethan Land","building":"8028","phone_number":"+86(8)9135210487","postal_code":"01898","extra_description":"8 Ram , 128 Giga","city":"Jaskolskiburgh","country":"CR","last_name":"ayman","state":"Utah"}

class OrderRequest {
  OrderRequest({
      this.authToken, 
      this.deliveryNeeded, 
      this.amountCents, 
      this.currency, 
      this.merchantOrderId, 
      this.items, 
      this.shippingData,});

  OrderRequest.fromJson(dynamic json) {
    authToken = json['auth_token'];
    deliveryNeeded = json['delivery_needed'];
    amountCents = json['amount_cents'];
    currency = json['currency'];
    merchantOrderId = json['merchant_order_id'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    shippingData = json['shipping_data'] != null ? ShippingData.fromJson(json['shipping_data']) : null;
  }
  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  num? merchantOrderId;
  List<Items>? items;
  ShippingData? shippingData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['auth_token'] = authToken;
    map['delivery_needed'] = deliveryNeeded;
    map['amount_cents'] = amountCents;
    map['currency'] = currency;
    map['merchant_order_id'] = merchantOrderId;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    if (shippingData != null) {
      map['shipping_data'] = shippingData?.toJson();
    }
    return map;
  }

}

/// apartment : "803"
/// email : "claudette09@exa.com"
/// floor : "42"
/// first_name : "Clifford"
/// street : "Ethan Land"
/// building : "8028"
/// phone_number : "+86(8)9135210487"
/// postal_code : "01898"
/// extra_description : "8 Ram , 128 Giga"
/// city : "Jaskolskiburgh"
/// country : "CR"
/// last_name : "ayman"
/// state : "Utah"


class ShippingData {
  ShippingData({
      this.apartment, 
      this.email, 
      this.floor, 
      this.firstName, 
      this.street, 
      this.building, 
      this.phoneNumber, 
      this.postalCode, 
      this.extraDescription, 
      this.city, 
      this.country, 
      this.lastName, 
      this.state,});

  ShippingData.fromJson(dynamic json) {
    apartment = json['apartment'];
    email = json['email'];
    floor = json['floor'];
    firstName = json['first_name'];
    street = json['street'];
    building = json['building'];
    phoneNumber = json['phone_number'];
    postalCode = json['postal_code'];
    extraDescription = json['extra_description'];
    city = json['city'];
    country = json['country'];
    lastName = json['last_name'];
    state = json['state'];
  }
  String? apartment;
  String? email;
  String? floor;
  String? firstName;
  String? street;
  String? building;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? city;
  String? country;
  String? lastName;
  String? state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apartment'] = apartment;
    map['email'] = email;
    map['floor'] = floor;
    map['first_name'] = firstName;
    map['street'] = street;
    map['building'] = building;
    map['phone_number'] = phoneNumber;
    map['postal_code'] = postalCode;
    map['extra_description'] = extraDescription;
    map['city'] = city;
    map['country'] = country;
    map['last_name'] = lastName;
    map['state'] = state;
    return map;
  }

}

/// name : "ASC1515"
/// amount_cents : "500000"
/// description : "Smart Watch"
/// quantity : "1"

class Items {
  Items({
      this.name, 
      this.amountCents, 
      this.description, 
      this.quantity,});

  Items.fromJson(dynamic json) {
    name = json['name'];
    amountCents = json['amount_cents'];
    description = json['description'];
    quantity = json['quantity'];
  }
  String? name;
  int? amountCents;
  String? description;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount_cents'] = amountCents;
    map['description'] = description;
    map['quantity'] = quantity;
    return map;
  }

}