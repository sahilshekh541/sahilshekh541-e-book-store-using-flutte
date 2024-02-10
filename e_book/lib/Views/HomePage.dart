import 'package:e_book/Components/Booklists/booklist.dart';
import 'package:e_book/Components/Booktile.dart';
import 'package:e_book/Components/Topics.dart';
import 'package:e_book/Controllers/Bookcontroller.dart';
import 'package:e_book/Models/Colors.dart';
import 'package:e_book/Views/BookDetailsPage.dart';
import 'package:e_book/Views/user/Profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BookController bookcontroller = Get.put(BookController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Upper widgets
            Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              height: MediaQuery.of(context).size.height / 2.3,
              color: primarycolor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Image(image: Svg('Assets/Icons/dashboard.svg')),
                      Text(
                        'E-BOOK',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () => Get.to(ProfilePage(),
                            transition: Transition.leftToRight),
                        child: Hero(
                          tag: 'dp',
                          child: CircleAvatar(
                            foregroundImage:
                                AssetImage('Assets/Icons/userdp.jpg'),
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Good Morning 🤞, Ni30',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Time to read book and enhance your knowledge',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: backgroundcolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search book',
                          prefixIcon:
                              Image(image: Svg('Assets/Icons/search.svg'))),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Topics',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white, fontSize: 21),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TopicsBox(
                          icon: 'Assets/Icons/heart.svg',
                          title: 'Romance',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TopicsBox(
                          icon: 'Assets/Icons/plane.svg',
                          title: 'Travel',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TopicsBox(
                          icon: 'Assets/Icons/world.svg',
                          title: 'Documentory',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //Trending section
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Trending',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: bookcontroller.bookdata
                        .map((e) => Container(
                              height: 200,
                              width: 100,
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.4),
                                          blurRadius: 6,
                                          offset: const Offset(2, 2),
                                          spreadRadius: 1)
                                    ]),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(BookDetailPage(book: e));
                                          },
                                          child: Image.asset(
                                            e.bookCover.toString(),
                                            width: 100,
                                          ),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    e.title.toString(),
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  )
                                ],
                              ),
                            ))
                        .toList()),
              ),
            ),
            //Interest section
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your interests',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: booklist
                        .map((e) => BookTile(
                              onTap: () {
                                Get.to(BookDetailPage(book: e));
                              },
                              title: e.title.toString(),
                              image: e.bookCover.toString(),
                              author: e.author.toString(),
                              price: e.price.toString(),
                              rating: e.rating.toString(),
                              totalrating: e.numberofRating.toString(),
                            ))
                        .toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
