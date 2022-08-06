import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:

  Inicializar en el main
    final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();
    
    Recuerden que el main() debe de ser async {...

*/

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }
    set idacom( String value ) {
    _prefs.setString('idacom', value);
  }
   get idacom {
    return _prefs.getString('idacom') ?? '';
  }
  


    set progres( double value ) {
    _prefs.setDouble('progres', value);
  }
   get progres {
    return _prefs.getDouble('progres') ?? '';
  }

    set bck( bool value ) {
    _prefs.setBool('bck', value);
  }
   get bck {
    return _prefs.getBool('bck') ?? '';
  }
  set btlocal( bool value ) {
    _prefs.setBool('btlocal', value);
  }
   get btlocal {
    return _prefs.getBool('btlocal') ?? '';
  }
    set numacom( bool value ) {
    _prefs.setBool('numacom', value);
  }
   get numacom {
    return _prefs.getBool('numacom') ?? '';
  }

     set eliminoacom( bool value ) {
    _prefs.setBool('eliminoacom', value);
  }
   get eliminoacom {
    return _prefs.getBool('eliminoacom') ?? '';
  }
   
    set cargandofoto( bool value ) {
    _prefs.setBool('cargandofoto', value);
  }
   get cargandofoto {
    return _prefs.getBool('cargandofoto') ?? '';
  }
   

     set active( bool value ) {
    _prefs.setBool('active', value);
  }
   get active {
    return _prefs.getBool('active') ?? '';
  }
    set activefotos( bool value ) {
    _prefs.setBool('activefotos', value);
  }
   get activefotos {
    return _prefs.getBool('activefotos') ?? '';
  }

    set boton( bool value ) {
    _prefs.setBool('boton', value);
  }
   get boton {
    return _prefs.getBool('boton') ?? '';
  }
  get rutanetsol {
    return _prefs.getString('rutanetsol') ?? '';
  }
  
  set rutanetsol( String value ) {
    _prefs.setString('rutanetsol', value);
  }
   get rutanet {
    return _prefs.getString('rutanet') ?? '';
  }
  
  set rutanet( String value ) {
    _prefs.setString('rutanet', value);
  }
   get rutanet2 {
    return _prefs.getString('rutanet2') ?? '';
  }

  set rutanet2( String value ) {
    _prefs.setString('rutanet2', value);
  }
  get validar2 {
    return _prefs.getBool('validar2') ?? '';
  }

  set validar2( bool value ) {
    _prefs.setBool('validar2', value);
  }
   get validar {
    return _prefs.getBool('validar') ?? '';
  }

  set validar( bool value ) {
    _prefs.setBool('validar', value);
  }

   // GET y SET 

    get rutasol {
    return _prefs.getString('rutasol') ?? '';
  }

  set rutasol( String value ) {
    _prefs.setString('rutasol', value);
  }
  get ruta {
    return _prefs.getString('ruta') ?? '';
  }

  set ruta( String value ) {
    _prefs.setString('ruta', value);
  }
  get ruta2 {
    return _prefs.getString('ruta2') ?? '';
  }

  set ruta2( String value ) {
    _prefs.setString('ruta2', value);
  }
   // GET y SET de habitacion
  get hab {
    return _prefs.getString('hab') ?? '';
  }
  
  set hab( String value ) {
    _prefs.setString('hab', value);
  }
  get pesofoto1 {
    return _prefs.getString('pesofoto1') ?? '';
  }
  
  set pesofoto1( String value ) {
    _prefs.setString('pesofoto1', value);
  }
  get pesofoto2 {
    return _prefs.getString('pesofoto2') ?? '';
  }
  
  set pesofoto2( String value ) {
    _prefs.setString('pesofoto2', value);
  }
  
  // GET y SET del nombre
  get nombre {
    return _prefs.getString('nombre') ?? 'null';
  }

  set nombre( String value ) {
    _prefs.setString('nombre', value);
  }

  // GET y SET del correo
  get correo {
    return _prefs.getString('correo') ?? '';
  }

  set correo( String value ) {
    _prefs.setString('correo', value);
  }
    // GET y SET de foto
  get foto {
    return _prefs.getString('foto') ?? '';
  }

  set foto( String value ) {
    _prefs.setString('foto', value);
  }

  get usuariox {
    return _prefs.getString('usuariox') ?? '';
  }

  set usuariox( String value ) {
    _prefs.setString('usuariox', value);
  }
 get correoreal {
    return _prefs.getString('correoreal') ?? '';
  }

  set correoreal( String value ) {
    _prefs.setString('correoreal', value);
  }
  
  get token {
    return _prefs.getString('token') ?? 'inicio';
  }

  set token( String value ) {
    _prefs.setString('token', value);
  }

   get fb {
    return _prefs.getBool('fb') ?? '';
  }

  set fb( bool value ) {
    _prefs.setBool('fb', value);
  }

   get idioma {
    return _prefs.getBool('idioma') ?? true;
  }

  set idioma( bool value ) {
    _prefs.setBool('idioma', value);
  }
  
   get enc {
    return _prefs.getBool('enc') ?? false;
  }

  set enc( bool value ) {

    _prefs.setBool('enc', value);
    
  }

   get enc1 {
    return _prefs.getBool('enc1') ?? false;
  }

  set enc1( bool value ) {
    _prefs.setBool('enc1', value);
  }
}

