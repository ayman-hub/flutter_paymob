class CustomConst {
  /// for card number
  static const String PAN = "pan";
  static const String CARDHOLDER_NAME = "cardholder_name";
  static const String EXPIRY_MONTH = "expiry_month";
  static const String EXPIRY_YEAR = "expiry_year";
  static const String CVN = "cvn";

  /// server
  static const String PAYMOB_SERVER_IP =
      "https://accept.paymobsolutions.com/api/acceptance/";
  static const String API_URL_USER_PAYMENT =
      "https://accept.paymobsolutions.com/api/acceptance/payments/pay";
  static const String API_URL_TOKENIZE_CARD =
      "https://accept.paymobsolutions.com/api/acceptance/tokenization?payment_token=";
  static const String API_NAME_USER_PAYMENT = "USER_PAYMENT";
  static const String API_NAME_TOKENIZE_CARD = "CARD_TOKENIZER";
  static const String PAYMOB_SUCCESS_URL =
      "https://accept.paymobsolutions.com/api/acceptance/post_pay";

  /// api key
  static const String IDENTIFIER = "identifier";
  static const String SUBTYPE = "subtype";
  static const String SOURCEHOLDER_NAME = "sourceholder_name";
  static const String SOURCE = "source";
  static const String BILLING = "billing";
  static const String PAYMENT_TOKEN = "payment_token";
  static const String API_SOURCE = "api_source";

  /// save card response key
  static const String ORDER_ID = "order_id";
  static const String CARD_SUBTYPE = "card_subtype";
  static const String ID = "id";
  static const String EMAIL = "email";
  static const String TOKEN = "token";
  static const String CREATED_AT = "created_at";
  static const String MASKED_PAN = "masked_pan";
  static const String MERCHANT_ID = "merchant_id";

  static const int USER_CANCELED = 1;
  static const int MISSING_ARGUMENT = 2;
  static const int TRANSACTION_ERROR = 3;
  static const int TRANSACTION_REJECTED = 4;
  static const int TRANSACTION_REJECTED_PARSING_ISSUE = 5;
  static const int TRANSACTION_SUCCESSFUL = 6;
  static const int TRANSACTION_SUCCESSFUL_PARSING_ISSUE = 7;
  static const int TRANSACTION_SUCCESSFUL_CARD_SAVED = 8;
  static const int USER_CANCELED_3D_SECURE_VERIFICATION = 9;
  static const int USER_CANCELED_3D_SECURE_VERIFICATION_PARSING_ISSUE = 10;
  static const int USER_FINISHED_3D_VERIFICATION = 17;
  static const String TRANSACTION_ERROR_REASON = "transaction_error_reason";
  static const String RAW_PAY_RESPONSE = "raw_pay_response";
  static const String MISSING_ARGUMENT_VALUE = "missing_argument_value";

  static const String PAYMENT_KEY = "payment_key";
  static const String MASKED_PAN_NUMBER = "masked_pan_number";
  static const String FIRST_NAME = "first_name";
  static const String LAST_NAME = "last_name";
  static const String BUILDING = "building";
  static const String FLOOR = "floor";
  static const String APARTMENT = "apartment";
  static const String CITY = "city";
  static const String STATE = "state";
  static const String COUNTRY = "country";
  static const String PHONE_NUMBER = "phone_number";
  static const String POSTAL_CODE = "postal_code";
  static const String SHOW_ALERTS = "show_alerts";
  static const String SAVE_CARD_DEFAULT = "save_card_default";
  static const String SHOW_SAVE_CARD = "show_save_card";
  static const String THEME_COLOR = "theme_color";
  static const String THREE_D_SECURE_ACTIVITY_TITLE =
      "three_d_secure_activity_title";

  static const String AMOUNT_CENTS = "amount_cents";
  static const String IS_REFUNDED = "is_refunded";
  static const String IS_CAPTURE = "is_capture";
  static const String CAPTURED_AMOUNT = "captured_amount";
  static const String SOURCE_DATA_TYPE = "source_data.type";
  static const String PENDING = "pending";
  static const String MERCHANT_ORDER_ID = "merchant_order_id";
  static const String IS_3D_SECURE = "is_3d_secure";
  static const String ID_od = "od";
  static const String IS_VOID = "is_void";
  static const String CURRENCY = "currency";
  static const String IS_AUTH = "is_auth";
  static const String IS_REFUND = "is_refund";
  static const String OWNER = "owner";
  static const String IS_VOIDED = "is_voided";
  static const String SOURCE_DATA_PAN = "source_data.pan";
  static const String PROFILE_ID = "profile_id";
  static const String SUCCESS = "success";
  static const String DATA_MESSAGE = "data.message";
  static const String SOURCE_DATA_SUB_TYPE = "source_data.sub_type";
  static const String ERROR_OCCURED = "error_occured";
  static const String IS_STANDALONE_PAYMENT = "is_standalone_oayment";
  static const String REFUNDED_AMOUNT_CENTS = "refunded_amount_cents";
  static const String INTEGRATION_ID = "integration_id";
  static const String ORDER = "order";
  static const String REDIRECTION_URL = "redirection_url";

  static const String LANGUAGE_ENGLISH = "en";
  static const String LANGUAGE_ENGLISH_US = "US";

// route
  static const String OrderRegistration = '/ecommerce/orders';
  static const String Authentication = '/auth/tokens';

  // keys
  static const String Api_Key = "api_key";
  static const String ApiErrorWord = 'api error::';

  static const int connectTimeout = 10000;

  static const String ContentTypeKey = 'Content-Type';
  static const String ContentTypeValue = 'application/json';
}
