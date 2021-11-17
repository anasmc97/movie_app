part of 'pages.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class TicketPage extends StatefulWidget {
//   final bool isExpiredTicket;

//   TicketPage({this.isExpiredTicket = false});
//   @override
//   _TicketPageState createState() => _TicketPageState();
// }

// class _TicketPageState extends State<TicketPage> {
//   bool isExpiredTickets; //tiket yang blm kepake.

//   @override
//   void initState() { 
//     super.initState();
    
//     isExpiredTickets = widget.isExpiredTicket;
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           //note: CONTENT
//           BlocBuilder<TicketBloc, TicketState>(
//               builder: (_, ticketState) => Container(
//                     margin: EdgeInsets.symmetric(horizontal: defaultMargin),
//                     child: TicketViewer(isExpiredTickets //kalo true
//                         ? ticketState.tickets
//                             .where((ticket) => ticket.time.isBefore(DateTime
//                                 .now())) //ticketStatenya yang sebelum hari ini
//                             .toList()
//                         : ticketState.tickets //kalo false
//                             .where((ticket) => !ticket.time.isBefore(DateTime
//                                 .now())) //ticketStatenya merupakan kebalikan sebelum hari ini.karena ada operator not.
//                             .toList()),
//                   )),
//           //note: HEADER
//           Container(
//             //membuat warna status bar menjadi ungu
//             height: 113,
//             color: accentColor1,
//           ),
//           SafeArea(
//               child: ClipPath(
//             //menggunakan clipper tidak menggunakan border radius pada header adalah karena jika hanya menggunakan border radius maka warna kuning pada tab tidak kepotong sesuai ukuran header bagian bawah. Maka dari itu menggunakan clipPath.
//             clipper: HeaderClipper(),
//             child: Container(
//               height: 113,
//               color: accentColor1,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   Container(
//                       margin: EdgeInsets.only(left: 24, bottom: 32),
//                       child: Text(
//                         "My Tickets",
//                         style: whiteTextFont.copyWith(fontSize: 20),
//                       )),
//                   Row(
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           Column(
//                             children: <Widget>[
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     isExpiredTickets =
//                                         !isExpiredTickets; //nilai boolean isExpiredTickets diberikan not sehingga keluarannya berubah menjadi berlawanan. Kalo true jadi false, false jadi true
//                                   });
//                                 },
//                                 child: Text('Newest',
//                                     style: whiteTextFont.copyWith(
//                                         fontSize: 16,
//                                         color: !isExpiredTickets
//                                             ? Colors.white
//                                             : Color(0xFF6F678E))),
//                               ),
//                               SizedBox(height: 15),
//                               //note: Garis kuning pada TAB
//                               Container(
//                                 height: 4,
//                                 width: MediaQuery.of(context).size.width *
//                                     0.5, //diberikan warna kuning setengah layar.
//                                 color: !isExpiredTickets
//                                     ? accentColor2
//                                     : Colors.transparent,
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: <Widget>[
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 isExpiredTickets =
//                                     !isExpiredTickets; //nilai boolean isExpiredTickets diberikan not sehingga keluarannya berubah menjadi berlawanan. Kalo true jadi false, false jadi true
//                               });
//                             },
//                             child: Text('Oldest',
//                                 style: whiteTextFont.copyWith(
//                                     fontSize: 16,
//                                     color: isExpiredTickets
//                                         ? Colors.white
//                                         : Color(0xFF6F678E))),
//                           ),
//                           SizedBox(height: 15),
//                           //note: Garis kuning pada TAB
//                           Container(
//                             height: 4,
//                             width: MediaQuery.of(context).size.width *
//                                 0.5, //diberikan warna kuning setengah layar.
//                             color: isExpiredTickets
//                                 ? accentColor2
//                                 : Colors.transparent,
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }

// //menggunakan clipper tidak menggunakan border radius pada header adalah karena jika hanya menggunakan border radius maka warna kuning pada tab tidak kepotong sesuai ukuran header bagian bawah. Maka dari itu menggunakan clipPath.
// class HeaderClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.lineTo(0, size.height - 20);
//     path.quadraticBezierTo(0, size.height, 20, size.height);
//     path.lineTo(size.width - 20, size.height);
//     path.quadraticBezierTo(
//         size.width, size.height, size.width, size.height - 20);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// class TicketViewer extends StatelessWidget {
//   final List<Ticket> tickets;
//   TicketViewer(this.tickets);
//   @override
//   Widget build(BuildContext context) {
//     var sortedTickets = tickets;
//     sortedTickets.sort((ticket1, ticket2) => ticket1.time
//         .compareTo(ticket2.time)); //mengurutkan ticket menurut waktunya.

//     return ListView.builder(
//       itemCount: sortedTickets.length, //bnyaknya ticket yang sudah diurutkan
//       itemBuilder: (_, index) => GestureDetector(
//         onTap: (){
//           context.bloc<PagesBloc>().add(GoToTicketDetailPage(sortedTickets[index]));
//         },
//               child: Container(
//           margin: EdgeInsets.only(top: index == 0 ? 133 : 20),
//           child: Row(
//             //poster dan detailmovie
//             children: <Widget>[
//               Container(
//                 //gambar poster
//                 width: 70,
//                 height: 90,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: DecorationImage(
//                         image: NetworkImage(imageBaseUrl +
//                             'w500' +
//                             sortedTickets[index].movieDetail.posterPath),
//                         fit: BoxFit.cover)),
//               ),
//               SizedBox(width: 16),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width -
//                     2 * defaultMargin -
//                     70 -
//                     16,
//                 child: Column(
//                   //detail movie
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       sortedTickets[index].movieDetail.title,
//                       style: blackTextFont.copyWith(fontSize: 18),
//                       maxLines: 2,
//                       overflow: TextOverflow.clip,
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       sortedTickets[index].movieDetail.genresAndLanguage,
//                       style: greyTextFont.copyWith(
//                           fontSize: 12, fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       sortedTickets[index].theater.name,
//                       style: greyTextFont.copyWith(
//                           fontSize: 12, fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
