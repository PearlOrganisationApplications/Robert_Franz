import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:robert_franz/Screens/Youtube/youtube_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Services/api_services.dart';
import 'Youtube Model/channel_model.dart';
import 'Youtube Model/video_model.dart';

class VideoScreen extends StatefulWidget {
  final String id;

  const VideoScreen({super.key, required this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initChannel();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  /// Channel is null */
  Channel? _channel;
  bool _isLoading = false;
  @override
  // void initState() {
  //   super.initState();
  //   _initChannel();
  // }

  ///** Create a function to call channel  model data.***/
  _initChannel() async {


    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

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
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(25.0),
          right: Radius.circular(25.0),
        ),
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
          )
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


// bool isFullscreen =false;
//   void _enableFullscreen(bool fullscreen) {
//     isFullscreen = fullscreen;
//     if (fullscreen) {
//       // Force landscape orientation for fullscreen
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Force portrait
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ]);
//       // Set preferred orientation to device default
//       // Empty list causes the application to defer to the operating system default.
//       // See: https://api.flutter.dev/flutter/services/SystemChrome/setPreferredOrientations.html
//       SystemChrome.setPreferredOrientations([]);
//     }
//   }



  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: const Text(
        //   "Robert Franz Youtube Kanal",
        //   style: TextStyle(color: Colors.black),
        // ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const YoutubeHomeScreen(),
                ));
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              liveUIColor: Colors.red,
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                print('Player is ready.');
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            _channel != null
                ? _buildProfileInfo()
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
            const Text("Robert Franz Shop Gleisdorf",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            const Text("Schillerstraße 13",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            const Text("8200 Gleisdorf",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20.0),
            const SelectableText("☎️ +43 (0) 664 12 10 084",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
            // SelectableText(child: const Text("☎️ +43 (0) 664 12 10 084",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
            const SizedBox(height: 20.0),
            const Text("Öffnungszeiten",style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10.0),
            const Text("Montag - Freitag",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
            const Text("8:00 bis 18:00Uhr",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.0),
            const Text("Ausgenommen Donnerstag:",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
            const Text("8:00 bis 13:00Uhr",style: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold)),

            const SizedBox(height: 20.0),
            const Text("Samstag",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
            const Text("8:00 bis 13:00Uhr",style: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text("An Sonn-und Feiertagen geschlossen",style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
