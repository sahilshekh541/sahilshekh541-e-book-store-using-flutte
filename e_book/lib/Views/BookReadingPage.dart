import 'package:e_book/Controllers/pdfcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookReadingPage extends StatefulWidget {
  final String bookurl;
  const BookReadingPage({super.key, required this.bookurl});

  @override
  State<BookReadingPage> createState() => _BookReadingPageState();
}

class _BookReadingPageState extends State<BookReadingPage> {
  PdfController pdfController = Get.put(PdfController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'BOOK TITLE',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.background),
          ),
          leading: IconButton(
            onPressed: Get.back,
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.background,
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pdfController.pdfviewerkey.currentState?.openBookmarkView();
        },
        child: Icon(
          Icons.bookmark,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      body: SfPdfViewer.network(
        widget.bookurl,
        key: pdfController.pdfviewerkey,
      ),
    );
  }
}
