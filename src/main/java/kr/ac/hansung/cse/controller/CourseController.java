package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.model.Course;
import kr.ac.hansung.cse.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;


    @GetMapping("/course")
    public String getAllCourses(Model model) {
        try {
            List<Course> courses = courseService.getAllCourses();
            model.addAttribute("courses", courses);
            return "course";
        } catch (Exception e) {
            return "error";
        }
    }

    @GetMapping("/courseDetails")
    public String getCourseDetails(@RequestParam("year") int year,
                                   @RequestParam("semester") int semester,
                                   Model model) {
        List<Course> courses = courseService.getCoursesByYearAndSemester(year, semester);
        model.addAttribute("courses", courses);
        return "courseDetails";
    }

}
