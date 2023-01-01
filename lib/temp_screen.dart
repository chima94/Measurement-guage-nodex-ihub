import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:temp_guage/controller.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({super.key});

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  final _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const Text(
                          'Exhaust Gas Temperature',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        _buildTemperatureMonitor(
                            _controller.temp.value.toDouble()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Diesel Line Pressure',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        _pressure(_controller.psi.value.toDouble()),
                      ],
                    ),
                  )
                ],
              ),
              const Text(
                'Crankshaft RPM',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              _rpm(_controller.rpm.toDouble())
            ],
          ),
        ),
      );
    }));
  }

  SizedBox _buildTemperatureMonitor(double temp) {
    return SizedBox(
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 1000,
            interval: 100,
            minorTicksPerInterval: 9,
            showAxisLine: false,
            labelOffset: 8,
            radiusFactor: 0.9,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 100,
                startWidth: 0.265,
                sizeUnit: GaugeSizeUnit.factor,
                endWidth: 0.265,
                color: const Color.fromRGBO(
                  34,
                  195,
                  199,
                  0.75,
                ),
              ),
              GaugeRange(
                startValue: 100,
                endValue: 200,
                startWidth: 0.265,
                sizeUnit: GaugeSizeUnit.factor,
                endWidth: 0.265,
                color: const Color.fromRGBO(
                  123,
                  199,
                  34,
                  0.75,
                ),
              ),
              GaugeRange(
                startValue: 200,
                endValue: 300,
                startWidth: 0.265,
                sizeUnit: GaugeSizeUnit.factor,
                endWidth: 0.265,
                color: const Color.fromRGBO(238, 193, 34, 0.75),
              ),
              GaugeRange(
                startValue: 300,
                endValue: 400,
                startWidth: 0.265,
                sizeUnit: GaugeSizeUnit.factor,
                endWidth: 0.265,
                color: const Color.fromRGBO(238, 79, 34, 0.65),
              ),
              GaugeRange(
                startValue: 400,
                endValue: 500,
                startWidth: 0.265,
                sizeUnit: GaugeSizeUnit.factor,
                endWidth: 0.265,
                color: const Color.fromRGBO(238, 193, 34, 0.75),
              ),
              GaugeRange(
                  startValue: 500,
                  endValue: 600,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 79, 34, 0.65)),
              GaugeRange(
                startValue: 600,
                endValue: 700,
                startWidth: 0.265,
                sizeUnit: GaugeSizeUnit.factor,
                endWidth: 0.265,
                color: const Color.fromRGBO(
                  34,
                  195,
                  199,
                  0.75,
                ),
              ),
              GaugeRange(
                  startValue: 700,
                  endValue: 800,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 193, 34, 0.75)),
              GaugeRange(
                startValue: 800,
                endValue: 900,
                startWidth: 0.265,
                sizeUnit: GaugeSizeUnit.factor,
                endWidth: 0.265,
                color: const Color.fromRGBO(
                  34,
                  195,
                  199,
                  0.75,
                ),
              ),
              GaugeRange(
                  startValue: 900,
                  endValue: 1000,
                  startWidth: 0.265,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.265,
                  color: const Color.fromRGBO(238, 79, 34, 0.65)),
            ],
            annotations: <GaugeAnnotation>[
              const GaugeAnnotation(
                angle: 90,
                positionFactor: 0.35,
                widget: Text(
                  'Temp.°C',
                  style: TextStyle(color: Color(0xFFF8B195), fontSize: 16),
                ),
              ),
              GaugeAnnotation(
                angle: 90,
                positionFactor: 0.8,
                widget: Text(
                  temp.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: temp,
                needleStartWidth: 1,
                needleEndWidth: 8,
                animationType: AnimationType.easeOutBack,
                enableAnimation: true,
                animationDuration: 1200,
                knobStyle: const KnobStyle(
                    knobRadius: 0.09,
                    borderColor: const Color(0xFFF8B195),
                    color: Colors.white,
                    borderWidth: 0.05),
                tailStyle: const TailStyle(
                    color: const Color(0xFFF8B195), width: 8, length: 0.2),
                needleColor: const Color(0xFFF8B195),
              )
            ],
            axisLabelStyle: const GaugeTextStyle(fontSize: 12),
            majorTickStyle: const MajorTickStyle(
              length: 0.25,
              lengthUnit: GaugeSizeUnit.factor,
            ),
            minorTickStyle: const MinorTickStyle(
              length: 0.13,
              lengthUnit: GaugeSizeUnit.factor,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }

  SizedBox _pressure(double psi) {
    return SizedBox(
      child: SfLinearGauge(
        minimum: 0,
        maximum: 500,
        orientation: LinearGaugeOrientation.vertical,
        ranges: const [
          LinearGaugeRange(
            startValue: 0,
            endValue: 100,
            color: Colors.green,
          ),
          LinearGaugeRange(
            startValue: 100,
            endValue: 200,
            color: Colors.green,
          ),
          LinearGaugeRange(
            startValue: 200,
            endValue: 300,
            color: Colors.green,
          ),
          LinearGaugeRange(
            startValue: 300,
            endValue: 400,
            color: Colors.red,
          ),
          LinearGaugeRange(
            startValue: 400,
            endValue: 500,
            color: Colors.red,
          )
        ],
        markerPointers: const [
          LinearShapePointer(
            value: 300,
          ),
        ],
        barPointers: [
          LinearBarPointer(value: psi),
        ],
      ),
    );
  }

  SizedBox _rpm(double rmp) {
    return SizedBox(
      height: 350,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            maximum: 2500,
            minimum: 0,
            axisLineStyle: AxisLineStyle(thickness: 30),
            showTicks: false,
            pointers: <GaugePointer>[
              NeedlePointer(
                value: rmp,
                enableAnimation: true,
                needleStartWidth: 0,
                needleEndWidth: 5,
                needleColor: Color(0xFFDADADA),
                knobStyle: const KnobStyle(
                    color: Colors.white,
                    borderColor: Color(0xFFDADADA),
                    knobRadius: 0.06,
                    borderWidth: 0.04),
                tailStyle: const TailStyle(
                  color: Color(0xFFDADADA),
                  width: 5,
                  length: 0.15,
                ),
              ),
              RangePointer(
                value: rmp,
                width: 30,
                enableAnimation: true,
                color: Colors.orange,
              )
            ],
            annotations: [
              GaugeAnnotation(
                angle: 90,
                positionFactor: 0.8,
                widget: Text(
                  rmp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
