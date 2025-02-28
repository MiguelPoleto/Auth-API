package br.com.authapi.auth_api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import br.com.authapi.auth_api.model.Role;
import br.com.authapi.auth_api.repo.RoleRepo;

@Service
public class RoleService {

    private final RoleRepo roleRepo;

    public RoleService(RoleRepo roleRepo) {
        this.roleRepo = roleRepo;
    }

    public Role save(Role role) {
        return roleRepo.save(role);
    }

    public Optional<Role> findByName(String name) {
        return roleRepo.findByName(name);
    }

    public Optional<Role> findById(Integer id) {
        return roleRepo.findById(id);
    }
    
    public List<Role> findAll() {
        return roleRepo.findAll();
    }
 
}
