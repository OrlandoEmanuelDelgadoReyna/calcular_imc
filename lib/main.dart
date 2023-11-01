import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: CalcularImc(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CalcularImc extends StatefulWidget {
  const CalcularImc({super.key});

  @override
  State<CalcularImc> createState() => _CalcularImcState();
}

class _CalcularImcState extends State<CalcularImc> {
  double sliderAltura = 0;
  double sliderPeso = 0;
  double imc = 0;
  String estado = '';
  String descripcion = '';
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDA8916),
        title: Text(
          'Calcular IMC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(height: 15),
          Text(
            'Altura:',
            style: TextStyle(fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(sliderAltura.toStringAsFixed(1),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text('cm'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Slider(
                activeColor: Color(0xffDA8916),
                value: sliderAltura,
                min: 0,
                max: 210,
                onChanged: (altura) {
                  sliderAltura = altura;

                  setState(() {});
                }),
          ),
          Text('Peso:', style: TextStyle(fontSize: 14)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(sliderPeso.toStringAsFixed(1),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text('kg'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Slider(
                activeColor: Color(0xffDA8916),
                value: sliderPeso,
                min: 0,
                max: 180,
                onChanged: (peso) {
                  sliderPeso = peso;
                  setState(() {});
                }),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xffDA8916)),
                fixedSize: MaterialStateProperty.all(Size(380, 45))),
            onPressed: () {
              double alturaMetros = sliderAltura / 100;
              imc = sliderPeso / (alturaMetros * alturaMetros);

              if (imc <= 18.5) {
                estado = 'Delgadez';
                descripcion =
                    'Su masa corporal esta muy baja, Realice actividad física al menos 3 veces por día durante 30 minutos. Tome de 6 a 8 vasos de agua al día. Continúe manejando porciones adecuadas incluyendo verduras y frutas diariamente.';
                n = 1;
              }
              if (imc > 18.5 && imc <= 24.9) {
                estado = 'Normal';
                descripcion =
                    'Tienes una masa corporal normal, mantente asi sigue con la alimentacion saludable y con la actividad fisica que sigues';
                n = 2;
              }
              if (imc > 24.9 && imc <= 29.9) {
                estado = 'Sobrepeso';
                descripcion =
                    'Uy!, Tienes Sobrepeso evita el consumo excesivo de frituras. Consume agua (6 u 8 vasos de agua al día). Evita el consumo de alimentos ultra procesados. Realiza actividad física.';
                n = 3;
              }
              if (imc >= 30.0) {
                estado = 'Obesidad';
                descripcion =
                    'Alerta! te recomendamos cambiar tu estilo de vida basado a la alimentacion, actividad fisica y una dieta';
                n = 4;
              }

              setState(() {});
            },
            child: Text(
              'Calcular',
            ),
          ),
          Divider(height: 15),
          Text(imc.toStringAsFixed(1),
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          Divider(height: 2),
          Text(estado,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Text(descripcion,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38)),
          ),
          Image.asset(
            'assets/images/img$n.png',
            width: 380,
            height: 300,
            fit: BoxFit.cover,
          )
        ],
      )),
    );
  }
}
