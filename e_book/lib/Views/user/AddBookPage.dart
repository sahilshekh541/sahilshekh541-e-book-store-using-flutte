import 'package:e_book/Components/addbooktextfield.dart';
import 'package:e_book/Controllers/Bookcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  BookController bookcontroller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 400,
            color: Theme.of(context).colorScheme.primary,
            child: Column(children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Image(image: Svg('Assets/Icons/back.svg')),
                          Text(
                            ' BACK',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Text(
                    'Add New Book',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ).paddingOnly(top: 40, left: 10, bottom: 50),
              Obx(() => Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        bookcontroller.pickImage();
                      },
                      child: bookcontroller.bookcoverupload.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : bookcontroller.imageurl.value == ""
                              ? Image.asset('Assets/Icons/addImage.png')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                      bookcontroller.imageurl.value)),
                    ),
                  ))
            ]),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: bookcontroller.bookpdfupload.value
                        ? IconButton(
                            onPressed: () {},
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Delete',
                                )
                              ],
                            ))
                        : bookcontroller.ispdfupload.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : addbookbutton(
                                text: 'Book PDF',
                                onPressed: () {
                                  bookcontroller.pickPdf();
                                },
                              )),
              ],
            ).paddingSymmetric(horizontal: 5),
          ),
          Column(
            children: [
              booktextfields(
                controller: bookcontroller.booktitle,
                title: 'Book Title',
                icon: Icons.book,
              ).paddingOnly(bottom: 5),
              TextFormField(
                controller: bookcontroller.bookdescription,
                maxLines: 5,
                decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    hintText: 'Book Description',
                    enabledBorder: InputBorder.none,
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3)),
              ).paddingOnly(bottom: 5),
              booktextfields(
                controller: bookcontroller.authorname,
                title: 'Author Name',
                icon: Icons.person,
              ).paddingOnly(bottom: 5),
              Row(
                children: [
                  Expanded(
                    child: booktextfields(
                      controller: bookcontroller.price,
                      title: 'Price',
                      icon: Icons.currency_rupee_sharp,
                    ).paddingOnly(bottom: 5, right: 5),
                  ),
                  Expanded(
                    child: booktextfields(
                      controller: bookcontroller.pages,
                      title: 'Pages',
                      icon: Icons.pages,
                    ).paddingOnly(bottom: 5),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: booktextfields(
                      controller: bookcontroller.language,
                      title: 'Language',
                      icon: Icons.language,
                    ).paddingOnly(bottom: 5, right: 5),
                  ),
                  Expanded(
                    child: booktextfields(
                      controller: bookcontroller.audiolen,
                      title: 'Audio Len',
                      icon: Icons.audiotrack_sharp,
                    ).paddingOnly(bottom: 5),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        onPressed: oncancle,
                        child: Text('Cancle')),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: addbookbutton(
                      text: 'Post',
                      onPressed: () {
                        bookcontroller.bookuploadtoFirebase();
                        oncancle();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            content: const Text('Book succesfully upload')));
                      },
                    ),
                  ),
                ],
              )
            ],
          ).paddingSymmetric(horizontal: 5, vertical: 5)
        ],
      )),
    );
  }

  oncancle() {
    bookcontroller.booktitle.clear();
    bookcontroller.bookdescription.clear();
    bookcontroller.authorname.clear();
    bookcontroller.price.clear();
    bookcontroller.pages.clear();
    bookcontroller.language.clear();
    bookcontroller.audiolen.clear();
    bookcontroller.imageurl.value = '';
    bookcontroller.pdfurl.value = '';
    bookcontroller.bookpdfupload.value = false;
  }
}
