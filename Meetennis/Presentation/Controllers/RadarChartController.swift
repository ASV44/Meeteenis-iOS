//
//  ChartController.swift
//  Meetennis
//
//  Created by Hackintosh on 4/9/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import Charts

class RadarChartController: NSObject ,IAxisValueFormatter {
    
    var radarChart: RadarChartView!
    
    init(radarChart: RadarChartView) {
        super.init()
        self.radarChart = radarChart
        
        initChart()
        setAxis()
        updateChart()
    }
    
    func initChart() {
        radarChart.backgroundColor = UIColor.white
        radarChart.legend.enabled = false
        radarChart.chartDescription?.enabled = false
        radarChart.webColor = UIColor.gray
        radarChart.webAlpha = 1
        radarChart.innerWebLineWidth = 1
        radarChart.innerWebColor = UIColor.lightGray
        radarChart.noDataText = ""
        radarChart.animate(xAxisDuration: 1.4,
                           yAxisDuration: 1.4,
                           easingOptionX: .easeInOutQuad,
                           easingOptionY: .easeInOutQuad)

    }
    
    func updateChart() {
        var chartDataSet = [RadarChartDataSet]()
        
        var dataEntries = [RadarChartDataEntry]()
        for _ in 0 ..< 5 {
            dataEntries.append(RadarChartDataEntry(value: Double(arc4random_uniform(100))))
        }
        let set = RadarChartDataSet(values: dataEntries, label: "Skill Rates")
        formatDataSet(set)
        chartDataSet.append(set)
        radarChart.data = RadarChartData(dataSets: chartDataSet)
        radarChart.data?.setDrawValues(false)
    }
    
    func formatDataSet(_ set: RadarChartDataSet) {
        set.fillColor = UIColor(red: 146 / 255, green: 30 / 255, blue: 68 / 255, alpha: 1.0)
        set.setColor(set.fillColor)
        set.drawFilledEnabled = true
        set.fillAlpha = 0.5
        set.lineWidth = 1
        set.drawHighlightCircleEnabled = true
        set.setDrawHighlightIndicators(true)
    }
    
    func setAxis() {
        radarChart.xAxis.valueFormatter = self
        radarChart.xAxis.labelFont = radarChart.xAxis.labelFont.withSize(10)
        radarChart.xAxis.yOffset = 0
        radarChart.xAxis.xOffset = 0
        radarChart.xAxis.labelTextColor = UIColor.black
        radarChart.yAxis.drawLabelsEnabled = false
        radarChart.yAxis.axisMinimum = 0
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return "Skill \(value)"
    }
}
