// Importo il pacchetto Material Design di Flutter che contiene tutti i widget
// Widget sono gli elementi che si vedono a schermo

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// Funzione principale (entry point) - viene eseguita quando l'app si avvia
void main() {
  // Lancia l'app e dice a Flutter di usare MyApp come widget principale
  // const indica che MyApp è costante e non cambierà mai durante l'esecuzione, né durante la scrittura del codice
  runApp(const MyApp());
}

// Classe MyApp - il widget principale dell'applicazione
// StatelessWidget significa che questo widget NON cambia mai (è immutabile)

class MyApp extends StatelessWidget {
  // Costruttore costante con parametro opzionale key (passato al padre) è l'init in swift, (super.init)
  const MyApp({super.key});

  // Sovrascrive il metodo build - dice come deve essere disegnato il widget
  @override
  // build riceve BuildContext (il "path" o posizione del widget nell'albero, ossia dove si trova nella gerarchia dell'app, ad esempio questo widget si trova sopra tutti i widget in primo piano)
  Widget build(BuildContext context) {
    // Ritorna MaterialApp - il widget che fornisce lo stile Material Design (gli elementi del widget)
    return MaterialApp(
      // Titolo dell'app (visibile nel task manager del telefono), quando si tira sù per vedere le app in esecuzione
      title: 'Flutter Demo',

      // Configura il tema dell'app (colori, stili, ecc.)
      theme: ThemeData(
        // Crea una combinazione di colori partendo dal colore viola, poi i colori che vengono prossimamente dipendono da esso
        // .fromSeed genera automaticamente colori complementari
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        /* Dico che il seguente testo avrà come tema il font di google che ho importato all'inizio del codice, 
        andando a sovvrascivere il tema dei testi di default di Flutter */
        textTheme: GoogleFonts.playwriteGbJTextTheme(),
      ),

      // Definisce quale widget mostrare come prima pagina (home)
      // const: anche MyHomePage è costante perché riceve un titolo fisso
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Classe MyHomePage - la schermata principale dell'app
// StatefulWidget significa che PUÒ cambiare nel tempo (ha uno stato interno)
class MyHomePage extends StatefulWidget {
  // Costruttore costante con parametro opzionale key (passato al padre) è l'init in swift, (super.init), con titolo obbligatorio
  const MyHomePage({super.key, required this.title});

  /* Dichiarazione del titolo come final (non può cambiare dopo l'assegnazione), 
  differenza tra final e costant che final può non contenere un valore iniziale ma siamo sicuri che rimarrà fisso, durante l'esecuzione del programma */
  final String title;

  // createState crea uno stato dicendo che come stato deve restituire _MyHomePageState
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Classe privata (_) che gestisce lo stato di MyHomePage
// State<MyHomePage> significa che questo stato appartiene a MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  // Variabile privata (_) che tiene il contatore - parte da 0
  int _counter = 0;

  // Funzione che viene chiamata quando si preme il bottone
  void _incrementCounter() {
    // setState informa Flutter che lo stato è cambiato
    // Flutter ridisegnerà automaticamente l'interfaccia
    setState(() {
      // Aumenta il contatore di 1
      _counter++;
    });
  }

  // Metodo build - costruisce l'interfaccia utente
  // Viene eseguito OGNI VOLTA che setState() viene chiamato
  @override
  Widget build(BuildContext context) {
    // Scaffold è la struttura base di una schermata (barra in alto, corpo, bottone)
    return Scaffold(
      // AppBar è la barra nella parte superiore dello schermo
      appBar: AppBar(
        // Titolo della barra - Text è un widget che mostra testo
        // widget.title accede al titolo definito in MyHomePage
        title: Text(widget.title),
        // Serve per mettere l'icona alla appBar
        leading: Icon(Icons.offline_bolt),
        // Serve per dare la larghezza all'icona non é obbligatori di default è 52
        leadingWidth: 100,
        // qualsiasi cosa arriva dopo l'appBar non viene mostrata a schermo
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.access_time)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.access_time)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.access_time)),
        ],
        // Il colore del testo nella barra lo metto in rosso
        foregroundColor: Colors.red,
        // Colore di sfondo della barra (prende il colore complementare del tema)
        backgroundColor: Colors.orange,
        // Metto le icone del telefono in light mode sennò và in conflitto con l'app
        systemOverlayStyle: SystemUiOverlayStyle.light,
        // Quanto è distante l'ombra dal pannello
        elevation: 50,
        // Colore dell'ombra
        shadowColor: Colors.red,
        // L'altezza della barra
        toolbarHeight: 100,
        // L'opacità della barra
        toolbarOpacity: 0.5,
        // Lo stile del titolo della barra
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      // Serve per creare il menù laterale
      // drawer: Drawer(),

      // body è il contenuto principale della schermata (sotto la barra), lo mettiamo al centro della schermata
      body: Center(
        // Center centra il suo widget figlio nello spazio disponibile
        child: Column(
          // Column dispone i suoi figli in VERTICALE (uno sopra l'altro), come una colonna
          // mainAxisAlignment.center li centra verticalmente, in base allo schermo
          mainAxisAlignment: MainAxisAlignment.center,

          // children è la lista dei widget da disporre in colonna
          children: [
            // Primo testo statico - const perché non cambia mai
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                // Modifica colore testo
                color: Colors.red,
                // Modifica sfondo testo
                backgroundColor: Colors.lightBlueAccent,
                // Mettere in grassetto il testo (chiamata anche peso del font)
                fontWeight: FontWeight.w800,
                // Modifica della grandezza del font
                fontSize: 30,
                // Spazio tra le parole
                letterSpacing: 5,
                // Spazio tra una parola e l'altra
                wordSpacing: 10,
                shadows: [
                  Shadow(
                    // Posizione dell'ombra sull'asse x e sull'asse y
                    offset: Offset(10, 10),
                    // Quanto è sfocato il colore dell'ombra
                    blurRadius: 3.0,
                    /* Colore dell'ombra in ARGB, (alpha "l'opacità dell'ombra", red, green, blue), 
                    sono i colori primari che se vengono mescolate formano un nuovo colore */
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
            // Secondo testo - mostra il valore del contatore
            // $_counter inserisce il valore della variabile nella stringa, con il trattino basso mettiamo la variabile come privata
            Text(
              '$_counter',
              // Stile del testo (preso dal tema, headlineMedium è un formato grande)
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            /* è un tipo di pulsante che non ritorna nessun'azione con il child andiamo a mettere gli elementi all'interno del pulsante 
            Se mettiamo ad onPressed null come valore disabilitiamo il pulsante,
            Dentro child possiamo avere più Widget
            */

            // Testo Pulsante
            TextButton(
              onPressed: () => {},
              child: const Text('Pulsante con testo'),
            ),

            // Pulsante con ripieno
            ElevatedButton(
              onPressed: () => {},
              child: const Text("Pulsante con ripieno blu"),
            ),

            // Pulsante con bordo
            OutlinedButton(
              onPressed: () => {},
              child: const Text("Pulsante con bordo"),
            ),

            // Pulsanti con icone
            TextButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.access_time_filled),
              label: const Text("Pulsante testo con icona"),
            ),

            ElevatedButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.access_time_filled),
              label: const Text("Pulsante con ripieno e icona"),
              /* Lo stile del pulsante per modificare il colore del testo all'interno del pulsante si deve,
               andare ad alle proprietà del colore con l'attributo all<Color> andiamo a dire di andare ad accedere a tutta la lista di colori che sarà di tipo Color
               Infine andiamo a dire che tra la lista di colori vogliamo usare il colore rosso (Colors è un'array di colori) 
              */

              // Ci sono due modi per modficare lo stile di un pulsante:
              // 1:
              // style: ButtonStyle(
              //   foregroundColor: WidgetStateProperty.all<Color>(Colors.red),

              //   // è la proprietà di flutter che controlla i colori quando l'utente interagisce con un widget cliccabile, come ad esempio un pulsante
              //   overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              //    quà li stiamo dicendo che se lo stato del pulsante è pressed, quindi il pulsante è stato premuto allora cambia il colore del pulsante in amber
              //     if (states.contains(WidgetState.pressed)) {
              //       return Colors.amber;
              //     }
              /*    infine gli diciamo che la funzione overlay non deve ritornare nulla di default 
                  se non c'è nessun azione all'interno di quest'ultimo */
              //     return null;
              //   }),
              // ),

              /* il secondo modo andiamo ad accedere alla proprietà style dello specifico pulsante (Elevated Button),
              mentre prima accedevamo allo stile dei pulsanti in maniera generale, quì andiamo ad accedere ai attributi dello specifico pulsante
              permettendoci così di stilizzare il pulsante in maniera più semplice */
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 60),
              ),
            ),

            OutlinedButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.abc_outlined),
              label: const Text("Pulsante con bordo e icona"),
            ),
          ],
        ),
      ),

      // floatingActionButton è il bottone circolare in basso a destra
      floatingActionButton: FloatingActionButton(
        // onPressed definisce cosa succede quando premi il bottone, và ad eseguire la funzione incrementcounter
        onPressed: _incrementCounter,
        // tooltip è il messaggio che appare tenendo premuto il bottone
        tooltip: 'Increment',
        // child è ciò che viene mostrato dentro il bottone
        child: const Icon(Icons.add), // Icona "+" (const perché non cambia)
      ),
    );
  }
}
