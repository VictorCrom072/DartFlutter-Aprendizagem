abstract class GenericService<T>{
  T findOne(int id);
  List<T> findAll();
  bool delete(int id);
  bool save(T value);
}