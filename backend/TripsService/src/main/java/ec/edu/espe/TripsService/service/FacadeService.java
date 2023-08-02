package ec.edu.espe.TripsService.service;

import java.util.List;
import java.util.Optional;

public interface FacadeService<T, K> {
    T create(T t);
    Optional<T> readById(K k);
    List<T> readAll();
    T update(K k, T t);
    void deleteById(K k);
}

