/// updated_at : "2022-11-30T13:33:02.527689"
/// hmac : "78da68c99795d0383ce719bfcaad20df9f65d4a3fe7917dd87f2b610a07e06da88259c98aa0c1207357ddfb051072ada24510b4d885719fd8e327d2f6265fe58"
/// is_auth : false
/// success : false
/// is_void : false
/// created_at : "2022-11-30T13:32:39.454456"
/// data.message : "BLOCKED"
/// discount_details : []
/// owner : 441356
/// source_data.pan : 2346
/// txn_response_code : "BLOCKED"
/// merchant_commission : 0
/// merchant_order_id : 576
/// is_3d_secure : true
/// source_data.type : "card"
/// is_standalone_payment : true
/// integration_id : 2448842
/// is_voided : false
/// currency : "EGP"
/// is_refunded : false
/// is_refund : false
/// id : 71330124
/// captured_amount : 0
/// source_data.sub_type : "MasterCard"
/// order : 83926843
/// profile_id : 247431
/// refunded_amount_cents : 0
/// has_parent_transaction : false
/// is_capture : false
/// amount_cents : 100
/// error_occured : false
/// pending : false

class TransactionModel {
  TransactionModel({
      this.updatedAt, 
      this.hmac, 
      this.isAuth, 
      this.success, 
      this.isVoid, 
      this.createdAt, 
      this.datamessage, 
      this.discountDetails, 
      this.owner, 
      this.sourceDatapan, 
      this.txnResponseCode, 
      this.merchantCommission, 
      this.merchantOrderId, 
      this.is3dSecure, 
      this.sourceDatatype, 
      this.isStandalonePayment, 
      this.integrationId, 
      this.isVoided, 
      this.currency, 
      this.isRefunded, 
      this.isRefund, 
      this.id, 
      this.capturedAmount, 
      this.sourceDatasubType, 
      this.order, 
      this.profileId, 
      this.refundedAmountCents, 
      this.hasParentTransaction, 
      this.isCapture, 
      this.amountCents, 
      this.errorOccured, 
      this.pending,});

  TransactionModel.fromJson(dynamic json) {
    updatedAt = json['updated_at'];
    hmac = json['hmac'];
    isAuth = bool.fromEnvironment(json['is_auth']);
    success = bool.fromEnvironment(json['success']);
    isVoid = bool.fromEnvironment(json['is_void']);
    createdAt = json['created_at'];
    datamessage = json['data.message'];
    discountDetails =json['discount_details'];
    owner = num.tryParse(json['owner']);
    sourceDatapan = num.tryParse(json['source_data.pan']);
    txnResponseCode = json['txn_response_code'];
    merchantCommission = num.tryParse(json['merchant_commission']);
    merchantOrderId = num.tryParse(json['merchant_order_id']);
    is3dSecure = bool.fromEnvironment(json['is_3d_secure']);
    sourceDatatype = json['source_data.type'];
    isStandalonePayment = bool.fromEnvironment(json['is_standalone_payment']);
    integrationId = num.tryParse(json['integration_id']);
    isVoided = bool.fromEnvironment(json['is_voided']);
    currency = json['currency'];
    isRefunded = bool.fromEnvironment(json['is_refunded']);
    isRefund = bool.fromEnvironment(json['is_refund']);
    id = num.tryParse(json['id']);
    capturedAmount = num.tryParse(json['captured_amount']);
    sourceDatasubType = json['source_data.sub_type'];
    order = num.tryParse(json['order']);
    profileId = num.tryParse(json['profile_id']);
    refundedAmountCents = num.tryParse(json['refunded_amount_cents']);
    hasParentTransaction = bool.fromEnvironment(json['has_parent_transaction']);
    isCapture = bool.fromEnvironment(json['is_capture']);
    amountCents = num.tryParse(json['amount_cents']);
    errorOccured = bool.fromEnvironment(json['error_occured']);
    pending = bool.fromEnvironment(json['pending']);
  }
  String? updatedAt;
  String? hmac;
  bool? isAuth;
  bool? success;
  bool? isVoid;
  String? createdAt;
  String? datamessage;
  String? discountDetails;
  num? owner;
  num? sourceDatapan;
  String? txnResponseCode;
  num? merchantCommission;
  num? merchantOrderId;
  bool? is3dSecure;
  String? sourceDatatype;
  bool? isStandalonePayment;
  num? integrationId;
  bool? isVoided;
  String? currency;
  bool? isRefunded;
  bool? isRefund;
  num? id;
  num? capturedAmount;
  String? sourceDatasubType;
  num? order;
  num? profileId;
  num? refundedAmountCents;
  bool? hasParentTransaction;
  bool? isCapture;
  num? amountCents;
  bool? errorOccured;
  bool? pending;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated_at'] = updatedAt;
    map['hmac'] = hmac;
    map['is_auth'] = isAuth;
    map['success'] = success;
    map['is_void'] = isVoid;
    map['created_at'] = createdAt;
    map['data.message'] = datamessage;
    map['discount_details'] = discountDetails;
    map['owner'] = owner;
    map['source_data.pan'] = sourceDatapan;
    map['txn_response_code'] = txnResponseCode;
    map['merchant_commission'] = merchantCommission;
    map['merchant_order_id'] = merchantOrderId;
    map['is_3d_secure'] = is3dSecure;
    map['source_data.type'] = sourceDatatype;
    map['is_standalone_payment'] = isStandalonePayment;
    map['integration_id'] = integrationId;
    map['is_voided'] = isVoided;
    map['currency'] = currency;
    map['is_refunded'] = isRefunded;
    map['is_refund'] = isRefund;
    map['id'] = id;
    map['captured_amount'] = capturedAmount;
    map['source_data.sub_type'] = sourceDatasubType;
    map['order'] = order;
    map['profile_id'] = profileId;
    map['refunded_amount_cents'] = refundedAmountCents;
    map['has_parent_transaction'] = hasParentTransaction;
    map['is_capture'] = isCapture;
    map['amount_cents'] = amountCents;
    map['error_occured'] = errorOccured;
    map['pending'] = pending;
    return map;
  }

}