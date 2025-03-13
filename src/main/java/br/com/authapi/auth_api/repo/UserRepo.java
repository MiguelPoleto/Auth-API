package br.com.authapi.auth_api.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import br.com.authapi.auth_api.model.User;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
    
    UserDetails findByUsername(String username);

}
