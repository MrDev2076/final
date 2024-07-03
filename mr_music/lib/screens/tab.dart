import 'package:flutter/material.dart';

class MyTabbedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          title: Text('make yourMood with Music...🎶🎧'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Artists'),
              Tab(text: 'Languages'),
              Tab(text: 'Regions'),
            ],
            labelColor: Colors.green,
            unselectedLabelColor: Colors.white,
          ),

        ),
        body: Container(
          color: Colors.black,
          child: TabBarView(
            children: [
              ArtistsTab(),
              LanguagesTab(),
              RegionsTab(),
            ],

          ),
        ),
      ),
    );
  }
}

class ArtistsTab extends StatelessWidget {
  final List<CardData> artists = [
    CardData('SidSreeRam', 'https://qph.cf2.quoracdn.net/main-qimg-1bf3145ee037e973f5bf204afea65fcc-lq', 'View PlayList'),
    CardData('AnuragKulaKarni', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtb74t91T_K5_WLXEJzytYUAmqqdXy52TgwG_1FDpfxNghpjcUAyd8uJMTjU89dnQiux0&usqp=CAU', 'View PlayList'),
    CardData('Ram Miryala','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl82wPuepGTeVRoQkC5VaE6HB6B7SjtMhBbQ&s','View PlayList'),
    CardData('SPB','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa4y6Sx7R1TS6AW5W-112iEpWVDHHp2BMckA&s','View PlayList'),
    CardData('Chitra','https://upload.wikimedia.org/wikipedia/commons/4/40/K.S.Chithra_Jan_2015_05.jpg','View PlayList'),
    CardData('Sunitha','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPZqFJ5KjKqElydeqp47B0E7A6st5CsCMDPw&s','View PlayList'),
    CardData('Anirudh','https://qph.cf2.quoracdn.net/main-qimg-a5ab51684848b2aa2b7ae6c6ae635d17-lq','View PlayList'),
    CardData('Keeravani','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ej8hzBkriFpduxqt0lKIp-rW8PwFmACOTg&s','View PlayList'),
    // Add more artist data here
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.75, // Adjust as needed
      ),
      itemCount: artists.length,
      itemBuilder: (context, index) {
        return CardWithBackgroundImage(
          title: artists[index].title,
          description: artists[index].description,
          imageUrl: artists[index].imageUrl,
        );
      },
    );
  }
}

class LanguagesTab extends StatelessWidget {
  final List<CardData> languages = [
    CardData('Telugu', 'https://c.saavncdn.com/editorial/logo/AntakshariAaKannada_20180928132919_500x500.jpg', 'Switch to Telugu'),
    CardData('Hindi', 'https://thumbs.dreamstime.com/b/aprenda-hindi-handwritten-letter-no-quadro-negro-108842533.jpg', 'Switch to Hindi'),
    CardData('Punjabi','https://media.istockphoto.com/id/1279820119/vector/punjabi-alphabet-letter-in-3d-shape-bh-vector-illustration-flash-card-letter-recognizing.jpg?s=612x612&w=0&k=20&c=_8Uck_n4XVPq8CgqhevZQmT0lAOkBKmpTM9EsYZtBkc=','Switch to Punjabi'),
    CardData('Tamil','https://www.shutterstock.com/image-illustration/translationtamil-letter-illustrationuyir-ezhuthukaluyir-mey-260nw-2354001709.jpg','Switch to Tamil'),
    CardData('Kannada','https://play-lh.googleusercontent.com/LXcjdcHiQne-fY4GEA8ELRVb9xevZR0gT-KdlFN3p9s8WaAtkDXt0VcMo1tOiFIeo24','Switch to Kannada'),


    // Add more language data here
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.75, // Adjust as needed
      ),
      itemCount: languages.length,
      itemBuilder: (context, index) {
        return CardWithBackgroundImage(
          title: languages[index].title,
          description: languages[index].description,
          imageUrl: languages[index].imageUrl,
        );
      },
    );
  }
}

class RegionsTab extends StatelessWidget {
  final List<CardData> regions = [
    CardData('Andhra', 'https://i.redd.it/snwy7h9saf681.png', 'Select'),
    CardData('Karnataka', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY_LEHYmwIhRsNshyucqOUnM9F6jVCFs8GuPEcERezqdHN7schjoN87duFbNsWCYI5lnM&usqp=CAU', 'Select'),
    CardData('Punjab','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyPsvw1m424BXxH68O6lWtrAiM4pyOPUiTwdvc_ghdcT4rSBa_OBQFiCNhB21QEDjRDeU&usqp=CAU','Select'),
    CardData('TamilNadu','https://thumbs.dreamstime.com/z/tamil-nadu-india-stamp-postal-map-silhouette-seal-passport-round-design-vector-icon-design-retro-travel-tamil-nadu-india-stamp-206803762.jpg ','Select'),
    // Add more region data here
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.75, // Adjust as needed
      ),
      itemCount: regions.length,
      itemBuilder: (context, index) {
        return CardWithBackgroundImage(
          title: regions[index].title,
          description: regions[index].description,
          imageUrl: regions[index].imageUrl,
        );
      },
    );
  }
}

class CardData {
  final String title;
  final String imageUrl;
  final String description;

  CardData(this.title, this.imageUrl, this.description);
}

class CardWithBackgroundImage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const CardWithBackgroundImage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ImageUrl: $imageUrl'); // Debug print

    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image: $error');
              return Center(child: Text('Error loading image'));
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
