import 'package:amazon_clone/features/admin/models/sales.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as charts;

class CategoryProductsChart extends StatelessWidget {
  final List<charts.ColumnSeries<Sales, String>> seriesList; 
  const CategoryProductsChart({
    super.key, required this.seriesList,
  });

  @override
  Widget build(BuildContext context) {
    return charts.SfCartesianChart(
      tooltipBehavior: charts.TooltipBehavior(
    enable: true,
  ),
      primaryXAxis: charts.CategoryAxis(
        
      ),
      title: charts.ChartTitle(text: "Category Earnings"),
      series: seriesList,
      enableAxisAnimation: true,
      
    );
  }
}
