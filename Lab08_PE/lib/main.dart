import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:lab08_pe/splash_screen.dart';
import 'RealTimeGraphPage.dart'; // Importa RealTimeGraphPage.dart
import 'amplifyconfiguration.dart'; // Este archivo es generado por Amplify CLI
import 'models/ModelProvider.dart';
import 'models/Iluminacion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();

  runApp(MyApp());
}

Future<void> configureAmplify() async {
  try {
    await Amplify.addPlugins([AmplifyDataStore(modelProvider: ModelProvider.instance)]);
    await Amplify.addPlugins([AmplifyAPI(modelProvider: ModelProvider.instance)]);
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    print('Error configuring Amplify: $e');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => _AnimatedListScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

class _AnimatedListScreen extends StatefulWidget {
  @override
  _AnimatedListScreenState createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<_AnimatedListScreen> {
  bool _shouldAnimate = true;

  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Históricos'),
        backgroundColor: Colors.teal.shade300,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.show_chart),
            onPressed: () async {
              print('Botón presionado');
              List<Iluminacion?> datosIluminacion = await getIluminacion();
              List<double> intensidades = datosIluminacion.map((iluminacion) => iluminacion?.Intensidad?.toDouble() ?? 0.0).toList();
              print('Intensidades: $intensidades');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RealTimeGraphPage(intensidades: intensidades)),
              );
            },
          ),

        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal.shade300, Colors.green.shade700],
          ),
        ),
        child: FutureBuilder(
          future: getIluminacion(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<Iluminacion?> datosIluminacion = snapshot.data as List<Iluminacion?>;
              List<Iluminacion> noNullableIluminacion = [];
              for (Iluminacion? item in datosIluminacion) {
                if (item != null) {
                  noNullableIluminacion.add(item);
                }
              }
              return ListView.builder(
                itemCount: datosIluminacion.length,
                itemBuilder: (context, index) {
                  Color cardColor = Colors.transparent;
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    color: cardColor,
                    child: ListTile(
                      title: Text(
                        'Intensidad: ${datosIluminacion[index]?.Intensidad?.toString() ?? 'Valor predeterminado'}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Fecha: ${datosIluminacion[index]?.Fecha?.format() ?? 'Fecha no disponible'}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Iluminacion?>> getIluminacion() async {
    try {
      final request = ModelQueries.list(Iluminacion.classType);
      final response = await Amplify.API.query(request: request).response;

      final items = response.data?.items;

      if (items == null) {
        print('errors: ${response.errors}');
        return <Iluminacion?>[];
      }
      return items;
    } catch (e) {
      print('Error getting iluminacion: $e');
      return <Iluminacion>[];
    }
  }
}
