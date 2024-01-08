import 'package:flutter/material.dart';
import 'package:listview/models/datakoceng.dart';
import 'package:listview/screen/detail_kucing.dart';

class ListCat extends StatefulWidget {
  const ListCat({super.key});

  @override
  State<ListCat> createState() => _ListCatState();
}

class _ListCatState extends State<ListCat> {
  String formatRupiah(int value) {
    // Format value menjadi string dengan pemisah ribuan
    String formattedValue = value.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]},',
        );

    // Tambahkan 'Rp. ' di depan nilai
    return 'Rp. $formattedValue';
  }

  List<Kucing> dataKucing = Kucing.getDataKucing();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0.0,
        backgroundColor: Color(0xFF111111),
        title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://i.imgur.com/6kEsY5J.png",
                width: 30,
              ),
              const Text(
                "CatHouse",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          ClipOval(
            child: Image.network(
              "https://i.imgur.com/0g1mNKo.jpg",
              width: 50,
              fit: BoxFit.cover,
            ),
          )
        ]),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: const Color(0xFF111111),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Marketplace Kucing",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Bermacam makanan, mainan, kucing sehat dan kebutuhan lain.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    suffixIcon: Container(
                      width: 100,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            VerticalDivider(
                              color: Colors.grey.shade300,
                              thickness: 1.0,
                              indent: 10,
                              endIndent: 10,
                            ),
                            const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.tune, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Cari apa?',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kucing Banyak Disukai",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      "Lihat Semua",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 350,
                color: Colors.transparent,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailKucing(
                                      kucing: dataKucing[index],
                                      index: index))),
                        },
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xFF3772FF)
                                        .withOpacity(0.11),
                                    blurRadius: 30.0,
                                    spreadRadius: 0.0)
                              ]),
                          child: Column(children: [
                            ClipRRect(
                              child: Container(
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade300,
                                ),
                                child: Hero(
                                  tag: 'gbr_$index',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      dataKucing[index].foto,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama Kucing",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        dataKucing[index].nama,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Harga",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        formatRupiah(dataKucing[index].harga),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                    itemCount: dataKucing.length),
              ),
            ])),
      ),
    );
  }
}
