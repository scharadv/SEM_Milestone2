//
//  ContentView.swift
//  Milestone2
//
//
//

import SwiftUI
import Charts

struct HeartValue: Identifiable {
    var heartSeries: String
    var date: Date
    var value: Int
    var id = UUID()

    init(heartSeries: String, hour: Int, minute: Int, value: Int) {
        let calendar = Calendar.autoupdatingCurrent
        self.heartSeries = heartSeries
        self.date = calendar.date(from: DateComponents(year: 2022, hour: hour, minute: minute))!
        self.value = value
    }
}
var myData: [HeartValue] = [
    HeartValue(heartSeries: "Heart Rate", hour: 13, minute: 5, value: 76),
    HeartValue(heartSeries: "Heart Rate",  hour: 13, minute: 6,value: 80),
    HeartValue(heartSeries: "Heart Rate",  hour: 13, minute: 7,value: 81),
    HeartValue(heartSeries: "Heart Rate",  hour: 13, minute: 8,value: 79),
    HeartValue(heartSeries: "Heart Rate",  hour: 13, minute: 9,value: 75),
    HeartValue(heartSeries: "Heart Rate",  hour: 13, minute: 10,value: 77),
    
    HeartValue(heartSeries: "HRV (ms)", hour: 13, minute: 5, value: 40),
    HeartValue(heartSeries: "HRV (ms)",  hour: 13, minute: 6, value: 42),
    HeartValue(heartSeries: "HRV (ms)",  hour: 13, minute: 7, value: 43),
    HeartValue(heartSeries: "HRV (ms)",  hour: 13, minute: 8, value: 41),
    HeartValue(heartSeries: "HRV (ms)",  hour: 13, minute: 9, value: 40),
    HeartValue(heartSeries: "HRV (ms)",  hour: 13, minute: 10, value: 44)
]
struct LineChart: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            Chart(myData) {
                LineMark(
                    x: .value("Time", $0.date),
                    y: .value("Value", $0.value),
                    series: .value("Series", $0.heartSeries)
                )
                .foregroundStyle(by: .value("Series", $0.heartSeries))
            }
            .frame(width: 360, height: 300)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 0.0) {
            
            
            Header()
            ScrollView(.vertical, showsIndicators: false){
           // Stories()
   
            Divider()
            
            Post()
            
         //   Post(image: "dog", description: "Almost 2 years old")
                
            }
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Post: View {
    var image: String = "profile"
    var image1: String = "Doctor"
    var description: String = "Start Feeling better just by observing data"
    
    var body: some View {
       PostHeader().background(
        Image(image1)
            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .clipped().opacity(0.1))
                        .edgesIgnoringSafeArea(.all)
        
        Spacer()
        Spacer()
       
       
        PostContent()
        
    }
}


struct Header: View {
    var body: some View {
        HStack(spacing: -200){
            VStack(alignment: .leading, spacing: -60){
                Image("logo").resizable().aspectRatio(contentMode: .fit).padding(.vertical).frame(width: 150, height: 100
                )
                
                
                Text("Good Morning, Alex").font(.headline).fontWeight(.regular).foregroundColor(Color.gray).multilineTextAlignment(.leading).frame(width: 200, height: 80)
            }
                //  Spacer()
                
                
                /*  HStack(spacing: 20.0) {
                 Image("add")
                 Image("heart")
                 Image("messenger")
                 }*/
                
            }
        .padding(.horizontal, 10)
        .frame(width: 20.0)
       // .padding(.vertical, 0)
    }
}





struct PostHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 25){
                
               //Start Feeling better just by observing data
                //All you have to do is check in often
                Text("Welcome")
                    .font(.title)
                    .foregroundColor(Color.black)
                    .bold()
                   //.frame(width: .infinity)
                    .padding(.horizontal, 5)
                .padding(.vertical, 5)
            
                
                HStack{
                    Text("Learn how your body works and what it needs, and build your self awareness for better self care")
                        .font(.body)
                        .bold()
                        .foregroundColor(Color.black)
                  
                        .padding(.horizontal, 9)
                        .padding(.vertical, 5)
                    
                    Image("welcome").resizable().padding(.vertical).frame(width: 150, height: 150
                    )
                }
              
            }
            Spacer()
            
          
        }
      
    }
}

struct PostContent: View {
 //   var image: String = "dog"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                
                HStack {
                    Text("Your Health Data").bold()
                        .font(.title) .padding(.horizontal, 1)
                        .padding(.vertical, 2)
                    
                  /*  Button(action: {
                        // authorizeHealthKit()
                    }, label: {
                        Text("Authorize Health Data ").bold()
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    })*/
                }
                
                VStack(alignment: .leading, spacing: 10){
                    LineChart().padding(.horizontal, 9)
                        .padding(.vertical, 5)
                    
                    
                }.background(Color.gray.opacity(0.15).edgesIgnoringSafeArea(.all))
                
            }}}
}


struct TabBar: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Divider()
            HStack(spacing: 70){
                VStack(spacing: 20){
                    Image("dashboard").resizable().frame(width: 40, height: 40) .aspectRatio(UIImage(named: "dashboard")!.size, contentMode: .fit)
                    Text("Dashboard")
                }
               // Spacer()
                VStack(spacing: 20){
                    Image("checkin").resizable().frame(width: 40, height: 40)
                    Text("Check In")
                }
                VStack(spacing: 20){
                    Image("reports").resizable().frame(width: 40, height: 40)
                    Text("Reports")
                }
                
               
            }
        
        }
    }
}
