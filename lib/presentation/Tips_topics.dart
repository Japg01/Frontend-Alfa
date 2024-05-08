
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/navegation.dart';
import 'Tips_Detailed.dart';

class Tips_n_Topics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Tips",
      debugShowCheckedModeBanner: false,
      home: Tips_n_Topics_Screen(),
    );
  }
}

class Tips_n_Topics_Screen extends StatefulWidget{

  const Tips_n_Topics_Screen({super.key});
  @override
  _Tips_n_Topics_state createState() => _Tips_n_Topics_state();

}

class _Tips_n_Topics_state extends State<Tips_n_Topics_Screen>{

  List<String> imageUrls = [
    'https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-trainer-in-gym-royalty-free-image-1584723855.jpg',
    'https://i0.wp.com/www.muscleandfitness.com/wp-content/uploads/2018/12/Personal-Trainer-Training-Partner-GettyImages-654427364.jpg?quality=86&strip=all',
    'https://serviceninjas.in/wp-content/uploads/2021/12/yoga-2.jpg',
    'https://www.doyou.com/wp-content/uploads/2021/01/Kathryn-Budig-Yoga.jpg',
    'https://production-next-images-cdn.thumbtack.com/i/440633394583134208/desktop/standard/400square-legacy',
  ];
  List<String> imageTitles = [
    'Tip 1',
    'Tip 2',
    'Tip 3',
    'Tip 4',
    'Tip 5',
  ];
  List<String> imageSubtitles = [
    'Subtitle 1',
    'Subtitle 2',
    'Subtitle 3',
    'Subtitle 4',
    'Subtitle 5',
  ];

  List<String> Categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
  ];

  List<String> descriptions = [
    'Descripcion 1',
    'Descripcion 2',
    'Descripcion 3',
    'Descripcion 4',
    'Descripcion 5',
  ];
  List<String> dates = [
    '20/04/23',
    '15/03/21',
    '12/04/22',
    '01/12/23',
    '02/10/23',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Tips_n_Topics_appbar(
        title: "Tips & Topics",
        onCategoryTapped: (index) {
          // Handle category tapping based on the index
          switch (index) {
            case 0:
              break;
            case 1:
            // Handle Strength Training category tapping
              break;
          // Add cases for the rest of the categories
            default:
              break;
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4F14A0), Color(0xFF8066FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Image.asset('assets/icons/rayo.png',
              color: Colors.white, width: 35.0, height: 35.0),
        ),
      ),
      body: Expanded(
        child: Tips_n_Topics_body(
          imageUrls: imageUrls,
          titles: imageTitles,
          categories: Categories,
          dates: dates,
          subtitles: imageSubtitles,
        ),
      ),
      bottomNavigationBar: const BarraNavegacion(),
    );
  }
}

class Tips_n_Topics_body extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> titles;
  final List<String> categories;
  final List<String> dates;
  final List<String> subtitles;

  const Tips_n_Topics_body({
    super.key,
    required this.imageUrls,
    required this.titles,
    required this.categories,
    required this.dates,
    required this.subtitles
  });

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
            SizedBox(
              height: 240,
              child: HorizontalCarousel(
                imageUrls: imageUrls,
                titles: titles,
                categories: categories,
                dates: dates,
              ),
            ),
            SizedBox(
              height: 40,
              child:
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recent Post", style: TextStyle( fontSize: 24)),
                            Positioned(
                              child: ElevatedButton(
                                  onPressed: /* navigate a una pantalla */ null,
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
                                  ),
                                  child: const Text('See All >', style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  )
                                  )
                              )
                            ),
                          ]
                      ),
                )
            ),
            /*Flexible(
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomInset, left: 8,right: 8),
                child: ListView.builder(
                  itemCount: panels.length,
                  itemBuilder: (context, index) {
                    final panel = panels[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Image.network(
                                panel['urlImage']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Text(
                              panel['description']!,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),*/
      ],
    );
  }
}

class HorizontalCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> titles;
  final List<String> categories;
  final List<String> dates;

  const HorizontalCarousel({
    super.key,
    required this.imageUrls,
    required this.titles,
    required this.categories,
    required this.dates,
  });

  @override
  _HorizontalCarouselState createState() => _HorizontalCarouselState();
}

class _HorizontalCarouselState extends State<HorizontalCarousel> {
  late CarouselController _carouselController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          widget.imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
                                ),
                                onPressed: () => navigateToDetailed(
                                    context,
                                    widget.titles[index],
                                    "Descripcion Descripcion Descripcion Descripcion Descripcion ",
                                    widget.imageUrls[index]),
                                child:
                                  Text(
                                    widget.titles[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.categories[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Text(
                                    widget.dates[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 0.6,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(3),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.imageUrls.length,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CircleAvatar(
                  radius: 5.0,
                  backgroundColor: _currentPage == index
                      ? Theme.of(context).primaryColor
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          )
        ),
      ],
    );
  }

  void navigateToDetailed(BuildContext context,String title, String description, String url_){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Widgets_Tips_Detailed(desc: description,title: title ,urlTitleImage: url_ ))
      );
  }

}


class Tips_n_Topics_appbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 50);

  final String title;
  final List<String> categories = [
    'Yoga',
    'Strength Training',
    'Cardio',
    'Pilates',
    'Cycling',
    'Running',
  ];

  final void Function(int) onCategoryTapped;

  Tips_n_Topics_appbar({
    required this.title,
    required this.onCategoryTapped,
  });

  @override
  _Tips_n_Topics_appbarState createState() => _Tips_n_Topics_appbarState();
}

class _Tips_n_Topics_appbarState extends State<Tips_n_Topics_appbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(50),
      ),
      child: AppBar(
        title: Row(
          children: [
            const BackButton(color: Colors.white),
            SizedBox(width: 10.0),
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
            child: SizedBox(
              height: 20.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      widget.onCategoryTapped(index);
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        IntrinsicWidth(
                          child: Container(
                            decoration: BoxDecoration(
                              color: index == _selectedIndex
                                  ? Colors.deepPurple
                                  : Colors.deepPurple.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 8.0,
                                  height: 14.0,
                                  decoration: BoxDecoration(
                                    color: index == _selectedIndex
                                        ? Colors.white
                                        : Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: Text(
                                    widget.categories[index],
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: index == _selectedIndex
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 16.0),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.transparent,
      ),
    );
  }
}



