import 'package:flutter/material.dart';
import 'package:kalpas_news_app/model/search_model.dart';
import 'package:kalpas_news_app/model/widget/webview_screen.dart';

class SearchCard extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final String url;
  final SearchModel searchModel;
final String imageUrl;
  const SearchCard({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.url,
    required this.searchModel,
    required this.imageUrl
  }) : super(key: key);

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  bool _showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to WebViewScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: widget.searchModel.url),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular image using ClipOval
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipOval(
                child: Image.network(
                  widget.imageUrl,
                  width: 100, // Set the size of the image
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image, size: 50, color: Colors.red);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.date,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Description handling
                  _showFullDescription
                      ? Text(widget.description)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _showFullDescription = true;
                                });
                              },
                              child: Text('See more'),
                            ),
                          ],
                        ),
                  if (_showFullDescription)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showFullDescription = false;
                        });
                      },
                      child: Text('See less'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
