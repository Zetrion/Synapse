import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Dental App',
      debugShowCheckedModeBanner:false,
     home: PatientProfilePage(),
    );
  }
}
class PatientProfilePage extends StatelessWidget{
  final Map<String,dynamic> patient={
    'name': 'Raj',
    'age': 21,
    'gender': 'Male',
    'phone': '+91 8909546734',
    'email': 'raj@gmail.com',
    'abhaid': '91-0989-8945-7812',
    'bloodgroup': 'O+ve',
    'profilePic': 'https://i.pravatar.cc/300',
    'nextAppointment': '1 July 2025, 10:30 AM',
    'treatmentHistory': [
      {'date': '10 June 2025', 'procedure': 'Root Canal'},
      {'date': '17 Mar 2025' , 'procedure': 'Tooth Cleaning'},
    ]
    
  };

  PatientProfilePage({super.key});
  
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
     appBar: AppBar(
      title: Text('Patient Profile'),
      backgroundColor: Color.fromARGB( 255,0, 55, 255),
     ),
     body: SingleChildScrollView(
       padding: EdgeInsets.all(16),
       child: Column(
        children: [
          CircleAvatar(
           radius:25,
           child: Icon(
            Icons.person,
            size: 50,
            color: Colors.white,
           ),
          ),
          SizedBox(height: 12),
          Text(
            patient['name'],
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          ),
          Text("${patient['age']} yrs • ${patient['gender']}"),
           
          
          
          Divider(height: 30),
          
          ///Contact Info
          _buildInfoTile(Icons.phone, patient['phone']),
          _buildInfoTile(Icons.email, patient['email']),
          _buildInfoTile(Icons.badge, patient['abhaid']),
          _buildInfoTile(Icons.bloodtype, patient['bloodgroup']),
          SizedBox(height: 20),
          
          ///Upcoming Appointment
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.calendar_today,color:Color.fromARGB(255,0, 55, 255)),
               title: Text('Next Appointment'),
               subtitle: Text(patient['nextAppointment']),
               ),
        ),
       SizedBox(height: 20),
            
       ///Treatment History
       Align(
          alignment: Alignment.centerLeft,
          child: Text('Treatment History',
               style: TextStyle(fontSize:18, fontWeight: FontWeight.w600)),
       ),
       SizedBox(height: 10),
       ...patient['treatmentHistory'].map<Widget>((treatment) {
         return Card(
           child: ListTile(
             leading: Icon(Icons.check_circle,color: Colors.green),
             title: Text(treatment['procedure']),
             subtitle: Text(treatment['date']),
           ),
       );    
          
  }).toList(),
  ],
 ),
 ),
 );
 }  
  
  Widget _buildInfoTile(IconData icon,String info) {
    return ListTile(
    leading: Icon(icon, color: Color.fromARGB(255,0, 55, 255)),
    title: Text(info, style: TextStyle(fontSize:16)),
     );
    
  }  
 
          }