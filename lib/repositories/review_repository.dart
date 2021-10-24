import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:not_a_letterboxd_clone/models/models.dart';

abstract class BaseReviewRepository {
  Future<List<Review>> getReviews({required int page});
}

class ReviewRepository implements BaseReviewRepository {
  @override
  Future<List<Review>> getReviews({required int page}) async {
    final response = await rootBundle.loadString(
      'assets/data/reviews.json',
    );
    final List<dynamic> reviews = json.decode(response);
    return reviews.map((e) => Review.fromJson(e)).toList();
  }
}
