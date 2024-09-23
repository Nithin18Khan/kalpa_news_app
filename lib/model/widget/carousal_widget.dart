import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsCarousel extends StatelessWidget {
  final List<Map<String, String>> imageDetails; // List of maps containing image URLs and headlines

  NewsCarousel({required this.imageDetails});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0, // Adjust the height as needed
        autoPlay: true,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0, // Full-width carousel
      ),
      items: imageDetails.map((detail) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              fit: StackFit.expand, // Make sure the stack takes full width and height
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    detail['imageUrl']!,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.black.withOpacity(0.5), // Semi-transparent background
                    child: Text(
                      detail['author']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis, // Ensure text doesn't overflow
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
