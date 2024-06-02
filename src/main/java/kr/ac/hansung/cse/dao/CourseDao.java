package kr.ac.hansung.cse.dao;

import kr.ac.hansung.cse.model.Course;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class CourseDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Course> getAllCourses() {
        return entityManager.createQuery("SELECT c FROM Course c ORDER BY c.year, c.semester", Course.class)
                .getResultList();
    }

    public List<Course> getCoursesByYearAndSemester(int year, int semester) {
        return entityManager.createQuery("SELECT c FROM Course c WHERE c.year = :year AND c.semester = :semester", Course.class)
                .setParameter("year", year)
                .setParameter("semester", semester)
                .getResultList();
    }


    public void insert(Course course) {
        entityManager.persist(course);
    }
}
