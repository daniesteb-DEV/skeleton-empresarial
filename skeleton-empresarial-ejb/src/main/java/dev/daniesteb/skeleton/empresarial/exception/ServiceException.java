/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dev.daniesteb.skeleton.empresarial.exception;

import javax.ejb.ApplicationException;
import java.io.Serializable;

/**
 *
 * @author RC_SALAZARG
 */
@ApplicationException(rollback = true)
public class ServiceException extends Exception implements Serializable{
   

    public ServiceException() {
    }

    public ServiceException(String message) {
        super(message);
    }

    public ServiceException(Throwable cause) {
        super(cause);
    }

    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }
    
    
}
