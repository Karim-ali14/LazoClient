import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/SearchStorage.dart';
import '../Theme/AppTheme.dart';
typedef OnItemSearchClick = Function(String);
class RecentScreen extends StatefulWidget {
  final List<String> recentSearches;
  final OnItemSearchClick itemSearchClick;
  final Function onClearBtuClick;
  const RecentScreen({super.key, required this.recentSearches, required this.itemSearchClick, required this.onClearBtuClick});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Searches",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed:(){
                    SearchStorage.clearSearches(
                        SearchStorage.product_key
                    );
                    widget.onClearBtuClick.call();
                  },
                  child: Text("Clear All"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.recentSearches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.recentSearches[index]),
                  leading: const Icon(Icons.search),
                  onTap: () {
                    widget.itemSearchClick(widget.recentSearches[index]);
                  },
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 1,
                color: AppTheme.appGrey20.withOpacity(0.5),
              );
            },

            ),
          ),
        ],
      ),
    );
  }
}
