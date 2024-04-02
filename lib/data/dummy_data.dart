import 'package:babyhub/features/shop/models/banner_model.dart';
import 'package:babyhub/features/shop/models/brand_model.dart';
import 'package:babyhub/features/shop/models/category_model.dart';
import 'package:babyhub/features/shop/models/product_attribute_model.dart';
import 'package:babyhub/features/shop/models/product_model.dart';
import 'package:babyhub/features/shop/models/product_variation_model.dart';
import 'package:babyhub/routes/routes.dart';
import 'package:babyhub/utils/constant/image_strings.dart';

class DummyData {
  // Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: BabyHubImages.promoBanner1,
      targetScreen: BRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: BabyHubImages.promoBanner2,
      targetScreen: BRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: BabyHubImages.promoBanner3,
      targetScreen: BRoutes.favourites,
      active: true,
    ),
    BannerModel(
      imageUrl: BabyHubImages.promoBanner1,
      targetScreen: BRoutes.search,
      active: true,
    ),
    BannerModel(
      imageUrl: BabyHubImages.promoBanner2,
      targetScreen: BRoutes.settings,
      active: true,
    ),
    BannerModel(
      imageUrl: BabyHubImages.promoBanner3,
      targetScreen: BRoutes.userAddress,
      active: true,
    ),
    BannerModel(
      imageUrl: BabyHubImages.promoBanner1,
      targetScreen: BRoutes.checkout,
      active: false,
    ),
  ];
  //
  // /// User
  // static final UserModel user = UserModel();
  //
  // /// Cart
  // static final CartModel cart = CartModel();
  //
  // /// Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'CT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 269,
  //     orderDate: DateTime(2025, 9, 11),
  //     deliveryDate: DateTime(2023, 9, 9),
  //   ),
  //   OrderModel(
  //     id: 'CB10025',
  //     status: OrderStatus.shipped,
  //     items: cart.items,
  //     totalAmount: 369,
  //     orderDate: DateTime(2021, 10, 21),
  //   ),
  // ];

  /// List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image: BabyHubImages.toys,
      name: 'Toys',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: BabyHubImages.others,
      name: 'Others',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: BabyHubImages.hair,
      name: 'Hair Care',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: BabyHubImages.clothing,
      name: 'Clothing',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: BabyHubImages.skincare,
      name: 'Skin Care',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: BabyHubImages.food,
      name: 'Food',
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      image: BabyHubImages.accessories,
      name: 'Accessories',
      isFeatured: true,
    ),
    CategoryModel(
      id: '16',
      image: BabyHubImages.diaper,
      name: 'Diaper',
      isFeatured: true,
    ),

    // Subcategories
    CategoryModel(
      id: '8',
      image: BabyHubImages.toys,
      name: 'Toys',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '9',
      image: BabyHubImages.toys,
      name: 'Toys',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      image: BabyHubImages.toys,
      name: 'Toys',
      parentId: '1',
      isFeatured: false,
    ),

    // Furniture
    CategoryModel(
      id: '11',
      image: BabyHubImages.others,
      name: 'Others',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '12',
      image: BabyHubImages.others,
      name: 'Others',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      image: BabyHubImages.others,
      name: 'Others',
      parentId: '5',
      isFeatured: false,
    ),

    // Electronics
    CategoryModel(
      id: '14',
      image: BabyHubImages.hair,
      name: 'Hair',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '15',
      image: BabyHubImages.hair,
      name: 'Hair',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '17',
      image: BabyHubImages.diaper,
      name: 'Diaper',
      parentId: '16',
      isFeatured: false,
    ),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Cussons sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: BabyHubImages.product2,
      description: 'Green Cussons sports shoe',
      brand: BrandModel(
        id: '1',
        image: BabyHubImages.cussons,
        name: 'Cussons',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        BabyHubImages.product1,
        BabyHubImages.product2,
        BabyHubImages.product1,
        BabyHubImages.product2
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 172.6,
          image: BabyHubImages.product1,
          description:
              'This is a Product description for Green Cussons sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 36'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 134,
          salePrice: 172.6,
          image: BabyHubImages.product1,
          description:
              'This is a Product description for Green Cussons sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 36'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 34,
          price: 134,
          salePrice: 172.6,
          image: BabyHubImages.product1,
          description:
              'This is a Product description for Green Cussons sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 36'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Blue Cussons T-shirt',
      stock: 20,
      price: 40,
      isFeatured: true,
      thumbnail: BabyHubImages.product3,
      description: 'Blue Cussons T-shirt for men',
      brand: BrandModel(
        id: '1',
        image: BabyHubImages.cussons,
        name: 'Cussons',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        BabyHubImages.product3,
        BabyHubImages.product4,
        BabyHubImages.product3,
        BabyHubImages.product4,
      ],
      salePrice: 20,
      sku: 'ABR7890',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Blue', 'White', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 25,
          price: 40,
          salePrice: 30,
          image: BabyHubImages.product3,
          description:
              'This is a Product description for Blue Cussons T-shirt.',
          attributeValues: {'Color': 'Blue', 'Size': 'S'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 30,
          price: 40,
          salePrice: 30,
          image: BabyHubImages.product4,
          description:
              'This is a Product description for Blue Cussons T-shirt.',
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 20,
          price: 40,
          salePrice: 30,
          image: BabyHubImages.product3,
          description:
              'This is a Product description for Blue Cussons T-shirt.',
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    // Add more ProductModel instances as needed
  ];
}
