import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RealTimeGraphPage extends StatefulWidget {
  final List<double> intensidades;

  const RealTimeGraphPage({Key? key, required this.intensidades}) : super(key: key);

  @override
  _RealTimeGraphPageState createState() => _RealTimeGraphPageState();
}

class _RealTimeGraphPageState extends State<RealTimeGraphPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gráfico en Tiempo Real'),
        backgroundColor: Colors.teal.shade300,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                // Aquí puedes actualizar los datos desde tu base de datos u otra fuente de datos
                // Por ejemplo, podrías cargar los nuevos datos desde tu base de datos
                // final List<double> nuevosDatos = await obtenerDatosDesdeLaBaseDeDatos();
                // widget.intensidades = nuevosDatos;
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.teal.shade300, // Color más claro
              Colors.green.shade700, // Color más oscuro
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500), // Ajusta la duración según sea necesario
            opacity: 1.0,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: true),
                  bottomTitles: SideTitles(showTitles: true),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.black87, width: 1), // Líneas más oscuras
                ),
                minX: 0,
                maxX: (widget.intensidades.length - 1).toDouble(),
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      widget.intensidades.length,
                          (index) => FlSpot(index.toDouble(), widget.intensidades[index]),
                    ),
                    isCurved: true,
                    colors: [Colors.amberAccent], // Líneas más oscuras
                    barWidth: 4,
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
                gridData: FlGridData(
                  show: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.black87, // Líneas más oscuras
                      strokeWidth: 1,
                    );
                  },
                  drawVerticalLine: true,
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.black87, // Líneas más oscuras
                      strokeWidth: 1,
                    );
                  },
                ),
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Colors.blue.withOpacity(0.8),
                  ),
                  touchCallback: (LineTouchResponse touchResponse) {},
                  handleBuiltInTouches: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
