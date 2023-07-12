// class HomeModel{
//   bool status;
//   HomeDataModel? data;
//
//
//
//   HomeModel.FromJson(Map<String ,dynamic> json)
//   :
//     status = json["status"],
//     data = HomeDataModel.FromJson(json['data']);
//
// }
//
// class HomeDataModel{
//   List<BannersModel>? banners  ;
//   List<ProductModel>? products ;
//
//   HomeDataModel.FromJson(Map<String ,dynamic> json)
//   {
//     json['banners'].forEach((element){
//       banners!.add(element);
//     });
//
//     json['products'].forEach((element){
//       products!.add(element);
//     });
//
//   }
// }
//
//
// class BannersModel {
//   int id;
//   String image;
//   BannersModel.FromJson(Map<String, dynamic> json)
//   :
//       id = json['id'],
//       image = json['image'];
// }
//
//
// class ProductModel {
//   int id;
//   dynamic price;
//   dynamic oldPrice;
//   dynamic discount;
//   String image;
//   String name;
//   bool inFavorite;
//   bool inCart;
//
//   ProductModel.FromJson(Map<String, dynamic> json)
//   :
//       id=json['id'],
//       price=json['price'],
//       oldPrice=json['old_price'],
//       discount=json['discount'],
//       image=json['image'],
//       name=json['name'],
//       inFavorite=json['in_favorites'],
//       inCart=json['in_cart'];
//
// }


class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new HomeDataModel.fromJson(json['data']) : null;
  }

}

class HomeDataModel {
  List<BannersModel>? banners;
  List<ProductModel>? products;


  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <BannersModel>[];
      json['banners'].forEach((v) {
        banners!.add(new BannersModel.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductModel.fromJson(v));
      });
    }
  }
}

class BannersModel {
  int? id;
  String? image;


  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;

  ProductModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  price = json['price'];
  oldPrice = json['old_price'];
  discount = json['discount'];
  image = json['image'];
  name = json['name'];
  inFavorites = json['in_favorites'];
  inCart = json['in_cart'];
  }

  }
