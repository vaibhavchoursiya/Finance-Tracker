import 'package:finence_tracker/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbServices {
  static late final Database database;
  static const String tableName = "Transactions";

  static Future<void> constructDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "FT.db");
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $tableName (id INTEGER PRIMARY KEY, note TEXT, category TEXT, date INTEGER, amount REAL, transactionType TEXT)
  ''');
      },
    );
    print("Db is constructed");
  }

  static Future<Map> insertTranscation(TransactionModel transaction) async {
    final res = await database.insert(tableName, transaction.toMap());

    if (res != 0) {
      return {"status": "success", "message": "added"};
    }
    return {"status": "failed", "errorMessage": "failed to add."};
  }

  static Future<List> getTranscations({bool showAllTransaction = true}) async {
    String query = 'SELECT * FROM $tableName';

    if (!showAllTransaction) {
      query = "SELECT * FROM $tableName LIMIT 10";
    }

    final List data = await database.rawQuery(query);
    List<TransactionModel> transactions = [];

    for (var i = data.length - 1; i >= 0; i--) {
      final item = data[i];
      transactions.add(TransactionModel(
          id: item["id"],
          category: item["category"],
          date: DateTime.fromMillisecondsSinceEpoch((item["date"] * 1000)),
          amount: item["amount"],
          transactionType: item["transactionType"],
          note: item["note"]));
    }

    return transactions;
  }

  static Future getBalance() async {
    final List data = await database.rawQuery('SELECT * FROM $tableName');
    List income = [];
    List expenses = [];

    for (var item in data) {
      if (item["transactionType"] == "Exp") {
        expenses.add(item["amount"]);
      } else if (item["transactionType"] == "Inc") {
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
      "totalIncome": totalIncome,
      "totalExpenses": totalExpenses,
      "totalBalance": totalIncome - totalExpenses
    };
  }

  static Future<void> deleteTranscation(int id) async {
    await database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  static Future getTransactionBetweenTwoDates(
      int date_1, int date_2, String transactionType) async {
    List data = await database.rawQuery(
        '''SELECT * FROM $tableName WHERE transactionType = '$transactionType' AND date BETWEEN $date_1 AND $date_2''');

    print("data between two datas : $data");
    List<TransactionModel> transactions = [];

    for (var i = data.length - 1; i >= 0; i--) {
      final item = data[i];
      transactions.add(TransactionModel(
          id: item["id"],
          category: item["category"],
          date: DateTime.fromMillisecondsSinceEpoch((item["date"] * 1000)),
          amount: item["amount"],
          transactionType: item["transactionType"],
          note: item["note"]));
    }

    return transactions;
  }
}
