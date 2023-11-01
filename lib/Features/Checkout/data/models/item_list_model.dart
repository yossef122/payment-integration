class ItemListModel {
  ItemList? itemList;

  ItemListModel({this.itemList});

  ItemListModel.fromJson(Map<String, dynamic> json) {
    itemList = json['item_list'] != null
        ? ItemList.fromJson(json['item_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (itemList != null) {
      data['item_list'] = itemList!.toJson();
    }
    return data;
  }
}

class ItemList {
  List<OrderItem>? items;

  ItemList({this.items});

  ItemList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <OrderItem>[];
      json['items'].forEach((v) {
        items!.add(OrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItem {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  OrderItem({this.name, this.quantity, this.price, this.currency});

  OrderItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['currency'] = currency;
    return data;
  }
}