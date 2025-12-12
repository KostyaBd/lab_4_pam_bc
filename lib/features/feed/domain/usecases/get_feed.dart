import '../entities/feed.dart';
import '../repositories/feed_repository.dart';

class GetFeed {
  final FeedRepository repo;
  GetFeed(this.repo);

  Future<Feed> call() => repo.getFeed();
}
