// import 'package:flutter/material.dart';
// import 'package:news_app_star/presentation/widgets/news_card.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF5F6FA),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Simple News",
//           style: TextStyle(
//             color: Colors.blue,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search, color: Colors.black87),
//             onPressed: () {},
//           ),
//           // const SizedBox(width: 8),
//           // IconButton(
//           //   icon: const Icon(Icons.wb_sunny_outlined, color: Colors.black87),
//           //   onPressed: () {},
//           // ),
//           const SizedBox(width: 10),
//         ],
//       ),

//       // ================= BODY =================
//       body: ListView.builder(itemBuilder: (context, index) {
//         // itemCount: 10;
//         return NewsCard(
//           image: "https://picsum.photos/500/300?random=$index",
//           mainText: "News Title $index",
//           subText: "This is the subtitle for news item $index.", pusblishedFromNow: '5 MINS AGO',
//         );
//       }),

//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark_border),
//             label: "Saved",
//           ),

//         ],
//       ),
//     );
//   }

//   }

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
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Simple News",
          style: TextStyle(
            color: MyColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          // const SizedBox(width: 8),
          // IconButton(
          //   icon: const Icon(Icons.wb_sunny_outlined, color: Colors.black87),
          //   onPressed: () {},
          // ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NewsSuccess) {
            return NewsListWidget(articles: state.articles);
          }

          if (state is NewsError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: MyColors.primaryColor,
        unselectedItemColor: Colors.grey,
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
}
