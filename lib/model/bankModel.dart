class BankModel {

  var response;
  var data;

  BankModel({
    this.response,
    this.data,
  });

  factory BankModel.fromJson(Map json) => BankModel(
    response: json["response"],
    data: json["data"]
  );
}