import 'dart:convert';

ListChecklistResponse listChecklistResponseFromJson(String str) =>
    ListChecklistResponse.fromJson(json.decode(str));

String listChecklistResponseToJson(ListChecklistResponse data) =>
    json.encode(data.toJson());

class ListChecklistResponse {
  final int? statusCode;
  final String? message;
  final dynamic errorMessage;
  final List<Data>? data;

  ListChecklistResponse({
    this.statusCode,
    this.message,
    this.errorMessage,
    this.data,
  });

  factory ListChecklistResponse.fromJson(Map<String, dynamic> json) =>
      ListChecklistResponse(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  final int? id;
  final String? name;
  final List<Item>? items;
  final bool? checklistCompletionStatus;

  Data({
    this.id,
    this.name,
    this.items,
    this.checklistCompletionStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        checklistCompletionStatus: json["checklistCompletionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "checklistCompletionStatus": checklistCompletionStatus,
      };
}

class Item {
  final int? id;
  final String? name;
  final bool? itemCompletionStatus;

  Item({
    this.id,
    this.name,
    this.itemCompletionStatus,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        itemCompletionStatus: json["itemCompletionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "itemCompletionStatus": itemCompletionStatus,
      };
}
