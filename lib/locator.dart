import 'package:service_creed/viewmodels/feed/feed_viewmodel.dart';
import 'package:service_creed/viewmodels/saved_posts/saved_posts_viewmodel.dart';
import 'package:service_creed/viewmodels/smp_group/smp_group_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => FeedViewModel());
  locator.registerFactory(() => SavedPostsViewModel());
  locator.registerFactory(() => SmpGroupModel());
}
