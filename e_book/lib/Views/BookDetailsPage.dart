import 'package:e_book/Models/BooksModel.dart';
import 'package:e_book/Models/Colors.dart';
import 'package:e_book/Views/BookReadingPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;
  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: back,
                            child: Container(
                                child: Row(
                              children: [
                                const Image(
                                  image: Svg('Assets/Icons/back.svg'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('Back',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(color: Colors.white))
                              ],
                            ))),
                        GestureDetector(
                          onTap: () {},
                          child: const Image(
                            image: Svg('Assets/Icons/heart.svg'),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 3,
                          spreadRadius: 4,
                          offset: const Offset(2, 4))
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        book.bookCover.toString(),
                        width: 150,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    book.title.toString(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.background),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Author : ${book.author.toString()}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.7))),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(book.description.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.7))),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Rating',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(book.rating.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text('Pages',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(book.pages.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text('Language',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(book.language.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text('Audio',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(book.audioLen.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Book',
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(book.aboutBook.toString(),
                      textAlign: TextAlign.justify,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: labelcolor)),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('About Author',
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(book.aboutAuthor.toString(),
                      textAlign: TextAlign.justify,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: labelcolor)),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(BookReadingPage(
                                          bookurl: book.bookurl.toString(),
                                        ));
                                      },
                                      child: SizedBox(
                                        child: Row(
                                          children: [
                                            const Image(
                                                image: Svg(
                                                    'Assets/Icons/book.svg')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'READ BOOK',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      letterSpacing: 1.5,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .background),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 3,
                                      height: 30,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      child: InkWell(
                                        onTap: () {
                                          print('play');
                                        },
                                        child: Row(children: [
                                          const Image(
                                              image: Svg(
                                                  'Assets/Icons/playe.svg')),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Play BOOK',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    letterSpacing: 1.5,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background),
                                          )
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  back() {
    Get.back();
  }
}
