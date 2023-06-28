import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  String name;

  AudioPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final audioPlayer = AudioPlayer();
  String code = '';
  String url = '';
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }
  Future setAudio() async{
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    setSrc();
    audioPlayer.setUrl(url);
  }
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  String setSrc() {
    String src;
    if (widget.name.contains('1')) {
      src =
          'https://m.media-amazon.com/images/I/81tNnqcHxlL._AC_UF1000,1000_QL80_.jpg';
      code = 'Adventure Sherlock Holmes';
      url =
          'https://download.taaghche.com/download/yfc7mFvqKTqC7b61oY88YgALWOpDLHmC';
    } else if (widget.name.contains('2')) {
      src =
          'https://m.media-amazon.com/images/I/A1O4njXBebS._AC_UF1000,1000_QL80_.jpg';
      code = 'Peter Pan';
      url =
          'https://download.taaghche.com/download/NZBYwHXsn2EtdRAGmFB4iEkZvsmFkaHO';
    } else {
      src =
          'https://m.media-amazon.com/images/I/71Q1tPupKjL._AC_UF1000,1000_QL80_.jpg';
      code = 'Pride And Prejudice';
      url =
          'https://download.taaghche.com/download/faF1opm4O1rLO1pgxhIbRSvAMS5bdbg1';
    }
    return src;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                setSrc(),
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 32),
            Text(
              code,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);

                await audioPlayer.resume();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration - position))
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                iconSize: 50,
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    setSrc();
                    await audioPlayer.resume();
                  }
                },
              ),
            )
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text(widget.name),
      // ),
      // body: SafeArea(
      //     child: Center(
      //   child: ElevatedButton(
      //       onPressed: () async {
      //         String url = '';
      //         if (widget.name.contains('1'))
      //           url =
      //               'https://download.taaghche.com/download/yfc7mFvqKTqC7b61oY88YgALWOpDLHmC';
      //         else if (widget.name.contains('2'))
      //           url =
      //               'https://download.taaghche.com/download/NZBYwHXsn2EtdRAGmFB4iEkZvsmFkaHO';
      //         else
      //           url =
      //               'https://download.taaghche.com/download/faF1opm4O1rLO1pgxhIbRSvAMS5bdbg1';
      //         await audioPlayer.play(url);
      //       },
      //       child: Text('Click on me')),
      // )),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }
}
