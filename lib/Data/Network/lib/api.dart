//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/app_info_api.dart';
part 'api/auth_api.dart';
part 'api/cart_api.dart';
part 'api/client_api.dart';
part 'api/notifications_api.dart';
part 'api/orders_api.dart';
part 'api/orders12_api.dart';
part 'api/provider_api.dart';
part 'api/public_api.dart';
part 'api/public_auth_api.dart';
part 'api/transactions_api.dart';
part 'api/wishlist_api.dart';

part 'model/add_product_service_to_cart_cart_item200_response.dart';
part 'model/add_product_service_to_cart_cart_item200_response_data.dart';
part 'model/banner.dart';
part 'model/banners_response.dart';
part 'model/cart_calculation200_response.dart';
part 'model/cart_calculation200_response_data.dart';
part 'model/cart_items_inner.dart';
part 'model/categories_response.dart';
part 'model/category.dart';
part 'model/category_menu.dart';
part 'model/cities_response.dart';
part 'model/city.dart';
part 'model/client_auth_response.dart';
part 'model/client_auth_response_data.dart';
part 'model/client_notification.dart';
part 'model/client_order_details.dart';
part 'model/client_order_details_order_items_inner.dart';
part 'model/client_order_details_order_items_inner_product.dart';
part 'model/client_order_details_order_items_inner_provider.dart';
part 'model/client_order_details_response.dart';
part 'model/code_confirm_request.dart';
part 'model/code_confirm_response.dart';
part 'model/code_send_request.dart';
part 'model/code_send_response.dart';
part 'model/collection_item.dart';
part 'model/color.dart';
part 'model/colors_response.dart';
part 'model/create_wishlist_collection200_response.dart';
part 'model/create_wishlist_collection200_response_data.dart';
part 'model/create_wishlist_collection_request.dart';
part 'model/filter_top_products_services200_response.dart';
part 'model/filter_top_products_services200_response_data.dart';
part 'model/filter_top_products_services200_response_data_products.dart';
part 'model/filter_top_products_services200_response_data_services.dart';
part 'model/filter_top_products_services_request.dart';
part 'model/filter_top_sellers200_response.dart';
part 'model/filter_top_sellers200_response_data.dart';
part 'model/filter_top_sellers200_response_data_links_inner.dart';
part 'model/filter_top_sellers_request.dart';
part 'model/get_app_info200_response.dart';
part 'model/get_app_info200_response_data.dart';
part 'model/get_app_info200_response_data_faqs_inner.dart';
part 'model/get_app_info200_response_data_provider_app_info.dart';
part 'model/gift_box.dart';
part 'model/gift_card.dart';
part 'model/image_item.dart';
part 'model/occasion.dart';
part 'model/occasions_response.dart';
part 'model/product_details.dart';
part 'model/product_details_ratings_inner.dart';
part 'model/product_details_response.dart';
part 'model/product_list_item.dart';
part 'model/product_list_item_detail.dart';
part 'model/products_list_response.dart';
part 'model/products_list_response_data.dart';
part 'model/promocode_details.dart';
part 'model/provider_category_menu_response.dart';
part 'model/provider_data.dart';
part 'model/provider_data_city.dart';
part 'model/provider_data_locations_inner.dart';
part 'model/provider_data_ratings_inner.dart';
part 'model/provider_data_tags_inner.dart';
part 'model/provider_location.dart';
part 'model/provider_login_response.dart';
part 'model/provider_login_response_data.dart';
part 'model/provider_order_details.dart';
part 'model/provider_order_details_gift_box.dart';
part 'model/provider_order_details_order_items_inner.dart';
part 'model/provider_order_details_order_items_inner_product.dart';
part 'model/provider_order_details_order_items_inner_product_lists_inner.dart';
part 'model/provider_order_details_order_items_inner_product_lists_inner_items_inner.dart';
part 'model/provider_order_details_order_items_inner_service.dart';
part 'model/provider_order_details_order_items_inner_service_lists_inner.dart';
part 'model/provider_order_details_order_items_inner_service_lists_inner_items_inner.dart';
part 'model/provider_order_details_promocode.dart';
part 'model/provider_order_details_response.dart';
part 'model/provider_order_details_user.dart';
part 'model/provider_product.dart';
part 'model/provider_product_ratings_inner.dart';
part 'model/provider_profile_show_response.dart';
part 'model/provider_profile_update_request.dart';
part 'model/provider_profile_update_response.dart';
part 'model/provider_profile_update_response_data.dart';
part 'model/provider_register_request.dart';
part 'model/provider_register_response.dart';
part 'model/provider_register_response_data.dart';
part 'model/providerchange_password_request.dart';
part 'model/rate_order_request.dart';
part 'model/read_a_notification1200_response.dart';
part 'model/read_a_notification1200_response_data.dart';
part 'model/read_a_notification122200_response.dart';
part 'model/reset_code_confirm_request.dart';
part 'model/reset_code_confirm_response.dart';
part 'model/reset_code_send_request.dart';
part 'model/reset_code_send_response.dart';
part 'model/reset_password_request.dart';
part 'model/reset_password_response.dart';
part 'model/send_push_notification200_response.dart';
part 'model/service_list.dart';
part 'model/service_list_item.dart';
part 'model/service_show_data.dart';
part 'model/service_show_response.dart';
part 'model/services_list_response.dart';
part 'model/services_list_response_data.dart';
part 'model/show_a_provider_details200_response.dart';
part 'model/show_all_gift_boxes200_response.dart';
part 'model/show_all_gift_cards200_response.dart';
part 'model/show_all_provider_s_orders200_response.dart';
part 'model/show_all_provider_s_orders200_response_data.dart';
part 'model/show_all_provider_s_orders200_response_data_links_inner.dart';
part 'model/show_cart_details200_response.dart';
part 'model/show_cart_details200_response_data.dart';
part 'model/show_home200_response.dart';
part 'model/show_home200_response_data.dart';
part 'model/show_notifications1200_response.dart';
part 'model/show_notifications1200_response_data_inner.dart';
part 'model/show_notifications1200_response_data_inner_provider.dart';
part 'model/show_notifications1200_response_data_inner_user.dart';
part 'model/show_notifications2200_response.dart';
part 'model/show_orders200_response.dart';
part 'model/show_orders200_response_data.dart';
part 'model/show_profile200_response.dart';
part 'model/show_profile200_response_data.dart';
part 'model/show_profile200_response_data_city.dart';
part 'model/show_promocode_details200_response.dart';
part 'model/show_promocode_details200_response_data.dart';
part 'model/show_wishlist_collections200_response.dart';
part 'model/show_wishlist_items_with_search_by_name200_response.dart';
part 'model/show_wishlist_items_with_search_by_name200_response_data.dart';
part 'model/showtransactions200_response.dart';
part 'model/showtransactions200_response_data.dart';
part 'model/showtransactions200_response_data_transactions.dart';
part 'model/size.dart';
part 'model/sizes_response.dart';
part 'model/tag.dart';
part 'model/tags_response.dart';
part 'model/toggle_product_service_in_wishlist200_response.dart';
part 'model/toggle_product_service_in_wishlist200_response_data.dart';
part 'model/transaction_details.dart';
part 'model/update_cart_item_quantity200_response.dart';
part 'model/update_cart_item_quantity200_response_data.dart';
part 'model/upload_files.dart';
part 'model/upload_files_response.dart';
part 'model/wishlist_item.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
