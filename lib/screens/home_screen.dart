import 'package:eticket_app/models/evento_model.dart';
import 'package:eticket_app/screens/evento_screen.dart';
import 'package:eticket_app/services/auth_service.dart';
import 'package:eticket_app/services/evento_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';   
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget { 
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

  class _HomeScreenState extends State<HomeScreen> {
    final eventoService = EventoService();
    final RefreshController _refreshController =
    RefreshController(initialRefresh: false);
    List<Evento> listaEvento = [];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false); 
   // final eventoService = Provider.of<EventoService>(context, listen: false); 
    final user = authService.user;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Eventos Disponibles"),
      ),
      drawer: Drawer(
        child: ListView( 
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/007/319/933/non_2x/black-avatar-person-icons-user-profile-icon-vector.jpg'),
                      radius: 40.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      user.name,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ), 
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .5),
                    child: Text(
                      'Personal de Eventos',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),  
                ],        
              ), 
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_outlined),
              title: Text('Eventos'),
              onTap: () { 
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: Text('Lector QR'),
              onTap: () { 
                Navigator.pushReplacementNamed(context, 'qr');
              },
            ), 
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Salir'),
              onTap: () {  
                authService.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _getEventos(user.id),
        builder: (context, AsyncSnapshot<List<Evento>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _listViewEventos(user.id);
          }
        },
      )
    );
  }
 Widget _listViewEventos(int user_id) {
    return SmartRefresher(
      
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: _cargarEventos,
      header: WaterDropHeader(
        complete: Icon(Icons.check, color: Colors.indigoAccent.shade100),
        waterDropColor: Colors.indigoAccent.shade100,
      ),
      
      child: listaEvento.isEmpty
          ? Center(child: titulo("Sin Eventos!"))
          : ListView.separated(
              itemCount: listaEvento.length,
              separatorBuilder: (_, i) => const Divider(),
              itemBuilder: (_, i) => EventoScreen(
                evento: listaEvento[i], 
              ),
              
            ),
            
    );
  }

  Widget titulo(String nombre) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Text(nombre,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 30.0, color: Colors.black54)));
  }

  void _cargarEventos() async {
    
    listaEvento = await eventoService.getEventos(3);
    setState(() {}); 
    _refreshController.refreshCompleted();
  }

  Future<List<Evento>> _getEventos(int idUser) async {
    listaEvento = await eventoService.getEventos(idUser);
    return listaEvento;
  }
}