package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.model.Registration;
import kr.ac.hansung.cse.service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;



@Controller
public class RegistrationController {

    @Autowired
    private RegistrationService registrationService;



    @GetMapping("/enroll")
    public String showEnrollmentForm(Model model) {
        model.addAttribute("registration", new Registration());
        return "enroll";
    }

    @PostMapping("/enrolledCourse")
    public String enrolled(Model model, @Valid Registration registration, BindingResult result) {
        if (result.hasErrors()) {
            System.out.println("== Form data does not validate ==");
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                System.out.println(error.getDefaultMessage());
            }
            return "enroll";
        }

        try {
            registrationService.insert(registration);
            return "enrolled";
        } catch (Exception e) {
            return "error";
        }
    }

    @GetMapping("/registration")
    public String register(Model model){
        List<Registration> registrations = registrationService.getAllRegistration();
        model.addAttribute("registrations", registrations);
        return "registration";
    }

}
