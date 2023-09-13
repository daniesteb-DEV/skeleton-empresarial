package dev.daniesteb.skeleton.empresarial.controller;

import dev.daniesteb.skeleton.empresarial.domain.User;
import dev.daniesteb.skeleton.empresarial.service.UserService;
import dev.daniesteb.skeleton.empresarial.util.DataManagerSesion;
import lombok.Getter;
import lombok.Setter;
import org.primefaces.verona.view.GuestPreferences;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.Serializable;

@Named
@ViewScoped
public class LoginController implements Serializable {
    @EJB
    private UserService userService;

    @Inject
    private DataManagerSesion dataManagerSesion;
    @Inject
    @Getter
    @Setter
    private GuestPreferences guestPreferences;

    @Getter
    @Setter
    private User user;

    @PostConstruct
    public void init() {
        user = new User();
    }

    public void logIn() {

    }

    public void register(){

    }
}
