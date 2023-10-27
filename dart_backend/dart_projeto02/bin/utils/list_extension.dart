extension ListExtension<E> on List<E> {
  E? firstWhereOrNull(bool Function(E e) test){
    for(E e in this){
      if(test(e)) return e;
    }
    return null;
  }
}