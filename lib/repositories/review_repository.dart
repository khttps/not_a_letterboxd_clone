import 'package:not_a_letterboxd_clone/models/models.dart';

abstract class BaseReviewRepository {
  Future<List<Review>> getReviews({required int page});
}
