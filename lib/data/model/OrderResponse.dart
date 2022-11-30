import 'package:pay_mob/data/model/OrderRequest.dart';

/// id : 82012120
/// created_at : "2022-11-21T14:07:30.368204"
/// delivery_needed : false
/// merchant : {"id":247431,"created_at":"2022-07-26T11:14:22.036063","phones":["+201091802000"],"company_emails":["a.kamal@repin.app"],"company_name":"Rep In","state":"","country":"EGY","city":"Cairo","postal_code":"","street":""}
/// collector : null
/// amount_cents : 100
/// shipping_data : {"id":42308968,"first_name":"Clifford","last_name":"Nicolas","street":"Ethan Land","building":"8028","floor":"42","apartment":"803","city":"Jaskolskiburgh","state":"Utah","country":"CR","email":"claudette09@exa.com","phone_number":"+86(8)9135210487","postal_code":"01898","extra_description":"8 Ram , 128 Giga","shipping_method":"UNK","order_id":82012120,"order":82012120}
/// currency : "EGP"
/// is_payment_locked : false
/// is_return : false
/// is_cancel : false
/// is_returned : false
/// is_canceled : false
/// merchant_order_id : "5"
/// wallet_notification : null
/// paid_amount_cents : 0
/// notify_user_with_email : false
/// items : [{"name":"ASC1515","description":"Smart Watch","amount_cents":500000,"quantity":1},{"name":"ERT6565","description":"Power Bank","amount_cents":200000,"quantity":1}]
/// order_url : "https://accept.paymob.com/standalone/?ref=i_LRR2Qyt6eUpUaFJGbGVaek9HMmhBcEo1UT09X2hrZGt0SUtsOW1PUWRzYTdQN213L2c9PQ"
/// commission_fees : 0
/// delivery_fees_cents : 0
/// delivery_vat_cents : 0
/// payment_method : "tbc"
/// merchant_staff_tag : null
/// api_source : "OTHER"
/// data : {}
/// token : "LRR2Qyt6eUpUaFJGbGVaek9HMmhBcEo1UT09X2hrZGt0SUtsOW1PUWRzYTdQN213L2c9PQ"
/// url : "https://accept.paymob.com/standalone/?ref=i_LRR2Qyt6eUpUaFJGbGVaek9HMmhBcEo1UT09X2hrZGt0SUtsOW1PUWRzYTdQN213L2c9PQ"

class OrderResponse {
  OrderResponse({
      this.id, 
      this.createdAt, 
      this.deliveryNeeded, 
      this.merchant, 
      this.collector, 
      this.amountCents, 
      this.shippingData, 
      this.currency, 
      this.isPaymentLocked, 
      this.isReturn, 
      this.isCancel, 
      this.isReturned, 
      this.isCanceled, 
      this.merchantOrderId, 
      this.walletNotification, 
      this.paidAmountCents, 
      this.notifyUserWithEmail, 
      this.items, 
      this.orderUrl, 
      this.commissionFees, 
      this.deliveryFeesCents, 
      this.deliveryVatCents, 
      this.paymentMethod, 
      this.merchantStaffTag, 
      this.apiSource, 
      this.data, 
      this.token, 
      this.url,});

