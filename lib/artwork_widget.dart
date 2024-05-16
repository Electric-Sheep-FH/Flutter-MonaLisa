import 'package:flutter/material.dart';

class ArtWorkWidget extends StatefulWidget {
  const ArtWorkWidget({super.key, required this.title});
  final String title;

  @override
  State<ArtWorkWidget> createState() => _ArtWorkWidgetState();
}

class _ArtWorkWidgetState extends State<ArtWorkWidget>{

  bool _isFavorite = false;
  bool _showDescription = false;

  final Icon _falseMainFav = Icon(
    Icons.favorite,
    color: Colors.white.withOpacity(0.75),
    size: 100,
  );
  final Icon _trueMainFav = const Icon(
    Icons.favorite,
    color: Colors.red,
    size: 100,
  );

  final Icon _falseUndertextFavIcon = const Icon(
    Icons.favorite,
    color: Colors.brown);
  final Icon _trueUndertextFavIcon = const Icon(
    Icons.favorite,
    color: Colors.red);

  final snackBar = const SnackBar(
    content: Text('Oeuvre ajoutée à vos favoris'),
    backgroundColor: Colors.red,
    );

  final ConstrainedBox descriptionBox = ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 300.0,
                    maxWidth: 300.0,
                    minHeight: 400.0,
                    maxHeight: 700.0,
                  ),
                  child: const Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage('images/Mona_Lisa.jpg'),
                  ),
                _showDescription ? descriptionBox : Container(),
                _isFavorite ? _trueMainFav : _falseMainFav,
              ],
            ),
            const Text(
              'Mona Lisa',
              style: TextStyle(fontFamily: 'Merriweather', fontSize: 30, color: Colors.brown),
            ),
            const Text(
              'Léonard De Vinci',
              style: TextStyle(fontFamily: 'Merriweather', fontSize: 15, fontWeight: FontWeight.w700, color: Colors.brown),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(onPressed: pressedArticle, icon: const Icon(Icons.article),),
                IconButton(onPressed: pressedFav, icon: _isFavorite ? _trueUndertextFavIcon : _falseUndertextFavIcon),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void pressedFav() {
    setState(() {
      _isFavorite = !_isFavorite;
      if (_isFavorite) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void pressedArticle() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }
}