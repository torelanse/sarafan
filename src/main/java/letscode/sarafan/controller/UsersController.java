package letscode.sarafan.controller;

import com.fasterxml.jackson.annotation.JsonView;
import letscode.sarafan.domain.User;
import letscode.sarafan.domain.Views;
import letscode.sarafan.repo.UserDetailsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UsersController {
    private final UserDetailsRepo userDetailsRepo;

    @Autowired
    public UsersController(UserDetailsRepo userDetailsRepo) {
        this.userDetailsRepo = userDetailsRepo;
    }

    @JsonView(Views.FullProfile.class)
    @GetMapping
    public List<User> findAll() {
        return userDetailsRepo.findAll();
    }
}
