package kr.ac.hansung.cse.dao;

import kr.ac.hansung.cse.model.Registration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


@Repository
@Transactional
public class RegistrationDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Registration> getAllRegistration() {
        return entityManager.createQuery("SELECT c FROM Registration c ", Registration.class)
                .getResultList();
    }

    public void insert(Registration registration) {
        entityManager.persist(registration);
    }
}
