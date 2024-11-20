import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Screens/orders/componants/OrderRatingItem.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifiersViewModel/ClientStateNotifiers.dart';

class RatingOrderItemsScreen extends ConsumerStatefulWidget {
  final ClientOrderDetails? order;
  const RatingOrderItemsScreen({super.key, this.order});

  @override
  ConsumerState<RatingOrderItemsScreen> createState() => _RatingOrderItemsScreenState();
}

class _RatingOrderItemsScreenState extends ConsumerState<RatingOrderItemsScreen> {
  final List<int> _itemIds = [];
  final List<double> _ratings = [];
  final List<String> _comments = [];
  final List<bool> _isValidated = [];

  // Callback to handle the update from each OrderRatingItem
  void _onUpdateRating(Map<String, dynamic> data) {
    setState(() {
      // Update the data for the corresponding item (itemId)
      int index = _itemIds.indexWhere((itemId) => itemId == data['itemId']);
      if (index != -1) {
        // Update existing data if the item already exists
        _ratings[index] = data['rating'];
        _comments[index] = data['comment'];
      } else {
        // Add new data for the item if it doesn't exist
        _itemIds.add(data['itemId']);
        _ratings.add(data['rating']);
        _comments.add(data['comment']);
      }
    });
  }

  // Validation function
  bool _validateRatings() {
    // Check if there are any items with a rating of 0 or empty comment
    print("order item : ${widget.order?.orderItems.length} => ${_itemIds.length}");
    if (_itemIds.isEmpty || widget.order?.orderItems.length != _itemIds.length) {
      return false; // Invalid if no items are rated
    }
    for (int i = 0; i < _ratings.length; i++) {
      if (_ratings[i] == 0 || _comments[i].isEmpty) {
        return false; // Invalid if rating is 0 or comment is empty
      }
    }
    return true;
  }

  // Function to get the separate arrays (itemIds, ratings, and comments)
  List<int> get itemIds => _itemIds;
  List<double> get ratings => _ratings;
  List<String> get comments => _comments;

  @override
  Widget build(BuildContext context) {
    handleState(ratingOrderStateProvider, showLoading: true,onSuccess: (res){
      context.pop(true);
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: "Rating Order",
        navigated: true,
        isCenter: false,
        appContext: context,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                var orderItem = widget.order?.orderItems[index];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: OrderRatingItem(
                    item: orderItem,
                    onUpdate: _onUpdateRating,
                  ),
                );
              },
              itemCount: widget.order?.orderItems.length ?? 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButton(
                text: "Save Rating",
                width: double.infinity,
                height: 46,
                onPress: () {
                  if (_validateRatings()) {
                    // If valid, get the final arrays (itemIds, ratings, comments)
                    print("All ratings are valid.");
                    print("Item IDs: $_itemIds");
                    print("Ratings: ${_ratings}");
                    print("Comments: $_comments");
                    rateOrder(
                      comments: _comments,
                      orderItemsIds: _itemIds.map((item) => item.toString()).toList(),
                      ratings: _ratings.map((rating) => rating.toString()).toList(),
                    );
                  } else {
                    // If invalid, show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please rate and comment on all order items.")),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  void rateOrder({required List<String> comments, required List<String> orderItemsIds, required List<String> ratings}) {
    ref.read(ratingOrderStateProvider.notifier).ratingOrder(
      comments: comments,
      orderItemsIds: orderItemsIds,
      ratings: ratings,
    );
  }
}
