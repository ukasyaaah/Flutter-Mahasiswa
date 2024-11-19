import 'package:flutter/material.dart';
import 'package:flutter_restapi/providers/mahasiswa_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    await Future.delayed(Duration(seconds: 1)).then((value) async {
      await Provider.of<MahasiswaProvider>(context, listen: false)
          .getMahasiswa();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    MahasiswaProvider mahasiswaProvider =
        Provider.of<MahasiswaProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          'Mahasiswa',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: RefreshIndicator(
            onRefresh: () => getData(),
            child: ListView(
              children: mahasiswaProvider.mahasiswa
                  .map(
                    (e) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(1, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              "assets/user.jpg",
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Mahasiswa',
                                style: GoogleFonts.poppins().copyWith(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                e.name!,
                                style: GoogleFonts.poppins().copyWith(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                e.phone!,
                                style: GoogleFonts.poppins().copyWith(
                                  color: Colors.blueGrey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
