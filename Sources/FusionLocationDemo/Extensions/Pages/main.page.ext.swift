import ScadeKit

extension MainPageAdapter {
  var mapWidget: SCDWidgetsMapWidget {
    return self.page?.getWidgetByName("mapWidget") as! SCDWidgetsMapWidget
  }

  var rowView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView") as! SCDWidgetsRowView
  }

  var btnAirport: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnAirport") as! SCDWidgetsButton
  }

  var btnSeaport: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnSeaport") as! SCDWidgetsButton
  }

  var btnSatelite: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnSatelite") as! SCDWidgetsButton
  }

  var btnStandard: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnStandard") as! SCDWidgetsButton
  }

  var btnHybrid: SCDWidgetsButton {
    return self.page?.getWidgetByName("btnHybrid") as! SCDWidgetsButton
  }
}