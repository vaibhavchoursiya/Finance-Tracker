import 'package:finence_tracker/models/transcational_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbServices {
  static late final Database database;

  static Future<void> constructDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "FT.db");
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE IF NOT EXISTS Transcations (id INTEGER PRIMARY KEY, note TEXT, category TEXT, date TEXT, amount REAL, transcationalType TEXT)
  ''');
      },
    );
    print("Db is constructed");
  }

  static Future<Map> insertTranscation(TranscationalModel transcation) async {
    final res = await database.insert("Transcations", transcation.toMap());

    if (res != 0) {
      return {"status": "success", "message": "added"};
    }
    return {"status": "failed", "errorMessage": "failed to add."};
  }

  static Future<List> getTranscations() async {
    final List data = await database.rawQuery('SELECT * FROM Transcations');
    List<TranscationalModel> transcations = [];

    for (var item in data) {
      transcations.add(TranscationalModel(
          id: item["id"],
          category: item["category"],
          date: DateTime.parse(item["date"]),
          amount: item["amount"],
          transcationalType: item["transcationalType"],
          note: item["note"]));
    }

    return transcations;
  }

  static Future getBalance() async {
    final List data = await database.rawQuery('SELECT * FROM Transcations');
    List income = [];
    List expenses = [];

    for (var item in data) {
      if (item["transcationalType"] == "Exp") {
        expenses.add(item["amount"]);
      } else if (item["transcationalType"] == "Inc") {
        income.add(item["amount"]);
      }
    }

    double totalIncome = 0.0;
    for (var item in income) {
      totalIncome += item;
    }

    double totalExpenses = 0.0;
    for (var item in expenses) {
      totalExpenses += item;
    }

    return {
      "income": totalExpenses,
      "expenses": totalExpenses,
      "totalBalance": totalIncome - totalExpenses
    };
  }

  static Future<void> deleteTranscation(int id) async {
    await database.delete("Transcations", where: 'id = ?', whereArgs: [id]);
  }
}
