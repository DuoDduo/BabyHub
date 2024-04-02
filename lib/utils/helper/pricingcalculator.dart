class BPricingCalculator {
  /// Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  //Shipping Cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

//Calculate Tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    //lookup tax rate  for the given location using a tax rate API or database
    // return appropriate tax rate
    return 0.10; // tax rate of 10%
  }

  static double getShippingCost(String location) {
    //lookup shipping cost for the given location using a shipping rate API
    // calculate shipping cost based on factors like, distance, weight, etc
    return 5.00; //shipping cost of5$
  }

  /// sum all cart values and return total amount
  /// static double calculatorCartTotal(CartModel cart){
  /// return cart.items.map((e) => e.price).fold(0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
}
