package dev.daniesteb.skeleton.empresarial.service.impl;

import dev.daniesteb.skeleton.empresarial.repository.UserRepository;
import dev.daniesteb.skeleton.empresarial.service.UserService;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

@LocalBean
@Stateless
public class UserServiceImpl extends UserRepository implements UserService {

}
