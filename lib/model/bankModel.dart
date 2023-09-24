class BankModel {
  Response response;
  List<Datum> data;

  BankModel({
    required this.response,
    required this.data,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
    response: Response.fromJson(json["response"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String bankName;
  String bankIban;
  String bankAccountName;
  String descriptionNo;

  Datum({
    required this.bankName,
    required this.bankIban,
    required this.bankAccountName,
    required this.descriptionNo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    bankName: json["bankName"],
    bankIban: json["bankIban"],
    bankAccountName: json["bankAccountName"],
    descriptionNo: json["descriptionNo"],
  );

  Map<String, dynamic> toJson() => {
    "bankName": bankName,
    "bankIban": bankIban,
    "bankAccountName": bankAccountName,
    "descriptionNo": descriptionNo,
  };
}

class Response {
  int code;
  String message;

  Response({
    required this.code,
    required this.message,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}

/*
{
  "response":{
    "code":200,
    "message":"Success!"
  },
  "data":[
    {
      "bankName":"T.C. ZİRAAT BANKASI A.Ş.",
      "bankIban":"TR33 0006 1005 1978 6457 8413 26",
      "bankAccountName":"Sanalira",
      "descriptionNo":"SL123456789"
    },
    {
      "bankName":"ALBARAKA TÜRK KATILIM BANKASI A.Ş.",
      "bankIban":"TR33 0006 1005 1978 6457 8413 26",
      "bankAccountName":"Sanalira",
      "descriptionNo":"SL123456789"
    },
    {
      "bankName":"TÜRKİYE VAKIFLAR BANKASI T.A.O.",
      "bankIban":"TR33 0006 1005 1978 6457 8413 26",
      "bankAccountName":"Sanalira",
      "descriptionNo":"SL123456789"
    },
    {
      "bankName":"AKBANK T.A.Ş.",
      "bankIban":"TR33 0006 1005 1978 6457 8413 26",
      "bankAccountName":"Sanalira",
      "descriptionNo":"SL123456789"
    },
    {
      "bankName":"KUVEYT TÜRK KATILIM BANKASI A.Ş.",
      "bankIban":"TR33 0006 1005 1978 6457 8413 26",
      "bankAccountName":"Sanalira",
      "descriptionNo":"SL123456789"
    },
    {
      "bankName":"TÜRKİYE GARANTİ BANKASI A.Ş.",
      "bankIban":"TR33 0006 1005 1978 6457 8413 26",
      "bankAccountName":"Sanalira",
      "descriptionNo":"SL123456789"
    },
    {
      "bankName":"QNB FİNANSBANK A.Ş.",
      "bankIban":"TR33 0006 1005 1978 6457 8413 26",
      "bankAccountName":"Sanalira",
      "descriptionNo":"SL123456789"
    }
  ]
}
 */