
import SwiftUI

struct DetailsView: View {
    
    var body: some View {
    
        VStack(spacing: 10) {
            //MapView
         mapView(showingControls: false)
                .frame(height: 150)
            
            //Tab
            HStack(spacing: 0) {
                TabButton(title: "SUNRISE & SET", subtitle: "1 DAY", isSelected: true)
                TabButton(title: "DAYLIGHT", subtitle: "ANNUAL OVERVIEW", isSelected: false)
                TabButton(title: "SOLAR ECLIPSE", subtitle: "CALENDAR", isSelected: false)
            }
            .frame(height: 80)
            .background(Color.black)
           .font(.caption)
           
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 10) {
                    Grid(alignment: .center, horizontalSpacing: 20, verticalSpacing: 5 ) {
                        ForEach(0..<4) { rowIndex in
                           GridRow {
                                ForEach(0..<4) { columnIndex in
                                   let cellNumber = (rowIndex * 4) + (columnIndex)
                               }
                            }
                        }
                        
                    }
                    
                }
                    
            }
            
         
            
            //List
            List(mockEvents) { event in
                SunEventRow(event: event)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .padding(.top,20)
            
        }
        
    }
    
    
    
    
    
    struct TabButton: View {
        let title: String
        let subtitle: String
        let isSelected: Bool
        
        var body: some View {
            VStack(spacing: 4) {
                Text(title)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(isSelected ? .red : .white)
                
                Text(subtitle)
                    .font(.system(size: 9))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(isSelected ? Color.red.opacity(0.1) : Color.clear)
        }
    }
    
    struct SunEventRow: View {
        let event: SunEvent
        
        var body: some View {
            HStack(spacing: 12) {
                Rectangle()
                    .fill(event.color)
                    .frame(width: 4)
                
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(event.title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text(event.timeRange)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                    Text(event.duration)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                
                Image(systemName: "bell.slash.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
                    .padding(.trailing, 18)
            }
            .frame(height: 60)
            .listRowBackground(Color.black)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
    
    struct SunEvent: Identifiable {
        let id = UUID()
        let title: String
        let timeRange: String
        let duration: String
        let color: Color
    }
    
    let mockEvents = [
        SunEvent(title: "Nighttime", timeRange: "23:48 - 05:13", duration: "5h 24min", color: .black),
        SunEvent(title: "Astronomical Twilight", timeRange: "05:13 - 05:45", duration: "32min", color: .indigo),
        SunEvent(title: "Nautical Twilight", timeRange: "05:45 - 06:18", duration: "32min", color: .blue),
        SunEvent(title: "Civil Twilight", timeRange: "06:18 - 06:47", duration: "29min", color: .blue),
        SunEvent(title: "Sunrise", timeRange: "06:47 - 06:50", duration: "3min", color: .red),
        SunEvent(title: "Golden Hour", timeRange: "06:50 - 07:28", duration: "37min", color: .yellow),
        SunEvent(title: "Morning", timeRange: "07:28 - 11:48", duration: "4h 20min", color: .yellow),
        SunEvent(title: "Solar Noon", timeRange: "11:48",duration: "31°", color: .yellow),
        SunEvent(title: "After Noon", timeRange: "11:48 - 16:07", duration: "4h 19min", color: .yellow),
        SunEvent(title: "Golden Hour", timeRange: "16:07- 16:45", duration: "37min", color: .yellow),
        SunEvent(title: "Sunset", timeRange: "16:45 - 16:48", duration: "3min", color: .red),
        SunEvent(title: "Civil Twilight", timeRange: "06:18 - 06:47", duration: "29min", color: .blue),
        SunEvent(title: "Nautical Twilight", timeRange: "05:45 - 06:18", duration: "32min", color: .blue),
        SunEvent(title: "Astronomical Twilight", timeRange: "05:13 - 05:45", duration: "32min", color: .indigo),
        SunEvent(title: "Nighttime", timeRange: "23:48 - 05:13", duration: "5h 24min", color: .black)
            
    ]
       
        
    }


#Preview {
    DetailsView()
}
