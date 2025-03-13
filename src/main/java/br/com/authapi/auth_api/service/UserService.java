package br.com.authapi.auth_api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.authapi.auth_api.repo.UserRepo;
import br.com.authapi.auth_api.model.User;

@Service
public class UserService {

    private final UserRepo userRepo;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepo userRepo, PasswordEncoder passwordEncoder) {
        this.userRepo = userRepo;
        this.passwordEncoder = passwordEncoder;
    }

    public User save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
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

    public Optional<User> findByEmail(String email) {
        return userRepo.findByEmail(email);
    }

}
