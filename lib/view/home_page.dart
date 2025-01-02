import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/app_util.dart';
import 'package:flutter_demo/view_model/app_vm.dart';
import 'package:flutter_demo/view_model/home_vm.dart';
import 'package:flutter_demo/widget/refresh_indicator.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  static const String routeName = "HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tec = TextEditingController();
  AppViewModel avm = AppUtils.context.read<AppViewModel>();
  HomeViewModel hvm = AppUtils.context.read<HomeViewModel>();
  IndicatorController ic = IndicatorController();

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    hvm.initGetMusicResult();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      bool isEmpty = (vm.musicResult?.results == null || vm.musicResult!.results!.isEmpty);

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: const Text("Demo"),
          leading: IconButton(onPressed: () => refreshData(), icon: const Icon(Icons.refresh), tooltip: "refresh"),
          actions: [
            IconButton(
              onPressed: () => vm.sortList(),
              icon: Icon(Icons.sort_by_alpha, color: vm.songNameSort ? Colors.white : null),
            ),
            IconButton(
              onPressed: () => vm.sortList(songNameSort: false),
              icon: Icon(Icons.sort, color: !vm.songNameSort ? Colors.white : null),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: CheckMarkIndicator(
            controller: ic,
            onRefresh: () async => await vm.getMusicResult(showLoading: false),
            child: Column(
              children: [
                buildSearchWidget(vm),
                (isEmpty) ? buildEmptyWidget() : buildListWidget(vm),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildSearchWidget(HomeViewModel vm) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: tec,
        onChanged: (v) => searchKey(vm, v),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: "Filter song or album names",
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: IconButton(onPressed: () => searchKey(vm, tec.text), icon: const Icon(Icons.search)),
        ),
      ),
    );
  }

  Widget buildEmptyWidget() {
    return const Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.no_sim_outlined, size: 60, color: Colors.blueGrey), Text("No Data")],
        ),
      ),
    );
  }

  Widget buildListWidget(HomeViewModel vm) {
    return Expanded(
      child: ListView.builder(
        itemCount: vm.musicResult?.results?.length ?? 0,
        itemBuilder: (context, index) {
          List list = vm.musicResult?.results ?? [];
          var music = vm.musicResult?.results?[index];
          if (music == null) return const Icon(Icons.no_sim_outlined);
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => selectedItem(vm, index),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side:
                          BorderSide(color: !music.isSelected ? Colors.transparent : Colors.blueGrey.withOpacity(0.5)),
                    ),
                    padding: EdgeInsets.zero,
                    elevation: music.isSelected ? null : 0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 80,
                          width: 80,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child: CachedNetworkImage(imageUrl: music.artworkUrl100 ?? "", fit: BoxFit.cover),
                        ),
                        Expanded(
                          child: DefaultTextStyle(
                            textAlign: TextAlign.end,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                buildItemWidget(label: "Song Name", value: music.trackName),
                                buildItemWidget(
                                  label: "Album Name",
                                  value: music.collectionName,
                                  color: Colors.teal,
                                ),
                                buildItemWidget(
                                  label: "Release Date",
                                  value: (music.releaseDate ?? "").substring(0, 10),
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (index == list.length - 1)
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Only display ${list.length} pieces of data",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildItemWidget({required String label, String? value, Color? color = Colors.blue}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label:"),
          Expanded(
            child: Text(
              value ?? "",
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void refreshData() async => await hvm.getMusicResult();

  void searchKey(HomeViewModel vm, String key) => vm.searchKey(key.trim());

  void selectedItem(HomeViewModel vm, int index) => vm.selectMusic(index);
}
