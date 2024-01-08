import 'package:flutter/material.dart';
import 'package:listview/models/datakoceng.dart';

class DetailKucing extends StatefulWidget {
  final Kucing kucing;
  final int index;

  const DetailKucing({Key? key, required this.kucing, required this.index})
      : super(key: key);

  @override
  State<DetailKucing> createState() => _DetailKucingState();
}

class _DetailKucingState extends State<DetailKucing> {
  late String heroTag;
  late Kucing kucing;
  late int index;
  // icon data
  IconData favoriteIcon = Icons.star;
  IconData notFavoriteIcon = Icons.favorite;

  @override
  void initState() {
    super.initState();
    kucing = widget.kucing;
    index = widget.index;
    heroTag = 'gbr_$index'; // Memperbaiki inisialisasi nilai heroTag
  }

  String formatRupiah(int value) {
    // Format value menjadi string dengan pemisah ribuan
    String formattedValue = value.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]},',
        );

    // Tambahkan 'Rp. ' di depan nilai
    return 'Rp. $formattedValue';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111111),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(137, 99, 97, 97), Color(0xFF000000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Hero(
                tag: heroTag,
                child: Image.network(
                  kucing.foto,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          kucing.nama,
                          style: const TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatRupiah(kucing.harga),
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow.shade500),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                kucing.beratBadan.toString(),
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Deksripsi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            kucing.catatanKhusus,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.amber),
                                minimumSize: MaterialStateProperty.all(Size(
                                    MediaQuery.of(context).size.width, 60))),
                            child: const Text(
                              "Hubungi Pemilik",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
