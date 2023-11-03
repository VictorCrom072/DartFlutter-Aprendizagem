typedef T InstanceCreator<T>();

class DependencyInjector {
  DependencyInjector._();
  static final _singleton = DependencyInjector._();
  factory DependencyInjector() => _singleton;

  // Map
  final _instanceMap = Map<Type, _InstanceGeneretor<Object>>();

  // Registrar
  void register<T extends Object>(
  InstanceCreator<T> instance,
  {bool isSingleton = false}) =>
    _instanceMap[T] = _InstanceGeneretor(instance, isSingleton);

  // Get
  T get<T extends Object>(){
    final instance = _instanceMap[T]?.getInstance();
    if(instance != null && instance is T) return instance;
    throw Exception("Erro => Instancia ${T.toString()} não encontrada!");
  }
}

class _InstanceGeneretor<T>{
  T? _instance;
  bool _isFirstGet = false;
  final InstanceCreator<T> _instanceCreator;
  _InstanceGeneretor(this._instanceCreator, bool isSingleton) : _isFirstGet = isSingleton;
  T? getInstance(){
    if(_isFirstGet){
      _instance = _instanceCreator();
      _isFirstGet = false;
    }
    return _instance != null ? _instance : _instanceCreator();
  }
}