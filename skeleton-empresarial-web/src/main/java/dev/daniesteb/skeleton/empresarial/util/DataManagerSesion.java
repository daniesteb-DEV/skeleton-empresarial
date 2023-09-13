/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dev.daniesteb.skeleton.empresarial.util;

import lombok.Getter;
import lombok.Setter;
import org.primefaces.verona.domain.User;

import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.Serializable;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Named(value = "dataManagerSesion")
@SessionScoped
public class DataManagerSesion implements Serializable {

    @Inject
    private EncryptPassword encryptPassword;

    /**
     * Creates a new instance of DataManagerSesion
     */
    @Getter
    @Setter
    private User user;

    @Getter
    @Setter
    private String huella;

    @Getter
    @Setter
    private String banner;

    @Getter
    @Setter
    private String titulo;

    @Getter
    @Setter
    private String dashboard;

    @Getter
    @Setter
    private String logo;

    @Getter
    @Setter
    private String urlRetornoPagina;

    @Getter
    @Setter
    private boolean menuH = false;

    public DataManagerSesion() throws IOException {

    }

    @PostConstruct
    public void postConstructor() {
        try {
            //controlarAcceso();
        } catch(Exception e) {
            try {
                FacesContext.getCurrentInstance()
                            .getExternalContext()
                            .redirect(FacesContext.getCurrentInstance()
                                                  .getExternalContext()
                                                  .getApplicationContextPath() + "/login.xhtml");
            } catch(IOException ex) {

            }
        }
    }

    public void controlarAcceso() throws
                                  IOException { //este metodos es llamado cada vez que inicia el bean, cada vez que inicia la peticion, sea por primera vez o después que se ha expirado
        try {
            HttpServletRequest request = (HttpServletRequest)FacesContext.getCurrentInstance()
                                                                         .getExternalContext()
                                                                         .getRequest();
            String uri = request.getRequestURI();
            //si no hay usuario logeado (todas las pantallas excepto login) destruye la session y redireciona al login
            if(user == null && !uri.equals(FacesContext.getCurrentInstance()
                                                       .getExternalContext()
                                                       .getApplicationContextPath() + "/login.xhtml")) {

                FacesContext.getCurrentInstance()
                            .getExternalContext()
                            .invalidateSession();
                FacesContext.getCurrentInstance()
                            .getExternalContext()
                            .redirect(FacesContext.getCurrentInstance()
                                                  .getExternalContext()
                                                  .getApplicationContextPath() + "/login.xhtml");
            }
        } catch(IOException e) {
            FacesContext.getCurrentInstance()
                        .getExternalContext()
                        .redirect(FacesContext.getCurrentInstance()
                                              .getExternalContext()
                                              .getApplicationContextPath() + "/login.xhtml");
        }

    }

    public void logout() throws IOException {
        try {
            setCookie("Rol", "0", 0);
            setCookie("Usuario", "0", 0);


            user = new User();
            FacesContext.getCurrentInstance()
                        .getExternalContext()
                        .invalidateSession();

            FacesContext.getCurrentInstance()
                        .getExternalContext()
                        .redirect(FacesContext.getCurrentInstance()
                                              .getExternalContext()
                                              .getApplicationContextPath() + "/login.xhtml");

        } catch(Exception e) {
            FacesContext.getCurrentInstance()
                        .getExternalContext()
                        .redirect(FacesContext.getCurrentInstance()
                                              .getExternalContext()
                                              .getApplicationContextPath() + "/login.xhtml");
        }

    }

    public void setCookie(String name, String value, int expiry) {
        try {
            Map<String, Object> properties = new HashMap<>();
            properties.put("maxAge", expiry);
            properties.put("path", "/");
            FacesContext.getCurrentInstance()
                        .getExternalContext()
                        .addResponseCookie(name,
                                           URLEncoder.encode(encryptPassword.encrypt(value), "UTF-8"),
                                           properties);
        } catch(Exception e) {

        }
    }

    public String getCookie(String name) {
        try {
            Map<String, Object> datos = FacesContext.getCurrentInstance()
                                                    .getExternalContext()
                                                    .getRequestCookieMap();
            javax.servlet.http.Cookie cookie = (javax.servlet.http.Cookie)datos.get(name);
            return encryptPassword.decrypt(URLDecoder.decode(cookie.getValue(), "UTF-8"));
        } catch(Exception e) {
            return "";
        }
    }

    public void validarAcceso() {

    }

    public void banner(String banner) {
        setBanner(banner);
    }

    public void dashboard(String dashboard) {
        setDashboard(dashboard);
    }

    public void titulo(String titulo) {
        setTitulo(titulo);
    }

    public void logo(String logo) {
        setLogo(logo);
    }

}
