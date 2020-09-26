import 'package:get_it/get_it.dart';
import 'package:test_idtmessaging/repositories/conversation_repo.dart';

GetIt getIt = GetIt.instance;

void setupServices() {
  getIt.registerLazySingleton(() => ConversationRepo());
}
