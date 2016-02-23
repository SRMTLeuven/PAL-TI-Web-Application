package be.peerassistedlearningti.web.controller.student;

import be.peerassistedlearningti.model.Application;
import be.peerassistedlearningti.model.Course;
import be.peerassistedlearningti.model.Student;
import be.peerassistedlearningti.service.PALService;
import be.peerassistedlearningti.web.model.form.TutorApplyForm;
import be.peerassistedlearningti.web.model.util.SessionAuth;
import com.mysema.query.types.Converters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Collection;
import java.util.stream.Collectors;

@Controller
public class ApplyController extends StudentController
{

    @Autowired
    private PALService service;

    @RequestMapping( value = "/apply", method = RequestMethod.GET )
    public ModelAndView applyTutor( Authentication auth, ModelMap model )
    {
        Student current = (Student) auth.getPrincipal();
        model.addAttribute( "tutorApply", new TutorApplyForm() );

        Collection<Course> courses = service.getAllCourses();

        Collection<Application> applications = service.getAllPendingApplications( current );
        applications.addAll( service.getAllApprovedApplications( current ) );

        courses.removeAll( applications.stream()
                .map( Application::getCourse )
                .collect( Collectors.toList() ) );

        model.addAttribute( "courses", courses );
        return new ModelAndView( "student/apply", model );
    }

    @RequestMapping( value = "/apply", method = RequestMethod.POST )
    public ModelAndView applyTutor( @Valid @ModelAttribute( "tutorApply" ) TutorApplyForm form, BindingResult result, ModelMap model )
    {
        if ( result.hasErrors() )
            return new ModelAndView( "student/apply", model );

        try
        {
            MultipartFile screenshot = form.getScreenshot();
            service.addApplication( new Application( SessionAuth.getStudent(), form.getCourse(), screenshot.getBytes() ) );
        } catch ( Exception e )
        {
            result.reject( "SaveFile.TutorApplyForm.screenshot" );
        }

        return new ModelAndView( "redirect:/apply" );
    }

}