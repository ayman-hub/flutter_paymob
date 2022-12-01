/// token : "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SndhR0Z6YUNJNklqYzJPV05sWXpZNU1tUmhPVFkyT0RjME5qaG1OVEUxTjJVM09UWTBNVEkxTTJOaE5UUXhZalEzWlRWbE5UTmxOVGhqTVRkbU1UUmlZbVkxTkRrMFkyTWlMQ0p3Y205bWFXeGxYM0JySWpveU5EYzBNekVzSW1WNGNDSTZNVFkyT1RBek5UYzBNU3dpWTJ4aGMzTWlPaUpOWlhKamFHRnVkQ0o5LkVyMzNUSnhsLW9WOHdGek5qQVhtWHUwdmliSzNzZWtvdjdsZ0lxQnZkMHlVZUlLY2lXMjBUSEo4eVJRaTFqVGRXdmtEclVsR08tY2VKajF5eHhhYXNR"
/// profile : {"id":247431,"user":{"id":441356,"username":"01091802000","first_name":"Ahmed","last_name":"Kamal","date_joined":"2022-07-26T11:14:22.019479","email":"a.kamal@repin.app","is_active":true,"is_staff":false,"is_superuser":false,"last_login":null,"groups":[],"user_permissions":[160,116,119,115,213,137,204,118,131,122,128,127,203,123,140,139,455,454,130,266,124,259,121,133,206,125,129,136,185,146,126,258,135,138,205,117,120,186,132,134,277]},"created_at":"2022-07-26T11:14:22.036063","active":true,"profile_type":"Merchant","phones":["+201091802000"],"company_emails":["a.kamal@repin.app"],"company_name":"Rep In","state":"","country":"EGY","city":"Cairo","postal_code":"","street":"","email_notification":true,"order_retrieval_endpoint":null,"delivery_update_endpoint":null,"logo_url":null,"is_mobadra":false,"sector":"Software houses","activation_method":1,"signed_up_through":0,"failed_attempts":0,"custom_export_columns":[],"server_IP":[],"username":null,"primary_phone_number":"+201091802000","primary_phone_verified":true,"is_temp_password":false,"otp_sent_at":"2022-07-26T11:14:23.298881","otp_sent_to":"01091802000","otp_validated_at":"2022-07-26T11:14:41.273608","awb_banner":null,"email_banner":null,"identification_number":null,"delivery_status_callback":"","merchant_external_link":null,"merchant_status":0,"deactivated_by_bank":false,"bank_deactivation_reason":null,"bank_merchant_status":0,"national_id":null,"super_agent":null,"wallet_limit_profile":null,"address":null,"commercial_registration":null,"commercial_registration_area":null,"distributor_code":null,"distributor_branch_code":null,"allow_terminal_order_id":false,"allow_encryption_bypass":false,"wallet_phone_number":null,"suspicious":0,"latitude":null,"longitude":null,"bank_staffs":{},"bank_rejection_reason":null,"bank_received_documents":false,"bank_merchant_digital_status":0,"bank_digital_rejection_reason":null,"filled_business_data":true,"day_start_time":"00:00:00","day_end_time":null,"withhold_transfers":false,"sms_sender_name":"PayMob","withhold_transfers_reason":null,"withhold_transfers_notes":null,"can_bill_deposit_with_card":false,"can_topup_merchants":false,"topup_transfer_id":null,"referral_eligible":false,"paymob_app_merchant":false,"settlement_frequency":null,"day_of_the_week":null,"day_of_the_month":null,"allow_transaction_notifications":false,"allow_transfer_notifications":false,"sallefny_amount_whole":0,"sallefny_fees_whole":0,"paymob_app_first_login":null,"paymob_app_last_activity":null,"acq_partner":null,"sales_owner":"onboarding","dom":null,"bank_related":null,"permissions":[]}

class TokenModel {
  TokenModel({
    this.token,
    this.profile,
  });

