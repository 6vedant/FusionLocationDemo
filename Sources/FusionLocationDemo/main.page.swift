import FusionLocation
import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {


let airport_coordinate = SCDPlatformLocationCoordinate(latitude: 28.556160, longitude: 77.100281)

let seaport_coordinate = SCDPlatformLocationCoordinate(latitude: 13.08441, longitude: 80.2899)

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    // initialize the LocationManager
    let locationManager = LocationManager(usage: .always)

    // request authorization
    locationManager.requestAuthorization()

    // start location tracking
    locationManager.startUpdatingLocation { location in
      print("Location Updated.")
      print(location?.coordinate)

      let mallLocation = Location(latitude: 12.9574292, longitude: 77.6383552)
      let parkLocation = Location(latitude: 12.973826, longitude: 77.590591)

      let dist = locationManager.distanceBetween(
        from: mallLocation, to: parkLocation)

      print("Distance between Mall and the Park:")
      print(String(dist))

      // get bearing between from and to
      locationManager.bearingBetween(from: parkLocation, to: mallLocation)
      
      
      

    }
    
    // Goto Airport location
self.btnAirport.onClick.append(
  SCDWidgetsEventHandler { _ in
    self.goto(coordinates: self.airport_coordinate)

})
// goto Seaport location
self.btnSeaport.onClick.append(
    SCDWidgetsEventHandler { _ in
        self.goto(coordinates: self.seaport_coordinate)

})

// satellite mode
self.btnSatelite.onClick.append(
   SCDWidgetsEventHandler { _ in
      self.setMapType("btnSatelite")
})
// Standard mode
self.btnStandard.onClick.append(
   SCDWidgetsEventHandler { _ in
      self.setMapType("btnStandard")
})

// Hybrid mode
self.btnHybrid.onClick.append(
   SCDWidgetsEventHandler { _ in
       self.setMapType("btnHybrid")
})

  }
  
  func setPinAsAnnotaton(coordinate:   SCDPlatformLocationCoordinate, imagePath: String) {

    let svgImage = SCDSvgImage(width: SCDSvgUnit(value: 55),  height: SCDSvgUnit(value: 55))
    svgImage.xhref = imagePath

    let ann = SCDWidgetsMapAnnotation(location: coordinate)
    ann.drawing = svgImage

    self.mapWidget.annotations.append(ann)
}
func goto(coordinates: SCDPlatformLocationCoordinate) {
        self.mapWidget.setRegion(coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
}

func setMapType(_ name: String) {
    switch name {
    case "btnHybrid":
      self.mapWidget.mapType = SCDWidgetsMapType.hybrid
    case "btnSatelite":
      self.mapWidget.mapType = SCDWidgetsMapType.satellite
    case "btnStandard":
      self.mapWidget.mapType = SCDWidgetsMapType.standard
    default:
      print("not covered")
    }
}




}
