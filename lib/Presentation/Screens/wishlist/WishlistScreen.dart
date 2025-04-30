import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/BottomSheets/AddCollectionBottomSheet.dart';
import 'package:lazo_client/Presentation/Screens/wishlist/widgets/WishlistGrid.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../StateNotifiersViewModel/WishListStateNotifiers.dart';
import '../../Widgets/SvgIcons.dart';

class WishListScreen extends ConsumerStatefulWidget {
  const WishListScreen({super.key});

  @override
  ConsumerState<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends ConsumerState<WishListScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.8;
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (ref.read(clientStateProvider.notifier).checkIfUserExist() != null) {
        fetchWishListCollections();
      }
    });
    super.initState();
  }

  Future<bool> _onWillPop() async {
    context.pop(true);
    return false; // Return true to allow the pop action, false to prevent it
  }

  @override
  Widget build(BuildContext context) {
    final wishlistCollectionsState =
        ref.watch(showWishlistCollectionsStateNotifier);

    print("sdfaeette ${wishlistCollectionsState.data?.data.first.items}");
    handleState(createWishlistCollectionStateNotifier, showLoading: true,
        onSuccess: (res) {
      fetchWishListCollections();
    });
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 85,
              ),
              WishlistGrid(
                showLoading:
                    wishlistCollectionsState.state == DataState.LOADING,
                collections: wishlistCollectionsState.state == DataState.LOADING
                    ? [
                        CollectionItem(),
                        CollectionItem(),
                        CollectionItem(),
                        CollectionItem(),
                        CollectionItem(),
                        CollectionItem(),
                        CollectionItem(),
                        CollectionItem(),
                      ]
                    : wishlistCollectionsState.data?.data,
                onCollectionClick: (collection) {
                  navigateToCollectionDetails(collection);
                },
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            color: Colors.white.withOpacity(_opacity),
            height: 65,
            child: Row(
              children: [
                Text(
                  "Wishlist",
                  textAlign: TextAlign.center,
                  style: AppTheme.darkTheme.textTheme.displayLarge
                      ?.copyWith(fontSize: 22, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showCreateNewCollection();
                  },
                  child: SVGIcons.localSVG(addIcon,
                      width: 16, height: 16, fit: BoxFit.scaleDown),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  void fetchWishListCollections() {
    ref
        .read(showWishlistCollectionsStateNotifier.notifier)
        .fetchWishlistCollections();
  }

  void showCreateNewCollection() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddCollectionBottomSheet(
            onCreateCollection: (collectionName) {
              createCollection(collectionName);
            },
            controller: controller,
          ),
        );
      },
    );
  }

  void createCollection(String collectionName) {
    ref
        .read(createWishlistCollectionStateNotifier.notifier)
        .createCollection(name: collectionName);
  }

  void navigateToCollectionDetails(CollectionItem? collection) {
    context
        .push(R_CollectionDetailsScreen, extra: {"collectionId": collection?.id.toString(),"collectionName":collection?.name,});
  }
}
