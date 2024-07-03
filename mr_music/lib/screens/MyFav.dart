import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyFav extends StatefulWidget {
  const MyFav({Key? key}) : super(key: key);

  @override
  State<MyFav> createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
  late AudioPlayer audioPlayer; // Declare AudioPlayer instance
  bool isPlaying = false; // Track playing state
  int? selectedSongIndex; // Track currently selected song index

  static const List<String> listItems = [
    'Anirudh',
    'Anurag Kulakarni',
    'Balu',
    'Chakri',
    'Chitra',
    'Dsp',
    'Sunitha',
    'Ram Miryala',
    'Sid SriRam',
  ];

  static const List<String> songs = [
    'assets/takkara.mp3',
    'assets/theam.mp3',
    'assets/bhairava_anthem.mp3',
    // Add more songs as needed
  ];

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer(); // Initialize AudioPlayer instance
    // Listen for changes in audio player state
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.PLAYING) {
        setState(() {
          isPlaying = true;
        });
      } else if (state == PlayerState.PAUSED || state == PlayerState.STOPPED) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  void play(int index) async {
    // Check if the same song is playing
    if (selectedSongIndex != index) {
      await audioPlayer.stop(); // Stop any currently playing song
      selectedSongIndex = index;
      await audioPlayer.play(songs[index]); // Play the selected song
    } else {
      // Toggle play/pause if the same song is already playing
      if (isPlaying) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.resume();
      }
    }
  }

  void pause() async {
    await audioPlayer.pause();
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Release resources when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('MyFaV pLaYs'),
        titleTextStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 20,
        ),

      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return listItems.where((String item) =>
                    item.toLowerCase().contains(textEditingValue.text.toLowerCase()));
              },
              onSelected: (String item) {
                print('The $item was selected');
              },
              fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
                  FocusNode focusNode, VoidCallback onFieldSubmitted) {
                return TextFormField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  cursorColor: Colors.white,
                  onChanged: (String value) {
                    // Optionally handle value change
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                  ),
                );
              },
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(option),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.0),
            // Create ListTile for each song
            for (int i = 0; i < songs.length; i++)
              ListTile(
                contentPadding: EdgeInsets.all(20),

                title: Text('Song ${i + 1}',
                    style: TextStyle(color: Colors.white),
                ),
                // Replace with your song name
                leading: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.green;
                        }
                        return Colors.yellow; // Default button color
                      },
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () => isPlaying ? pause() : play(i),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            'https://storage.googleapis.com/pr-newsroom-wp/1/2023/12/Generic-FTR-headers_V10-1920x733.jpg'), // Replace with your button background image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(isPlaying && selectedSongIndex == i ? 'Pause' : 'Play'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


