import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SessionManager {
  final DatabaseFactory dbFactory = databaseFactoryIo;
  final StoreRef<String, dynamic> store =
      StoreRef<String, dynamic>('userSession');
  static final SessionManager _singleton = SessionManager._internal();

  SessionManager._internal();

  factory SessionManager() {
    return _singleton;
  }

  Future<Database> getDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = directory.path;
    final db = await dbFactory.openDatabase('$dbPath/userSession.db');
    return db;
  }

  Future<void> saveSession(Map<String, dynamic> sessionData) async {
    final db = await getDatabase();
    await store.record('session').put(db, sessionData);
  }

  Future<Map<String?, dynamic>?> getSession() async {
    final db = await getDatabase();
    final sessionData = await store.record('session').get(db);
    return sessionData;
  }

  Future<void> deleteSession() async {
    final db = await getDatabase();
    await store.record('session').delete(db);
  }
}
