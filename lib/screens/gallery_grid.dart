import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/full_image.dart';

class GalleryGrid extends StatelessWidget {
  final String title;
  final String location;
  final List<String> imageLinks;

  const GalleryGrid({
    super.key,
    required this.title,
    required this.location,
    required this.imageLinks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
            Text(
              location,
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Colors.white54,
                  fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              // childCount: imageLinks.length,
              children: [
                for (var i in imageLinks) _buildSingleImage(context, i)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSingleImage(BuildContext context, String imageUrl) {
    return Hero(
      tag: imageUrl,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullImage(
                imageURL: imageUrl,
                title: title,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
