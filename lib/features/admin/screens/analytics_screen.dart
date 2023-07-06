import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/admin/models/sales.dart';
import 'package:amazon_clone/features/admin/service/admin_service.dart';
import 'package:amazon_clone/features/auth/widgets/category_bar_graph/category_product_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as charts;


class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  double? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
 
    getEarnings();
    super.initState();
  }

  void getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                "\$$totalSales",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 300,
                child: CategoryProductsChart(
                  
                  seriesList: [
                    
                    charts.ColumnSeries(
                      
                      dataSource: earnings!,
                      xValueMapper: (Sales sales, _) => sales.label,
                      yValueMapper: (Sales sales, _) => sales.earnings,
                      color: Colors.blue[500],
                      
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
