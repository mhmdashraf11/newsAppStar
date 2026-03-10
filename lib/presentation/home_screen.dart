import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_star/business_logic/cubit/news_cubit.dart';
import 'package:news_app_star/constants/my_colors.dart';
import 'package:news_app_star/presentation/widgets/news_error_widget.dart';
import 'package:news_app_star/presentation/widgets/news_list_widget.dart';
import 'package:news_app_star/presentation/widgets/news_loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  late final List<Widget> screens;
  final TextEditingController searchController = TextEditingController();
  int currentIDX = 0;
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getTopHeadlines();
    screens = [buildHomeBody(), const Center(child: Text("Saved News"))];
  }

  void stopSearching() {
    setState(() {
      isSearching = false;
      searchController.clear();
    });

    context.read<NewsCubit>().getTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: isSearching
        //     ? buildSearchField()
        //     : const Text(
        //         "Simple News",
        //         style: TextStyle(
        //           color: MyColors.primaryColor,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        title: currentIDX == 0
            ? (isSearching
                  ? buildSearchField()
                  : const Text(
                      "Simple News",
                      style: TextStyle(
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
            : const Text(
                "Saved News",
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: buildAppBarActions(),
      ),
      body: screens[currentIDX],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIDX,
        selectedItemColor: MyColors.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIDX = index;
          });

          if (index == 0) {
            context.read<NewsCubit>().getTopHeadlines();
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: "Saved",
          ),
        ],
      ),
    );
  }

  Widget buildSearchField() {
    return TextField(
      controller: searchController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Search news...",
        border: InputBorder.none,
      ),
      onChanged: (text) {
        if (text.isNotEmpty) {
          context.read<NewsCubit>().searchWithDebounce(text);
        } else {
          context.read<NewsCubit>().getTopHeadlines();
        }
      },
    );
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            stopSearching();
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            setState(() {
              isSearching = true;
            });
          },
        ),
      ];
    }
  }
}

class buildHomeBody extends StatelessWidget {
  const buildHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NewsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: MyColors.primaryColor),
          );
        }

        if (state is NewsSuccess) {
          return NewsListWidget(articles: state.articles);
        }

        if (state is NewsError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
