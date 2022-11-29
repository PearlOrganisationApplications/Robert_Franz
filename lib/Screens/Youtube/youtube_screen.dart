import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:robert_franz/Screens/Youtube/video_screen.dart';

import 'Services/api_services.dart';
import 'Youtube Model/channel_model.dart';
import 'Youtube Model/video_model.dart';

class YoutubeHomeScreen extends StatefulWidget {
  const YoutubeHomeScreen({Key? key}) : super(key: key);

  @override
  State<YoutubeHomeScreen> createState() => _YoutubeHomeScreenState();
}

class _YoutubeHomeScreenState extends State<YoutubeHomeScreen> {
  /// Channel is null */
  Channel? _channel;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  ///** Create a function to call channel  model data.***/
  _initChannel() async {
    Channel? channel = await APIService.instance
        .fetchChannel(channelId: 'UCo3KvUOtPnsijOhEcEf9nvg');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel!.profilePictureUrl),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel!.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel!.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        height: 140.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video> allVideos = _channel!.videos!..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "YouTube Channel",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos?.length !=
                        int.parse(_channel!.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: 1 + _channel!.videos!.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _buildProfileInfo();
                  }
                  Video video = _channel!.videos![index - 1];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class YoutubeScreen extends StatefulWidget {
//   const YoutubeScreen({super.key});
//
//   @override
//   State<YoutubeScreen> createState() => _YoutubeScreenState();
// }
//
// class _YoutubeScreenState extends State<YoutubeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final w = MediaQuery.of(context).size.width;
//     final h = MediaQuery.of(context).size.height;
//     return LayoutBuilder(
//       builder: ((context, constraints) {
//         return Scaffold(
//             // appBar: AppBar(
//             //     // leading: IconButton(
//             //     //     onPressed: (() => Get.to(
//             //     //           const MyHomePage(
//             //     //             title: '',
//             //     //           ),
//             //     //         )),
//             //     //     icon: const Icon(Icons.arrow_back)),
//             //     // title: Text("Youtube"),
//             //     ),
//             body: InkWell(
//               onTap: (){
//                 _launchUrl("http://youtube.com/user/MrRobertFranz");
//               },
//               child: Container(
//           width: constraints.maxWidth,
//           height: constraints.maxHeight,
//           child:,
//           // const WebView(
//           //   initialUrl: "http://youtube.com/user/MrRobertFranz",
//           //   javascriptMode: JavascriptMode.unrestricted,
//           // ),
//         ),
//             )
//             // _launchUrl("https://www.youtube.com/"),
//             );
//       }),
//     );
//   }
//
//   _launchUrl(url) async {
//     // ignore: deprecated_member_use
//     if (await canLaunch(url)) {
//       // ignore: deprecated_member_use
//       await launch(url,
//           forceSafariVC: true,
//           forceWebView: true,
//           enableJavaScript: true,
//           universalLinksOnly: true);
//     } else {
//       print("Not Supported");
//     }
//   }
// }
