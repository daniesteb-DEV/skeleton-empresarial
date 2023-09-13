package dev.daniesteb.skeleton.empresarial.repository;

import dev.daniesteb.skeleton.empresarial.domain.User;
import dev.daniesteb.skeleton.empresarial.exception.ServiceException;
import dev.daniesteb.skeleton.empresarial.util.Generico;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@LocalBean
@Stateless
public class UserRepository extends Generico<User> implements Serializable {

    public List<User> findAll() {
        try {
            return listarPorConsultaJpa("SELECT u FROM User u", null);
        } catch(ServiceException e) {
            return new ArrayList<>();
        }
    }
}
