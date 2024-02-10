import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book/Models/BooksModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class BookController extends GetxController {
  final booktitle = TextEditingController();
  TextEditingController bookdescription = TextEditingController();
  TextEditingController authorname = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController pages = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController audiolen = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  final storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;
  RxString imageurl = "".obs;
  RxString pdfurl = "".obs;
  RxBool bookcoverupload = false.obs;
  RxBool ispdfupload = false.obs;
  RxBool bookpdfupload = false.obs;
  var bookdata = RxList<BookModel>();
  var userbookdata = RxList<BookModel>();
  int index = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getallbooks();
    getUserbooks();
  }

  void getallbooks() async {
    var books = await db.collection('Book').get();
    for (var book in books.docs) {
      bookdata.add(BookModel.fromJson(book.data()));
    }
  }

  void getUserbooks() async {
    var books = await db.collection('User-Books').get();
    for (var book in books.docs) {
      userbookdata.add(BookModel.fromJson(book.data()));
    }
  }

  void pickImage() async {
    bookcoverupload.value = true;

    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      print(image.path);
      uploadimagetoFirebase(File(image.path));
    }
  }

  void uploadimagetoFirebase(File image) async {
    var uuid = Uuid();
    var filename = uuid.v1();
    var storageref = storage.ref().child("Images/$filename");
    var response = await storageref.putFile(image);
    String downloadurl = await response.ref.getDownloadURL();
    imageurl.value = downloadurl;
    print('Download url: $downloadurl');
    bookcoverupload.value = false;
  }

  void pickPdf() async {
    ispdfupload.value = true;
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      File file = File(result.files.first.path!);
      if (file.existsSync()) {
        Uint8List filebytes = await file.readAsBytes();
        String pdfname = result.files.first.name;

        final response =
            await storage.ref().child('Pdf/$pdfname').putData(filebytes);

        final downloadurl = await response.ref.getDownloadURL();
        pdfurl.value = downloadurl;
        print(downloadurl);
        ispdfupload.value = false;
        bookpdfupload.value = true;
      } else {
        print('Files Does Not Exist');
      }
    }
  }

  void bookuploadtoFirebase() async {
    Map<String, dynamic> newbook = {
      'description': bookdescription.text,
      'pages': int.tryParse(pages.text),
      'bookCover': imageurl.value,
      'language': language.text,
      'title': booktitle.text,
      'audioLen': int.tryParse(audiolen.text.toString()),
      'author': authorname.text,
      'bookurl': pdfurl.value,
      'price': int.tryParse(price.text),
    };

    await db.collection("User-Books").add(newbook);
  }
}
