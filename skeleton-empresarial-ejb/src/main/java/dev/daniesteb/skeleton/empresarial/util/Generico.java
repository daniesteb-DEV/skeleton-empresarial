/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dev.daniesteb.skeleton.empresarial.util;

import dev.daniesteb.skeleton.empresarial.exception.ServiceException;
import lombok.Getter;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
public class Generico<T> {

    @PersistenceContext(unitName = "REPRO360-PU")
    @Getter
    private EntityManager entityManager;

    public void guardar(final T t) throws ServiceException {
        try {
            if(!constraintValidationsDetected(t)) {
                getEntityManager().merge(t);
            }
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }
    }

    public void guardarSalida(final T t) throws ServiceException {

        try {
            if(!constraintValidationsDetected(t)) {
                getEntityManager().persist(t);
            }

        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }
    }

    public void guardarLote(final List<T> lista) throws ServiceException {
        try {
            for(T t : lista) {
                getEntityManager().merge(t);
            }
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }
    }

    public List<T> listarPorConsultaJpaNombrada(final String jpaQl, final Map<String, Object> parametros)
            throws ServiceException {
        try {
            Query query = getEntityManager().createNamedQuery(jpaQl);
            if(parametros != null) {
                for(Map.Entry en : parametros.entrySet()) {
                    query.setParameter(en.getKey()
                                         .toString(), en.getValue());

                }
            }
            return query.getResultList();
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }

    }

    public T obtenerPorConsultaJpaNombrada(final String jpaQl, final Map<String, Object> parametros)
            throws ServiceException {
        try {
            Query query = getEntityManager().createNamedQuery(jpaQl);
            if(parametros != null) {
                for(Map.Entry en : parametros.entrySet()) {
                    query.setParameter(en.getKey()
                                         .toString(), en.getValue());
                }
            }
            return (T)query.getSingleResult();
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }

    }

    public List<T> listarPorConsultaJpa(final String jpaQl, final Map<String, Object> parametros)
            throws ServiceException {
        try {
            Query query = getEntityManager().createQuery(jpaQl);
            if(parametros != null) {
                for(Map.Entry en : parametros.entrySet()) {
                    query.setParameter(en.getKey()
                                         .toString(), en.getValue());
                }
            }
            return query.getResultList();
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }

    }

    public T obtenerPorConsultaJpa(final String jpaQl, final Map<String, Object> parametros) throws ServiceException {
        try {
            Query query = getEntityManager().createQuery(jpaQl);
            if(parametros != null) {
                for(Map.Entry en : parametros.entrySet()) {
                    query.setParameter(en.getKey()
                                         .toString(), en.getValue());
                }
            }
            return (T)query.getSingleResult();
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }

    }

    public List<T> listarPorConsultaNativa(final String sql, final Map<String, Object> parametros)
            throws ServiceException {
        try {
            Query query = getEntityManager().createNativeQuery(sql);
            if(parametros != null) {
                for(Map.Entry en : parametros.entrySet()) {
                    query.setParameter(en.getKey()
                                         .toString(), en.getValue());
                }
            }
            return query.getResultList();
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }

    }

    public T obtenerPorConsultaNativa(final String sql, final Map<String, Object> parametros) throws ServiceException {
        try {
            Query query = getEntityManager().createNativeQuery(sql);
            if(parametros != null) {
                for(Map.Entry en : parametros.entrySet()) {
                    query.setParameter(en.getKey()
                                         .toString(), en.getValue());
                }
            }
            return (T)query.getSingleResult();
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }

    }

    public List listarPorConsultaNativa(final String sql, final Map<String, Object> parametros, final Class clase)
            throws ServiceException {
        try {
            Query query = getEntityManager().createNativeQuery(sql, clase);
            if(parametros != null) {
                for(Map.Entry en : parametros.entrySet()) {
                    query.setParameter(en.getKey()
                                         .toString(), en.getValue());
                }
            }
            return query.getResultList();
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }

    }

    public Object obtenerPorConsultaNativa(final String sql, final Map<String, Object> parametros, final Class clase)
            throws ServiceException {
        try {
            Query query = getEntityManager().createNativeQuery(sql, clase);
            if(parametros != null) {
                for(Map.Entry en : parametros.entrySet()) {
                    query.setParameter(en.getKey()
                                         .toString(), en.getValue());
                }
            }
            return query.getSingleResult();
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }

    }

    //Metodos agregados de clase abstractFacade
    public void create(T entity) {
        try {
            auxConstraintValidationsDetected(entity);
            getEntityManager().persist(entity);
        } catch(Exception e) {
        }
    }

    public void edit(T entity) {
        if(!constraintValidationsDetected(entity)) {
            getEntityManager().merge(entity);

        }

        //        try {
        //            getEntityManager().merge(entity);
        //        } catch (ConstraintViolationException e) {
        //            for (Object object : e.getConstraintViolations()) {
        //                System.out.println("Violación de constraints");
        //                System.out.println("" + object.toString());
        //            }
        //        }
        //        catch(Exception e)
        //        {
        //            e.printStackTrace();
        //        }
    }

    private boolean constraintValidationsDetected(T entity) {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Set<ConstraintViolation<T>> constraintViolations = validator.validate(entity);
        if(constraintViolations.size() > 0) {
            Iterator<ConstraintViolation<T>> iterator = constraintViolations.iterator();
            while(iterator.hasNext()) {
                ConstraintViolation<T> cv = iterator.next();
            }
            return true;
        }
        else {
            return false;
        }
    }

    private void auxConstraintValidationsDetected(T entity) {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Set<ConstraintViolation<T>> constraintViolations = validator.validate(entity);
        if(constraintViolations.size() > 0) {
            Iterator<ConstraintViolation<T>> iterator = constraintViolations.iterator();
            while(iterator.hasNext()) {
                ConstraintViolation<T> cv = iterator.next();
            }

        }
    }

    public void remove(T entity) {
        getEntityManager().remove(getEntityManager().merge(entity));
    }

    public T find(T entity, Object id) {
        return (T)getEntityManager().find(entity.getClass(), id);
    }

    public List<T> findRange(T entity, int[] range) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder()
                                                                        .createQuery();
        cq.select(cq.from(entity.getClass()));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        q.setMaxResults(range[1] - range[0] + 1);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }
    //
    //    public int count() {
    //        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
    //        javax.persistence.criteria.Root<T> rt = cq.from(entityClass);
    //        cq.select(getEntityManager().getCriteriaBuilder().count(rt));
    //        javax.persistence.Query q = getEntityManager().createQuery(cq);
    //        return ((Long) q.getSingleResult()).intValue();
    //    }
    //

    public T guardarRetorno(T t) throws ServiceException {
        try {
            T tipo = getEntityManager().merge(t);
            getEntityManager().flush();
            return tipo;
        } catch(RuntimeException e) {
            throw new ServiceException(e);
        }
    }
}