  TokenModel.fromJson(dynamic json) {
    token = json['token'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
  String? token;
  Profile? profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (profile != null) {
      map['profile'] = profile?.toJson();
    }
    return map;
  }
}

/// id : 247431
/// user : {"id":441356,"username":"01091802000","first_name":"Ahmed","last_name":"Kamal","date_joined":"2022-07-26T11:14:22.019479","email":"a.kamal@repin.app","is_active":true,"is_staff":false,"is_superuser":false,"last_login":null,"groups":[],"user_permissions":[160,116,119,115,213,137,204,118,131,122,128,127,203,123,140,139,455,454,130,266,124,259,121,133,206,125,129,136,185,146,126,258,135,138,205,117,120,186,132,134,277]}
/// created_at : "2022-07-26T11:14:22.036063"
/// active : true
/// profile_type : "Merchant"
/// phones : ["+201091802000"]
/// company_emails : ["a.kamal@repin.app"]
/// company_name : "Rep In"
/// state : ""
/// country : "EGY"
/// city : "Cairo"
/// postal_code : ""
/// street : ""
/// email_notification : true
/// order_retrieval_endpoint : null
/// delivery_update_endpoint : null
/// logo_url : null
/// is_mobadra : false
/// sector : "Software houses"
/// activation_method : 1
/// signed_up_through : 0
/// failed_attempts : 0
/// custom_export_columns : []
/// server_IP : []
/// username : null
/// primary_phone_number : "+201091802000"
/// primary_phone_verified : true
/// is_temp_password : false
/// otp_sent_at : "2022-07-26T11:14:23.298881"
/// otp_sent_to : "01091802000"
/// otp_validated_at : "2022-07-26T11:14:41.273608"
/// awb_banner : null
/// email_banner : null
/// identification_number : null
/// delivery_status_callback : ""
/// merchant_external_link : null
/// merchant_status : 0
/// deactivated_by_bank : false
/// bank_deactivation_reason : null
/// bank_merchant_status : 0
/// national_id : null
/// super_agent : null
/// wallet_limit_profile : null
/// address : null
/// commercial_registration : null
/// commercial_registration_area : null
/// distributor_code : null
/// distributor_branch_code : null
/// allow_terminal_order_id : false
/// allow_encryption_bypass : false
/// wallet_phone_number : null
/// suspicious : 0
/// latitude : null
/// longitude : null
/// bank_staffs : {}
/// bank_rejection_reason : null
/// bank_received_documents : false
/// bank_merchant_digital_status : 0
/// bank_digital_rejection_reason : null
/// filled_business_data : true
/// day_start_time : "00:00:00"
/// day_end_time : null
/// withhold_transfers : false
/// sms_sender_name : "PayMob"
/// withhold_transfers_reason : null
/// withhold_transfers_notes : null
/// can_bill_deposit_with_card : false
/// can_topup_merchants : false
/// topup_transfer_id : null
/// referral_eligible : false
/// paymob_app_merchant : false
/// settlement_frequency : null
/// day_of_the_week : null
/// day_of_the_month : null
/// allow_transaction_notifications : false
/// allow_transfer_notifications : false
/// sallefny_amount_whole : 0
/// sallefny_fees_whole : 0
/// paymob_app_first_login : null
/// paymob_app_last_activity : null
/// acq_partner : null
/// sales_owner : "onboarding"
/// dom : null
/// bank_related : null
/// permissions : []

class Profile {
  Profile({
    this.id,
    this.user,
    this.createdAt,
    this.active,
    this.profileType,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
    this.emailNotification,
    this.orderRetrievalEndpoint,
    this.deliveryUpdateEndpoint,
    this.logoUrl,
    this.isMobadra,
    this.sector,
    this.activationMethod,
    this.signedUpThrough,
    this.failedAttempts,
    this.customExportColumns,
    this.serverIP,
    this.username,
    this.primaryPhoneNumber,
    this.primaryPhoneVerified,
    this.isTempPassword,
    this.otpSentAt,
    this.otpSentTo,
    this.otpValidatedAt,
    this.awbBanner,
    this.emailBanner,
    this.identificationNumber,
    this.deliveryStatusCallback,
    this.merchantExternalLink,
    this.merchantStatus,
    this.deactivatedByBank,
    this.bankDeactivationReason,
    this.bankMerchantStatus,
    this.nationalId,
    this.superAgent,
    this.walletLimitProfile,
    this.address,
    this.commercialRegistration,
    this.commercialRegistrationArea,
    this.distributorCode,
    this.distributorBranchCode,
    this.allowTerminalOrderId,
    this.allowEncryptionBypass,
    this.walletPhoneNumber,
    this.suspicious,
    this.latitude,
    this.longitude,
    this.bankStaffs,
    this.bankRejectionReason,
    this.bankReceivedDocuments,
    this.bankMerchantDigitalStatus,
    this.bankDigitalRejectionReason,
    this.filledBusinessData,
    this.dayStartTime,
    this.dayEndTime,
    this.withholdTransfers,
    this.smsSenderName,
    this.withholdTransfersReason,
    this.withholdTransfersNotes,
    this.canBillDepositWithCard,
    this.canTopupMerchants,
    this.topupTransferId,
    this.referralEligible,
    this.paymobAppMerchant,
    this.settlementFrequency,
    this.dayOfTheWeek,
    this.dayOfTheMonth,
    this.allowTransactionNotifications,
    this.allowTransferNotifications,
    this.sallefnyAmountWhole,
    this.sallefnyFeesWhole,
    this.paymobAppFirstLogin,
    this.paymobAppLastActivity,
    this.acqPartner,
    this.salesOwner,
    this.dom,
    this.bankRelated,
    this.permissions,
  });

