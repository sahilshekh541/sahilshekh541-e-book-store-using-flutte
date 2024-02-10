class BookModel {
  final String? id;
  final String? title;
  final String? description;
  final String? rating;
  final int? pages;
  final String? bookCover;
  final String? language;
  final int? audioLen;
  final String? author;
  final String? aboutAuthor;
  final String? aboutBook;
  final String? bookurl;
  final String? audiourl;
  final String? category;
  final int? price;
  final int? numberofRating;
  const BookModel(
      {required this.id,
      required this.description,
      this.rating,
      required this.pages,
      required this.bookCover,
      required this.language,
      required this.title,
      required this.audioLen,
      required this.author,
      this.aboutAuthor,
      this.aboutBook,
      required this.bookurl,
      this.audiourl,
      this.category,
      required this.price,
      this.numberofRating});
  BookModel copyWith(
      {String? id,
      String? title,
      String? description,
      String? rating,
      int? pages,
      String? language,
      int? audioLen,
      String? author,
      String? aboutAuthor,
      String? aboutBook,
      String? bookurl,
      String? audiourl,
      String? category,
      int? price,
      int? numberofRating}) {
    return BookModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        rating: rating ?? this.rating,
        pages: pages ?? this.pages,
        audioLen: audioLen ?? this.audioLen,
        bookCover: bookCover ?? this.bookCover,
        language: language ?? this.language,
        author: author ?? this.author,
        aboutAuthor: aboutAuthor ?? this.aboutAuthor,
        aboutBook: aboutBook ?? this.aboutBook,
        bookurl: bookurl ?? this.bookurl,
        audiourl: audiourl ?? this.audiourl,
        category: category ?? this.category,
        price: price ?? this.price,
        numberofRating: numberofRating ?? this.numberofRating);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'rating': rating,
      'pages': pages,
      'bookCover': bookCover,
      'language': language,
      'audioLen': audioLen,
      'author': author,
      'aboutAuthor': aboutAuthor,
      'aboutBook': aboutBook,
      'bookurl': bookurl,
      'audiourl': audiourl,
      'category': category,
      'price': price,
      'numberofRating': numberofRating
    };
  }

  static BookModel fromJson(Map<String, Object?> json) {
    return BookModel(
        id: json['id'] == null ? null : json['id'] as String,
        title: json['title'] == null ? null : json['title'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        rating: json['rating'] == null ? null : json['rating'] as String,
        pages: json['pages'] == null ? null : json['pages'] as int,
        bookCover:
            json['bookCover'] == null ? null : json['bookCover'] as String,
        language: json['language'] == null ? null : json['language'] as String,
        audioLen: json['audioLen'] == null ? null : json['audioLen'] as int,
        author: json['author'] == null ? null : json['author'] as String,
        aboutAuthor:
            json['aboutAuthor'] == null ? null : json['aboutAuthor'] as String,
        aboutBook:
            json['aboutBook'] == null ? null : json['aboutBook'] as String,
        bookurl: json['bookurl'] == null ? null : json['bookurl'] as String,
        audiourl: json['audiourl'] == null ? null : json['audiourl'] as String,
        category: json['category'] == null ? null : json['category'] as String,
        price: json['price'] == null ? null : json['price'] as int,
        numberofRating: json['numberofRating'] == null
            ? null
            : json['numberofRating'] as int);
  }

  @override
  String toString() {
    return '''BookModel(
                id:$id,
title:$title,
description:$description,
rating:$rating,
pages:$pages,
language:$language,
audioLen:$audioLen,
author:$author,
aboutAuthor:$aboutAuthor,
aboutBook:$aboutBook,
bookurl:$bookurl,
audiourl:$audiourl,
category:$category,
price:$price,
numberofRating:$numberofRating
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is BookModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.rating == rating &&
        other.pages == pages &&
        other.language == language &&
        other.audioLen == audioLen &&
        other.author == author &&
        other.aboutAuthor == aboutAuthor &&
        other.aboutBook == aboutBook &&
        other.bookurl == bookurl &&
        other.audiourl == audiourl &&
        other.category == category &&
        other.price == price &&
        other.numberofRating == numberofRating;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        title,
        description,
        rating,
        pages,
        language,
        audioLen,
        author,
        aboutAuthor,
        aboutBook,
        bookurl,
        audiourl,
        category,
        price,
        numberofRating);
  }
}
