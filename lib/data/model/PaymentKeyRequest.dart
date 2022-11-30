import 'package:pay_mob/data/model/OrderResponse.dart';

/// auth_token : "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2laWGh3SWpveE5qWTVOekk0Tmpnd0xDSndhR0Z6YUNJNklqYzJPV05sWXpZNU1tUmhPVFkyT0RjME5qaG1OVEUxTjJVM09UWTBNVEkxTTJOaE5UUXhZalEzWlRWbE5UTmxOVGhqTVRkbU1UUmlZbVkxTkRrMFkyTWlMQ0p3Y205bWFXeGxYM0JySWpveU5EYzBNekY5LmNhYnhrcFZvV1dHQnFVcHJ5SkxnQWRXVmtKTXVtZG9tX1ZUMEd6UDRETnZ3QVpPdm1aUVJ6emtLRDJUMFlZMjdvTFJHZFNSS0k0aVBscjJIc1ZHOXRB"
/// amount_cents : "100"
/// expiration : 3600
/// order_id : "83717725"
/// billing_data : {"apartment":"803","email":"claudette09@exa.com","floor":"42","first_name":"Clifford","street":"Ethan Land","building":"8028","phone_number":"+86(8)9135210487","shipping_method":"UNK","postal_code":"01898","city":"Jaskolskiburgh","country":"CR","last_name":"ayman","state":"Utah"}
/// currency : "EGP"
/// integration_id : 2448842
/// lock_order_when_paid : "false"

class PaymentKeyRequest {
  PaymentKeyRequest({
    this.authToken,
    this.amountCents,
    this.expiration,
    this.orderId,
    this.billingData,
    this.currency,
    this.integrationId,
    this.lockOrderWhenPaid,
  });

  PaymentKeyRequest.fromJson(dynamic json) {
    authToken = json['auth_token'];
    amountCents = json['amount_cents'];
    expiration = json['expiration'];
    orderId = json['order_id'];
    billingData = json['billing_data'] != null
        ? BillingData.fromJson(json['billing_data'])
        : null;
    currency = json['currency'];
    integrationId = json['integration_id'];
    lockOrderWhenPaid = json['lock_order_when_paid'];
  }

  String? authToken;
  String? amountCents;
  num? expiration;
  String? orderId;
  BillingData? billingData;
  String? currency;
  num? integrationId;
  String? lockOrderWhenPaid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['auth_token'] = authToken;
    map['amount_cents'] = amountCents;
    map['expiration'] = expiration;
    map['order_id'] = orderId;
    if (billingData != null) {
      map['billing_data'] = billingData?.toJson();
    }
    map['currency'] = currency;
    map['integration_id'] = integrationId;
    map['lock_order_when_paid'] = lockOrderWhenPaid;
    return map;
  }

  static PaymentKeyRequest fromOrderResponse(OrderResponse data) {
    return PaymentKeyRequest(
      amountCents: data.amountCents.toString(),
      orderId: data.id.toString(),
      expiration: 3600,
      currency: data.currency,
      billingData: BillingData.fromJson(data.shippingData?.toJson() ?? {}),
      lockOrderWhenPaid: false.toString(),
    );
  }
}

/*(
        street: data.shippingData?.street,
        floor: data.shippingData?.floor,
        postalCode: data.shippingData?.postalCode,
        state: data.shippingData?.state,
        phoneNumber: data.shippingData?.phoneNumber,
        lastName: data.shippingData?.lastName,
        firstName: data.shippingData?.firstName,
        country: data.shippingData?.country,
        city: data.shippingData?.city,
        building: data.shippingData?.building,
      )*/

/// apartment : "803"
/// email : "claudette09@exa.com"
/// floor : "42"
/// first_name : "Clifford"
/// street : "Ethan Land"
/// building : "8028"
/// phone_number : "+86(8)9135210487"
/// shipping_method : "UNK"
/// postal_code : "01898"
/// city : "Jaskolskiburgh"
/// country : "CR"
/// last_name : "ayman"
/// state : "Utah"

class BillingData {
  BillingData({
    this.apartment,
    this.email,
    this.floor,
    this.firstName,
    this.street,
    this.building,
    this.phoneNumber,
    this.shippingMethod,
    this.postalCode,
    this.city,
    this.country,
    this.lastName,
    this.state,
  });

  BillingData.fromJson(dynamic json) {
    apartment = json['apartment'];
    email = json['email'];
    floor = json['floor'];
    firstName = json['first_name'];
    street = json['street'];
    building = json['building'];
    phoneNumber = json['phone_number'];
    shippingMethod = json['shipping_method'];
    postalCode = json['postal_code'];
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
  String? shippingMethod;
  String? postalCode;
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
    map['shipping_method'] = shippingMethod;
    map['postal_code'] = postalCode;
    map['city'] = city;
    map['country'] = country;
    map['last_name'] = lastName;
    map['state'] = state;
    return map;
  }
}
