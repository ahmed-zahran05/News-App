import 'package:flutter/material.dart';
import 'package:newsapp/Config/Theme/AppStyles.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigateToWebsiteButton extends StatelessWidget {
   NavigateToWebsiteButton({super.key , required this.url});
  String url;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
        Navigator.pop(context);
      },
      child:  Text("View Full Article" , style: AppStyles.WebButton,)
    );
  }
}
