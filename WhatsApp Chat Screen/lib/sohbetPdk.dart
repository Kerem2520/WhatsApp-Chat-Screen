import 'package:flutter/material.dart';
import 'kaynak.dart';

class ChatScreen extends StatefulWidget {
final List messagess;
ChatScreen(this.messagess);
  
  


  @override
    
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  

 // int currentMatchIndex = -1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  automaticallyImplyLeading: false, 
  backgroundColor: Color(0xFF128C7E),
  title: Row(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage("assets/kedi.jpg"),
      ),
      SizedBox(width: 10), 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Kerem'), 
          Text(
            'Çevrimiçi',
            style: TextStyle(fontSize: 12),
          ), 
        ],
      ), 
    ],
    
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.camera_enhance),
      onPressed: () {
        showDialog(
      context: context,
  //    barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => true,
          child: AlertDialog(
            content: Text("Görüntülü Arama Özelliği "),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                 }, 
                child: Text('Tamam'),
              ),
            ],
          ),
        );
      },
    );
      },
    ),
    IconButton(
      icon: Icon(Icons.phone),
      onPressed: () {
        showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            content: Text("Sesli Arama Özelliği"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                 },
                child: Text('Tamam'),
              ),
            ],
          ),
        );
      },
    );
      },
    ),
    PopupMenuButton(
      icon: Icon(Icons.more_vert), 
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: Text('Yukarı'),
            value: 'Top',
            
          ),
           PopupMenuItem(
            child: Text('Aşağı'),
            value: 'Bottom',
          ),
          PopupMenuItem(
            child: Text('Diğer Özellikler'),
            value: 'cnm',
          ),
        ];
      },

      onSelected: (value) {
  if (value == 'Top') {
   _scrollController.animateTo(   
    0.0,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
);
  }
 if (value == "Bottom"){        
   _scrollController.animateTo(
  _scrollController.position.maxScrollExtent,
  duration: Duration(milliseconds: 500),
  curve: Curves.easeInOut,
);

 }

 if (value == "cnm"){
 }
},
      
    ),
  ],
     ),
      backgroundColor: Color(0xFFECE5DD),
      body: Column(children: [
         Expanded(
           child: Scrollbar(
            controller: _scrollController,
             interactive: true,
             isAlwaysShown: true,
             trackVisibility: true,
             thickness: 5,
             child: ListView.builder(
               controller: _scrollController,
               itemCount: widget.messagess.length,
               itemBuilder: (BuildContext context, int index) {
                 return MessageBubble(sender: widget.messagess[index].sender,
             text: widget.messagess[index].text,
             image: widget.messagess[index].image,time: widget.messagess[index].time,);
               },
             ),
           ),
         ),
           

      ],)
      );
  }

}

class Message {
  final String sender;
  final String text;
  final String? image;
  final String time;

  Message({ required this.sender,required this.text, this.image, required this.time});
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final String? image;
  final String time;

  MessageBubble({required this.sender ,required this.text, this.image,required this.time});


  @override
    Widget build(BuildContext context) {
    return Padding(
      padding: sender == "Tarih" ? EdgeInsets.only(top: 10.0,bottom: 10.0) : EdgeInsets.only(left:10.0, top: 1.0, bottom: 1.0, right: 10.0),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 4.0),
           if (image != null) 
             Align(
              alignment: sender == 'Ahmet' ? Alignment.centerRight: Alignment.centerLeft,
               child: Container(
                width: 250, 
                height: 250, 
                margin: EdgeInsets.only(bottom: 6.0, top: 6.0), // Sağ boşluk
                decoration: BoxDecoration(
                  border: Border.all(
                  color: sender == "Ahmet" ? Color(0xFFDCF8C6): Colors.grey.shade200 , 
                  width: 8, 
                     ),
                  borderRadius: BorderRadius.circular(16),
                    ),
                child: Image.asset(image!),
                ),
             ),
             Container(
                 child: Align(
                             alignment: sender == 'Ahmet' ? Alignment.centerRight : sender == 'Kerem' ? Alignment.centerLeft : Alignment.center,
                             child: Material(
                  elevation: 8.0,   
                  borderRadius: BorderRadius.circular(18.0), 
                  color: sender == 'Ahmet' ? Color(0xFFDCF8C6):sender== "Kerem" ? Colors.grey.shade100 :  Colors.grey.shade300, 
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), 
                    child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 310),
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: sender == "Tarih" ? 13.0 : 15.0,
                            letterSpacing: 1.0,
                            fontFamily: "Elephant",
                            color: sender == 'Tarih' ? Colors.black : Colors.black,
                          ),
                        ),
                      ),
                      if (sender != 'Tarih')
                        SizedBox(height: 5.0),
                      if (sender != 'Tarih')      
                        Text(
                          time, 
                          style: TextStyle(
                            fontSize: 13.0, 
                            color: Colors.grey.shade600, 
                            fontWeight: FontWeight.w700
                          
                        ),
                      ),
                    
                    ],
                    
                  ),
                    ),
                  ),
                 ),
               ),  
        ],
        
      ),
    );
  }          
      
}
                      
            
            
            
            
  
  



  
               
    