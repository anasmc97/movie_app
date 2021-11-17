// part of 'services.dart';


// class DbHelper {
//   static DbHelper? dbHelper;
//   static Database? _database;  
//   DbHelper._createObject();

//   factory DbHelper() {
//     if (dbHelper == null) {
//       dbHelper = DbHelper._createObject();
//     }
//     return dbHelper;
//   }

//   Future<Database> initDb() async {

//   //untuk menentukan nama database dan lokasi yg dibuat
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'jadwal.db';

//    //create, read databases
//     var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

//     //mengembalikan nilai object sebagai hasil dari fungsinya
//     return todoDatabase;
//   }

//     //buat tabel baru dengan nama jadwal
//   void _createDb(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE jadwal (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         hari TEXT,
//         jam TEXT,
//         bunyi TEXT
//       )
//     ''');
//   }

//   Future<Database> get database async {
//     if (_database == null) {
//       _database = await initDb();
//     }
//     return _database;
//   }

//   Future<List<Map<String, dynamic>>> selectbyHari(String hari) async {
//     Database db = await this.database;
//     var mapList = await db.query('jadwal', orderBy: 'hari',
//      where: 'hari=?', whereArgs: [hari]
//      );
//     return mapList;
//   }

//   Future<List<Map<String, dynamic>>> selectbyHaridanJam(String hari, String jam) async {
//     Database db = await this.database;
//     var mapList = await db.rawQuery("SELECT * FROM jadwal WHERE hari=? and jam=? " , [hari,jam]);
//     return mapList;
//   }

//    Future<List<Map<String, dynamic>>> select() async {
//     Database db = await this.database;
//     var mapList = await db.query('jadwal', orderBy: 'hari');
//     return mapList;
//   }

// //create databases
//   Future<int> insert(Jadwal object) async {
//     Database db = await this.database;
//     int count = await db.insert('jadwal', object.toMap());
//     return count;
//   }
// //update databases
//   Future<int> update(Jadwal object) async {
//     Database db = await this.database;
//     int count = await db.update('jadwal', object.toMap(), 
//                                 where: 'id=?',
//                                 whereArgs: [object.id]);
//     return count;
//   }

// //delete databases
//   Future<int> delete(int id) async {
//     Database db = await this.database;
//     int count = await db.delete('jadwal', 
//                                 where: 'id=?', 
//                                 whereArgs: [id]);
//     return count;
//   }
  
//   Future<List<Jadwal>> getJadwal(String hari, String jam) async {
//     var jadwalMap = await selectbyHaridanJam(hari, jam);
//     int count = jadwalMap.length;
//     List<Jadwal> jadwal = List<Jadwal>();
//     for (int i=0; i<count; i++) {
//       jadwal.add(Jadwal.fromMap(jadwalMap[i]));
//     }
//     return jadwal;
//   }

//   Future<List<Jadwal>> getjadwalListbyHari(String hari) async {
//     var jadwalMapList = await selectbyHari(hari);
//     int count = jadwalMapList.length;
//     List<Jadwal> jadwalList = List<Jadwal>();
//     for (int i=0; i<count; i++) {
//       jadwalList.add(Jadwal.fromMap(jadwalMapList[i]));
//     }
//     return jadwalList;
//   }

//     Future<List<Jadwal>> getjadwalList() async {
//     var jadwalMapList = await select();
//     int count = jadwalMapList.length;
//     List<Jadwal> jadwalList = List<Jadwal>();
//     for (int i=0; i<count; i++) {
//       jadwalList.add(Jadwal.fromMap(jadwalMapList[i]));
//     }
//     return jadwalList;
//   }


// }