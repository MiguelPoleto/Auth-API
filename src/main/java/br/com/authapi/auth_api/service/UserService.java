package br.com.authapi.auth_api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import br.com.authapi.auth_api.repo.UserRepo;
import br.com.authapi.auth_api.model.User;

@Service
public class UserService {

    private final UserRepo userRepo;

    public UserService(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    public User save(User user) {
        return userRepo.save(user);
    }

    public void deleteById(Integer id) {
        userRepo.deleteById(id);
    }

    public Optional<User> findById(Integer id) {
        return userRepo.findById(id);
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public Optional<User> findByUsername(String username) {
        return userRepo.findByUsername(username);
    }

    public Optional<User> findByEmail(String email) {
        return userRepo.findByEmail(email);
    }

}
