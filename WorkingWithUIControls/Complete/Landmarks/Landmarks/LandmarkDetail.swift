/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: landmark.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                HStack(alignment: .top) {
                    Text(verbatim: landmark.park)
                        .font(.title)
                        .foregroundColor(Color.green)
                        .lineLimit(9)
                        .padding(.bottom)
                        .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text(verbatim: landmark.state)
                        .font(.subheadline)
                }
                HStack(alignment: .top) {
                    Text("5 persons in line")
                        .font(.headline)
                        .foregroundColor(Color.red)
                        
                
                }
                
//                Button（action：{
//                        print('Order is successfully')
//                }){
//
//                    HStack{
//                    Image(systemName: "person")
//                        .font(.title)
//                    Text("Order Now")
//                        .fontWeight(.semibold)
//                        .fontTitle(.title)
//                }
//                .padding()
//                .foregroundColor(.white)
//                .backgroundColor(Color.green)
//                .cornerRadius(40)
//
//                    }
            }
                

            
            .padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LandmarkDetail(landmark: userData.landmarks[0])
            .environmentObject(userData)
    }
}
