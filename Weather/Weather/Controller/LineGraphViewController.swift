//
//  LineGraphViewController.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/7/21.
//

import Foundation

import Highcharts
import UIKit

class LineGraphViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let chartView = HIChartView(frame: view.bounds)
        
        let options = HIOptions()

        let chart = HIChart()
        chart.width = 450
        chart.height = 300
        chart.type = "arearange"
        chart.zoomType = "x"
        chart.scrollablePlotArea = HIScrollablePlotArea()
        chart.scrollablePlotArea.minWidth = 600
        chart.scrollablePlotArea.scrollPositionX = 1
        options.chart = chart

        let title = HITitle()
        title.text = "Temperature variation by day"
        options.title = title

        let xAxis = HIXAxis()
        xAxis.type = "datetime"
        xAxis.accessibility = HIAccessibility()
        xAxis.accessibility.rangeDescription = "Range: Dec 9 2017 to Dec 24 2017."
        options.xAxis = [xAxis]

        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        options.yAxis = [yAxis]

        let tooltip = HITooltip()
        // tooltip.crosshairs = true
        tooltip.shared = true
        tooltip.valueSuffix = "°C"
        tooltip.xDateFormat = "%A, %b %e"
        options.tooltip = tooltip

        let legend = HILegend()
        legend.enabled = false
        options.legend = legend

        let temperatures = HIArearange()
        temperatures.name = "Temperatures"
        temperatures.data = getData()
        temperatures.fillColor = HIColor(linearGradient: ["x1": 0, "x2": 0, "y1": 0, "color": "#97C4F8", "y2": 1], stops: [[0, "#f4b74d"],[1, "#97C4F8"]])

        options.series = [temperatures]

        chartView.options = options

        self.view.addSubview(chartView)
      }

      private func getData() -> [Any] {
        return [
            [
                1638972000000,
                52.93,
                67.1
            ],
            [
                1639058400000,
                40.8,
                57.63
            ],
            [
                1639144800000,
                41.45,
                59.76
            ],
            [
                1639231200000,
                46.58,
                64.81
            ],
            [
                1639317600000,
                50.61,
                61.5
            ],
            [
                1639404000000,
                52.25,
                56.71
            ],
            [
                1639490400000,
                47.35,
                55.89
            ],
            [
                1639576800000,
                46.72,
                55.96
            ],
            [
                1639663200000,
                49.71,
                57.72
            ],
            [
                1639749600000,
                52.79,
                61.16
            ],
            [
                1639836000000,
                52.34,
                55.31
            ],
            [
                1639922400000,
                50.34,
                55.76
            ],
            [
                1640008800000,
                50.27,
                62.19
            ],
            [
                1640095200000,
                54.93,
                61.02
            ],
            [
                1640181600000,
                53.62,
                55.9
            ],
            [
                1640268000000,
                53.04,
                57.79
            ]
        ]
      }

}
class LineGraphViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let chartView = HIChartView(frame: view.bounds)
        
        let options = HIOptions()

        let chart = HIChart()
        chart.width = 450
        chart.height = 300
        chart.type = "arearange"
        chart.zoomType = "x"
        chart.scrollablePlotArea = HIScrollablePlotArea()
        chart.scrollablePlotArea.minWidth = 600
        chart.scrollablePlotArea.scrollPositionX = 1
        options.chart = chart

        let title = HITitle()
        title.text = "Temperature variation by day"
        options.title = title

        let xAxis = HIXAxis()
        xAxis.type = "datetime"
        xAxis.accessibility = HIAccessibility()
        xAxis.accessibility.rangeDescription = "Range: Dec 9 2017 to Dec 24 2017."
        options.xAxis = [xAxis]

        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        options.yAxis = [yAxis]

        let tooltip = HITooltip()
        // tooltip.crosshairs = true
        tooltip.shared = true
        tooltip.valueSuffix = "°C"
        tooltip.xDateFormat = "%A, %b %e"
        options.tooltip = tooltip

        let legend = HILegend()
        legend.enabled = false
        options.legend = legend

        let temperatures = HIArearange()
        temperatures.name = "Temperatures"
        temperatures.data = getData()
        temperatures.fillColor = HIColor(linearGradient: ["x1": 0, "x2": 0, "y1": 0, "color": "#97C4F8", "y2": 1], stops: [[0, "#f4b74d"],[1, "#97C4F8"]])

        options.series = [temperatures]

        chartView.options = options

        self.view.addSubview(chartView)
      }

      private func getData() -> [Any] {
        return [
            [
                1638972000000,
                49.33,
                64.74
            ],
            [
                1639058400000,
                40.26,
                55.47
            ],
            [
                1639144800000,
                34.54,
                48.67
            ],
            [
                1639231200000,
                33.46,
                46.36
            ],
            [
                1639317600000,
                37.45,
                53.46
            ],
            [
                1639404000000,
                41.29,
                62.37
            ],
            [
                1639490400000,
                43.66,
                60.17
            ],
            [
                1639576800000,
                41.22,
                51.22
            ],
            [
                1639663200000,
                42.12,
                53.56
            ],
            [
                1639749600000,
                44.2,
                56.55
            ],
            [
                1639836000000,
                45.19,
                58.84
            ],
            [
                1639922400000,
                43.07,
                53.24
            ],
            [
                1640008800000,
                41.22,
                53.11
            ],
            [
                1640095200000,
                44.49,
                52.66
            ],
            [
                1640181600000,
                43.25,
                48.07
            ],
            [
                1640268000000,
                45.91,
                56.19
            ]
        ]
      }

}
class LineGraphViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let chartView = HIChartView(frame: view.bounds)
        
        let options = HIOptions()

        let chart = HIChart()
        chart.width = 450
        chart.height = 300
        chart.type = "arearange"
        chart.zoomType = "x"
        chart.scrollablePlotArea = HIScrollablePlotArea()
        chart.scrollablePlotArea.minWidth = 600
        chart.scrollablePlotArea.scrollPositionX = 1
        options.chart = chart

        let title = HITitle()
        title.text = "Temperature variation by day"
        options.title = title

        let xAxis = HIXAxis()
        xAxis.type = "datetime"
        xAxis.accessibility = HIAccessibility()
        xAxis.accessibility.rangeDescription = "Range: Dec 9 2017 to Dec 24 2017."
        options.xAxis = [xAxis]

        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        options.yAxis = [yAxis]

        let tooltip = HITooltip()
        // tooltip.crosshairs = true
        tooltip.shared = true
        tooltip.valueSuffix = "°C"
        tooltip.xDateFormat = "%A, %b %e"
        options.tooltip = tooltip

        let legend = HILegend()
        legend.enabled = false
        options.legend = legend

        let temperatures = HIArearange()
        temperatures.name = "Temperatures"
        temperatures.data = getData()
        temperatures.fillColor = HIColor(linearGradient: ["x1": 0, "x2": 0, "y1": 0, "color": "#97C4F8", "y2": 1], stops: [[0, "#f4b74d"],[1, "#97C4F8"]])

        options.series = [temperatures]

        chartView.options = options

        self.view.addSubview(chartView)
      }

      private func getData() -> [Any] {
        return [
            [
                1638964800000,
                30.76,
                51.46
            ],
            [
                1639051200000,
                38.28,
                60.39
            ],
            [
                1639137600000,
                33.48,
                64.56
            ],
            [
                1639224000000,
                32.83,
                44.38
            ],
            [
                1639310400000,
                36.36,
                54.52
            ],
            [
                1639396800000,
                38.77,
                62.22
            ],
            [
                1639483200000,
                54.54,
                69.44
            ],
            [
                1639569600000,
                59.07,
                73.67
            ],
            [
                1639656000000,
                38.95,
                59.07
            ],
            [
                1639742400000,
                33.51,
                51.62
            ],
            [
                1639828800000,
                31.39,
                41.54
            ],
            [
                1639915200000,
                31.82,
                41.61
            ],
            [
                1640001600000,
                16.66,
                44.35
            ],
            [
                1640088000000,
                13.95,
                23.49
            ],
            [
                1640174400000,
                22.41,
                30.69
            ],
            [
                1640260800000,
                20.66,
                24.69
            ]
        ]
      }

}