  OrderResponse.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    deliveryNeeded = json['delivery_needed'];
    merchant = json['merchant'] != null ? Merchant.fromJson(json['merchant']) : null;
    collector = json['collector'];
    amountCents = json['amount_cents'];
    shippingData = json['shipping_data'] != null ? ResponseShippingData.fromJson(json['shipping_data']) : null;
    currency = json['currency'];
    isPaymentLocked = json['is_payment_locked'];
    isReturn = json['is_return'];
    isCancel = json['is_cancel'];
    isReturned = json['is_returned'];
    isCanceled = json['is_canceled'];
    merchantOrderId = json['merchant_order_id'];
    walletNotification = json['wallet_notification'];
    paidAmountCents = json['paid_amount_cents'];
    notifyUserWithEmail = json['notify_user_with_email'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    orderUrl = json['order_url'];
    commissionFees = json['commission_fees'];
    deliveryFeesCents = json['delivery_fees_cents'];
    deliveryVatCents = json['delivery_vat_cents'];
    paymentMethod = json['payment_method'];
    merchantStaffTag = json['merchant_staff_tag'];
    apiSource = json['api_source'];
    data = json['data'];
    token = json['token'];
    url = json['url'];
  }
  num? id;
  String? createdAt;
  bool? deliveryNeeded;
  Merchant? merchant;
  dynamic collector;
  num? amountCents;
  ResponseShippingData? shippingData;
  String? currency;
  bool? isPaymentLocked;
  bool? isReturn;
  bool? isCancel;
  bool? isReturned;
  bool? isCanceled;
  String? merchantOrderId;
  dynamic walletNotification;
  num? paidAmountCents;
  bool? notifyUserWithEmail;
  List<Items>? items;
  String? orderUrl;
  num? commissionFees;
  num? deliveryFeesCents;
  num? deliveryVatCents;
  String? paymentMethod;
  dynamic merchantStaffTag;
  String? apiSource;
  dynamic data;
  String? token;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['delivery_needed'] = deliveryNeeded;
    if (merchant != null) {
      map['merchant'] = merchant?.toJson();
    }
    map['collector'] = collector;
    map['amount_cents'] = amountCents;
    if (shippingData != null) {
      map['shipping_data'] = shippingData?.toJson();
    }
    map['currency'] = currency;
    map['is_payment_locked'] = isPaymentLocked;
    map['is_return'] = isReturn;
    map['is_cancel'] = isCancel;
    map['is_returned'] = isReturned;
    map['is_canceled'] = isCanceled;
    map['merchant_order_id'] = merchantOrderId;
    map['wallet_notification'] = walletNotification;
    map['paid_amount_cents'] = paidAmountCents;
    map['notify_user_with_email'] = notifyUserWithEmail;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['order_url'] = orderUrl;
    map['commission_fees'] = commissionFees;
    map['delivery_fees_cents'] = deliveryFeesCents;
    map['delivery_vat_cents'] = deliveryVatCents;
    map['payment_method'] = paymentMethod;
    map['merchant_staff_tag'] = merchantStaffTag;
    map['api_source'] = apiSource;
    map['data'] = data;
    map['token'] = token;
    map['url'] = url;
    return map;
  }

}


/// id : 42308968
/// first_name : "Clifford"
/// last_name : "Nicolas"
/// street : "Ethan Land"
/// building : "8028"
/// floor : "42"
/// apartment : "803"
/// city : "Jaskolskiburgh"
/// state : "Utah"
/// country : "CR"
/// email : "claudette09@exa.com"
/// phone_number : "+86(8)9135210487"
/// postal_code : "01898"
/// extra_description : "8 Ram , 128 Giga"
/// shipping_method : "UNK"
/// order_id : 82012120
/// order : 82012120

class ResponseShippingData {
  ResponseShippingData({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.street, 
      this.building, 
      this.floor, 
      this.apartment, 
      this.city, 
      this.state, 
      this.country, 
      this.email, 
      this.phoneNumber, 
      this.postalCode, 
      this.extraDescription, 
      this.shippingMethod, 
      this.orderId, 
      this.order,});

  ResponseShippingData.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    street = json['street'];
    building = json['building'];
    floor = json['floor'];
    apartment = json['apartment'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    postalCode = json['postal_code'];
    extraDescription = json['extra_description'];
    shippingMethod = json['shipping_method'];
    orderId = json['order_id'];
    order = json['order'];
  }
  num? id;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? city;
  String? state;
  String? country;
  String? email;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? shippingMethod;
  num? orderId;
  num? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['street'] = street;
    map['building'] = building;
    map['floor'] = floor;
    map['apartment'] = apartment;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['postal_code'] = postalCode;
    map['extra_description'] = extraDescription;
    map['shipping_method'] = shippingMethod;
    map['order_id'] = orderId;
    map['order'] = order;
    return map;
  }

}

/// id : 247431
/// created_at : "2022-07-26T11:14:22.036063"
/// phones : ["+201091802000"]
/// company_emails : ["a.kamal@repin.app"]
/// company_name : "Rep In"
/// state : ""
/// country : "EGY"
/// city : "Cairo"
/// postal_code : ""
/// street : ""

class Merchant {
  Merchant({
      this.id, 
      this.createdAt, 
      this.phones, 
      this.companyEmails, 
      this.companyName, 
      this.state, 
      this.country, 
      this.city, 
      this.postalCode, 
      this.street,});

  Merchant.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    phones = json['phones'] != null ? json['phones'].cast<String>() : [];
    companyEmails = json['company_emails'] != null ? json['company_emails'].cast<String>() : [];
    companyName = json['company_name'];
    state = json['state'];
    country = json['country'];
    city = json['city'];
    postalCode = json['postal_code'];
    street = json['street'];
  }
  num? id;
  String? createdAt;
  List<String>? phones;
  List<String>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['phones'] = phones;
    map['company_emails'] = companyEmails;
    map['company_name'] = companyName;
    map['state'] = state;
    map['country'] = country;
    map['city'] = city;
    map['postal_code'] = postalCode;
    map['street'] = street;
    return map;
  }

}