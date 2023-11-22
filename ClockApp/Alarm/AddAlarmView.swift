//
//  AddAlarmView.swift
//  ClockApp
//
//  Created by ivan on 22.11.23.
//

import SwiftUI

struct AddAlarmView: View {
    @Binding var alarms: [Alarm]
    @State private var date = Date()
    @State private var label = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Select Time", selection: $date, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                
                
                GroupBox {
                    TextField("Lable", text: $label)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                Spacer()
                
                
            }
            .padding(.top, 50)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        alarms.append(Alarm(time: date, label: label, isOn: true))
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.title3)
                            .foregroundStyle(.orange)
                            .bold()
                    }

                }
            }
        }
    }
}

#Preview {
    AddAlarmView(alarms: Binding.constant([Alarm]()))
}
