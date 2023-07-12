
abstract class ShopSearchStates {}

class ShopSearchInitialStates extends ShopSearchStates{}

class ShopSearchLoadingStates extends ShopSearchStates{}

class ShopSearchSuccessStates extends ShopSearchStates{}

class ShopSearchErrorStates extends ShopSearchStates{
  final String error;

  ShopSearchErrorStates(this.error);
}