  Profile.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    active = json['active'];
    profileType = json['profile_type'];
    phones = json['phones'] != null ? json['phones'].cast<String>() : [];
    companyEmails = json['company_emails'] != null
        ? json['company_emails'].cast<String>()
        : [];
    companyName = json['company_name'];
    state = json['state'];
    country = json['country'];
    city = json['city'];
    postalCode = json['postal_code'];
    street = json['street'];
    emailNotification = json['email_notification'];
    orderRetrievalEndpoint = json['order_retrieval_endpoint'];
    deliveryUpdateEndpoint = json['delivery_update_endpoint'];
    logoUrl = json['logo_url'];
    isMobadra = json['is_mobadra'];
    sector = json['sector'];
    activationMethod = json['activation_method'];
    signedUpThrough = json['signed_up_through'];
    failedAttempts = json['failed_attempts'];
    if (json['custom_export_columns'] != null) {
      customExportColumns = [];
      json['custom_export_columns'].forEach((v) {
        customExportColumns?.add(v);
      });
    }
    if (json['server_IP'] != null) {
      serverIP = [];
      json['server_IP'].forEach((v) {
        serverIP?.add(v);
      });
    }
    username = json['username'];
    primaryPhoneNumber = json['primary_phone_number'];
    primaryPhoneVerified = json['primary_phone_verified'];
    isTempPassword = json['is_temp_password'];
    otpSentAt = json['otp_sent_at'];
    otpSentTo = json['otp_sent_to'];
    otpValidatedAt = json['otp_validated_at'];
    awbBanner = json['awb_banner'];
    emailBanner = json['email_banner'];
    identificationNumber = json['identification_number'];
    deliveryStatusCallback = json['delivery_status_callback'];
    merchantExternalLink = json['merchant_external_link'];
    merchantStatus = json['merchant_status'];
    deactivatedByBank = json['deactivated_by_bank'];
    bankDeactivationReason = json['bank_deactivation_reason'];
    bankMerchantStatus = json['bank_merchant_status'];
    nationalId = json['national_id'];
    superAgent = json['super_agent'];
    walletLimitProfile = json['wallet_limit_profile'];
    address = json['address'];
    commercialRegistration = json['commercial_registration'];
    commercialRegistrationArea = json['commercial_registration_area'];
    distributorCode = json['distributor_code'];
    distributorBranchCode = json['distributor_branch_code'];
    allowTerminalOrderId = json['allow_terminal_order_id'];
    allowEncryptionBypass = json['allow_encryption_bypass'];
    walletPhoneNumber = json['wallet_phone_number'];
    suspicious = json['suspicious'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    bankStaffs = json['bank_staffs'];
    bankRejectionReason = json['bank_rejection_reason'];
    bankReceivedDocuments = json['bank_received_documents'];
    bankMerchantDigitalStatus = json['bank_merchant_digital_status'];
    bankDigitalRejectionReason = json['bank_digital_rejection_reason'];
    filledBusinessData = json['filled_business_data'];
    dayStartTime = json['day_start_time'];
    dayEndTime = json['day_end_time'];
    withholdTransfers = json['withhold_transfers'];
    smsSenderName = json['sms_sender_name'];
    withholdTransfersReason = json['withhold_transfers_reason'];
    withholdTransfersNotes = json['withhold_transfers_notes'];
    canBillDepositWithCard = json['can_bill_deposit_with_card'];
    canTopupMerchants = json['can_topup_merchants'];
    topupTransferId = json['topup_transfer_id'];
    referralEligible = json['referral_eligible'];
    paymobAppMerchant = json['paymob_app_merchant'];
    settlementFrequency = json['settlement_frequency'];
    dayOfTheWeek = json['day_of_the_week'];
    dayOfTheMonth = json['day_of_the_month'];
    allowTransactionNotifications = json['allow_transaction_notifications'];
    allowTransferNotifications = json['allow_transfer_notifications'];
    sallefnyAmountWhole = json['sallefny_amount_whole'];
    sallefnyFeesWhole = json['sallefny_fees_whole'];
    paymobAppFirstLogin = json['paymob_app_first_login'];
    paymobAppLastActivity = json['paymob_app_last_activity'];
    acqPartner = json['acq_partner'];
    salesOwner = json['sales_owner'];
    dom = json['dom'];
    bankRelated = json['bank_related'];
    if (json['permissions'] != null) {
      permissions = [];
      json['permissions'].forEach((v) {
        permissions?.add(v);
      });
    }
  }
  num? id;
  User? user;
  String? createdAt;
  bool? active;
  String? profileType;
  List<String>? phones;
  List<String>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;
  bool? emailNotification;
  dynamic orderRetrievalEndpoint;
  dynamic deliveryUpdateEndpoint;
  dynamic logoUrl;
  bool? isMobadra;
  String? sector;
  num? activationMethod;
  num? signedUpThrough;
  num? failedAttempts;
  List? customExportColumns;
  List? serverIP;
  dynamic username;
  String? primaryPhoneNumber;
  bool? primaryPhoneVerified;
  bool? isTempPassword;
  String? otpSentAt;
  String? otpSentTo;
  String? otpValidatedAt;
  dynamic awbBanner;
  dynamic emailBanner;
  dynamic identificationNumber;
  String? deliveryStatusCallback;
  dynamic merchantExternalLink;
  num? merchantStatus;
  bool? deactivatedByBank;
  dynamic bankDeactivationReason;
  num? bankMerchantStatus;
  dynamic nationalId;
  dynamic superAgent;
  dynamic walletLimitProfile;
  dynamic address;
  dynamic commercialRegistration;
  dynamic commercialRegistrationArea;
  dynamic distributorCode;
  dynamic distributorBranchCode;
  bool? allowTerminalOrderId;
  bool? allowEncryptionBypass;
  dynamic walletPhoneNumber;
  num? suspicious;
  dynamic latitude;
  dynamic longitude;
  dynamic bankStaffs;
  dynamic bankRejectionReason;
  bool? bankReceivedDocuments;
  num? bankMerchantDigitalStatus;
  dynamic bankDigitalRejectionReason;
  bool? filledBusinessData;
  String? dayStartTime;
  dynamic dayEndTime;
  bool? withholdTransfers;
  String? smsSenderName;
  dynamic withholdTransfersReason;
  dynamic withholdTransfersNotes;
  bool? canBillDepositWithCard;
  bool? canTopupMerchants;
  dynamic topupTransferId;
  bool? referralEligible;
  bool? paymobAppMerchant;
  dynamic settlementFrequency;
  dynamic dayOfTheWeek;
  dynamic dayOfTheMonth;
  bool? allowTransactionNotifications;
  bool? allowTransferNotifications;
  num? sallefnyAmountWhole;
  num? sallefnyFeesWhole;
  dynamic paymobAppFirstLogin;
  dynamic paymobAppLastActivity;
  dynamic acqPartner;
  String? salesOwner;
  dynamic dom;
  dynamic bankRelated;
  List<dynamic>? permissions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['created_at'] = createdAt;
    map['active'] = active;
    map['profile_type'] = profileType;
    map['phones'] = phones;
    map['company_emails'] = companyEmails;
    map['company_name'] = companyName;
    map['state'] = state;
    map['country'] = country;
    map['city'] = city;
    map['postal_code'] = postalCode;
    map['street'] = street;
    map['email_notification'] = emailNotification;
    map['order_retrieval_endpoint'] = orderRetrievalEndpoint;
    map['delivery_update_endpoint'] = deliveryUpdateEndpoint;
    map['logo_url'] = logoUrl;
    map['is_mobadra'] = isMobadra;
    map['sector'] = sector;
    map['activation_method'] = activationMethod;
    map['signed_up_through'] = signedUpThrough;
    map['failed_attempts'] = failedAttempts;
    if (customExportColumns != null) {
      map['custom_export_columns'] =
          customExportColumns?.map((v) => v.toJson()).toList();
    }
    if (serverIP != null) {
      map['server_IP'] = serverIP?.map((v) => v.toJson()).toList();
    }
    map['username'] = username;
    map['primary_phone_number'] = primaryPhoneNumber;
    map['primary_phone_verified'] = primaryPhoneVerified;
    map['is_temp_password'] = isTempPassword;
    map['otp_sent_at'] = otpSentAt;
    map['otp_sent_to'] = otpSentTo;
    map['otp_validated_at'] = otpValidatedAt;
    map['awb_banner'] = awbBanner;
    map['email_banner'] = emailBanner;
    map['identification_number'] = identificationNumber;
    map['delivery_status_callback'] = deliveryStatusCallback;
    map['merchant_external_link'] = merchantExternalLink;
    map['merchant_status'] = merchantStatus;
    map['deactivated_by_bank'] = deactivatedByBank;
    map['bank_deactivation_reason'] = bankDeactivationReason;
    map['bank_merchant_status'] = bankMerchantStatus;
    map['national_id'] = nationalId;
    map['super_agent'] = superAgent;
    map['wallet_limit_profile'] = walletLimitProfile;
    map['address'] = address;
    map['commercial_registration'] = commercialRegistration;
    map['commercial_registration_area'] = commercialRegistrationArea;
    map['distributor_code'] = distributorCode;
    map['distributor_branch_code'] = distributorBranchCode;
    map['allow_terminal_order_id'] = allowTerminalOrderId;
    map['allow_encryption_bypass'] = allowEncryptionBypass;
    map['wallet_phone_number'] = walletPhoneNumber;
    map['suspicious'] = suspicious;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['bank_staffs'] = bankStaffs;
    map['bank_rejection_reason'] = bankRejectionReason;
    map['bank_received_documents'] = bankReceivedDocuments;
    map['bank_merchant_digital_status'] = bankMerchantDigitalStatus;
    map['bank_digital_rejection_reason'] = bankDigitalRejectionReason;
    map['filled_business_data'] = filledBusinessData;
    map['day_start_time'] = dayStartTime;
    map['day_end_time'] = dayEndTime;
    map['withhold_transfers'] = withholdTransfers;
    map['sms_sender_name'] = smsSenderName;
    map['withhold_transfers_reason'] = withholdTransfersReason;
    map['withhold_transfers_notes'] = withholdTransfersNotes;
    map['can_bill_deposit_with_card'] = canBillDepositWithCard;
    map['can_topup_merchants'] = canTopupMerchants;
    map['topup_transfer_id'] = topupTransferId;
    map['referral_eligible'] = referralEligible;
    map['paymob_app_merchant'] = paymobAppMerchant;
    map['settlement_frequency'] = settlementFrequency;
    map['day_of_the_week'] = dayOfTheWeek;
    map['day_of_the_month'] = dayOfTheMonth;
    map['allow_transaction_notifications'] = allowTransactionNotifications;
    map['allow_transfer_notifications'] = allowTransferNotifications;
    map['sallefny_amount_whole'] = sallefnyAmountWhole;
    map['sallefny_fees_whole'] = sallefnyFeesWhole;
    map['paymob_app_first_login'] = paymobAppFirstLogin;
    map['paymob_app_last_activity'] = paymobAppLastActivity;
    map['acq_partner'] = acqPartner;
    map['sales_owner'] = salesOwner;
    map['dom'] = dom;
    map['bank_related'] = bankRelated;
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 441356
/// username : "01091802000"
/// first_name : "Ahmed"
/// last_name : "Kamal"
/// date_joined : "2022-07-26T11:14:22.019479"
/// email : "a.kamal@repin.app"
/// is_active : true
/// is_staff : false
/// is_superuser : false
/// last_login : null
/// groups : []
/// user_permissions : [160,116,119,115,213,137,204,118,131,122,128,127,203,123,140,139,455,454,130,266,124,259,121,133,206,125,129,136,185,146,126,258,135,138,205,117,120,186,132,134,277]

class User {
  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.dateJoined,
    this.email,
    this.isActive,
    this.isStaff,
    this.isSuperuser,
    this.lastLogin,
    this.groups,
    this.userPermissions,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateJoined = json['date_joined'];
    email = json['email'];
    isActive = json['is_active'];
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
    lastLogin = json['last_login'];
    if (json['groups'] != null) {
      groups = [];
      json['groups'].forEach((v) {
        groups?.add(v);
      });
    }
    userPermissions = json['user_permissions'] != null
        ? json['user_permissions'].cast<num>()
        : [];
  }
  num? id;
  String? username;
  String? firstName;
  String? lastName;
  String? dateJoined;
  String? email;
  bool? isActive;
  bool? isStaff;
  bool? isSuperuser;
  dynamic lastLogin;
  List<dynamic>? groups;
  List<num>? userPermissions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['date_joined'] = dateJoined;
    map['email'] = email;
    map['is_active'] = isActive;
    map['is_staff'] = isStaff;
    map['is_superuser'] = isSuperuser;
    map['last_login'] = lastLogin;
    if (groups != null) {
      map['groups'] = groups?.map((v) => v.toJson()).toList();
    }
    map['user_permissions'] = userPermissions;
    return map;
  }
}
