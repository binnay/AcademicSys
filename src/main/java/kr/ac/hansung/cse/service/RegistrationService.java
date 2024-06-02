package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.RegistrationDao;
import kr.ac.hansung.cse.model.Registration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RegistrationService {

    @Autowired
    private RegistrationDao registrationDao;

    public List<Registration> getAllRegistration() {
        return registrationDao.getAllRegistration();
    }

    public void insert(Registration registration) {
        registrationDao.insert(registration);
    }
}
