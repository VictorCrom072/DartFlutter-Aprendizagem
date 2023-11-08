abstract class DaoConfig<T> {
  Future create(T value);
  Future<T> find(int id);
  Future<List<T>> findAll();
  Future update(T value);
  Future delete(int id);
}