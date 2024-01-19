import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart'; // Este archivo es generado por Amplify CLI
import 'models/ModelProvider.dart';
import 'models/Iluminacion.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();

  runApp(MyApp());
   // Reemplaza "amplifyconfig" con tu configuración de Amplify

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Datos Históricos'),
        ),
        body: FutureBuilder(
          future: getIluminacion(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
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
                  return ListTile(
                    title: Text(datosIluminacion[index]?.Intensidad?.toString() ?? 'Valor predeterminado'),
                    // Use ?. for null-aware access
                    subtitle: Text(datosIluminacion[index]?.Fecha?.format() ?? 'Fecha no disponible'),

                  );
                },
              );
            }
          },
        ),
      ),
    );
  }


  //npm install -g @aws-amplify/cli
  // flutter pub run amplify:codegen
  // flutter pub run amplify:configure
  Future<List<Iluminacion?>> getIluminacion() async {
    try {
      final request = ModelQueries.list(Iluminacion.classType);
      final response = await Amplify.API.query(request: request).response;

      final items = response.data?.items;

      //final iluminacion = await Amplify.DataStore.query(Iluminacion.classType);
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



  Future<List<Iluminacion?>> queryListItems() async {
    try {

      final request = ModelQueries.list(Iluminacion.classType);
      final response = await Amplify.API.query(request: request).response;

      final items = response.data?.items;
      if (items == null) {
        print('errors: ${response.errors}');
        return <Iluminacion?>[];
      }
      return items;
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
    return <Iluminacion?>[];
  }

}




