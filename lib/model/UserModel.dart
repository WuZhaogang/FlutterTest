import 'dart:convert' show json;

class UserModel {

  int score;
  String id;
  String userName;
  OrderModel order;

  UserModel.fromParams({this.score, this.id, this.userName, this.order});

  factory UserModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new UserModel.fromJson(json.decode(jsonStr)) : new UserModel.fromJson(jsonStr);

  UserModel.fromJson(jsonRes) {
    score = jsonRes['score'];
    id = jsonRes['id'];
    userName = jsonRes['userName'];
    order = jsonRes['order'] == null ? null : new OrderModel.fromJson(jsonRes['order']);
  }

  @override
  String toString() {
    return '{"score": $score,"id": ${id != null?'${json.encode(id)}':'null'},"userName": ${userName != null?'${json.encode(userName)}':'null'},"order": $order}';
  }
}

class OrderModel {

  String orderId;

  OrderModel.fromParams({this.orderId});

  OrderModel.fromJson(jsonRes) {
    orderId = jsonRes['orderId'];
  }

  @override
  String toString() {
    return '{"orderId": ${orderId != null?'${json.encode(orderId)}':'null'}}';
  }
}

