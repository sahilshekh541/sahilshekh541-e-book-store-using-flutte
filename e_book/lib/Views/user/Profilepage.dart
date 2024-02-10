import 'package:e_book/Components/Booklists/userbooktile.dart';
import 'package:e_book/Controllers/Bookcontroller.dart';
import 'package:e_book/Controllers/googleAuthController.dart';
import 'package:e_book/Views/user/AddBookPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddBookPage());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Hero(
                transitionOnUserGestures: true,
                tag: 'dp',
                child: Image(image: Svg('Assets/Icons/back.svg')))),
        centerTitle: true,
        title: Text('Profile',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.white, letterSpacing: 1.5)),
        actions: [
          IconButton(
              onPressed: () {
                authController.signOut();
              },
              icon: Icon(
                Icons.logout,
                size: 30,
                color: Theme.of(context).colorScheme.background,
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('Assets/Icons/userdp.jpg'),
                              fit: BoxFit.cover),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Nitish Kumar',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white, fontSize: 18)),
                const SizedBox(
                  height: 15,
                ),
                Text('nitishkumar@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white, letterSpacing: 1.7))
              ],
            ),
          ),
          // See the book's which uploaded by this user
          Text('Your Books', style: Theme.of(context).textTheme.labelLarge)
              .paddingAll(10),
          Column(
            children: bookController.userbookdata
                .map((e) => UserBookTile(
                    image: e.bookCover.toString(),
                    title: e.title.toString(),
                    author: e.author.toString(),
                    price: e.price.toString(),
                    rating: e.rating.toString(),
                    totalrating: e.numberofRating.toString()))
                .toList()
              ..removeLast(),
          ).paddingOnly(left: 10, right: 10)
        ],
      )),
    );
  }
}
