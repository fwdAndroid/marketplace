import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/screens/detail/service_detail.dart';
import 'package:marketplace/utils/colors.dart';

class JobsHired extends StatefulWidget {
  const JobsHired({super.key});

  @override
  State<JobsHired> createState() => _JobsHiredState();
}

class _JobsHiredState extends State<JobsHired> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/person.png"),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Center(
            child: Text(
              "Estudio juridico Alvarez",
              style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w900, fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text(
              "Jobs Hired By Me",
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Divider(
              color: iconColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ServiceDetail()));
            },
            title: Text(
              "Accounting services and legal advice",
              style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w500, fontSize: 16),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: colorBlack,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Divider(
              color: iconColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ServiceDetail()));
            },
            title: Text(
              "Family assistance and legal advice",
              style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w500, fontSize: 16),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: colorBlack,
            ),
          ),
        ],
      ),
    );
  }
}
