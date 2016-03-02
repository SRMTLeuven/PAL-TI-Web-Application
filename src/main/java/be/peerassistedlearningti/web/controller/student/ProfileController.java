package be.peerassistedlearningti.web.controller.student;

import be.peerassistedlearningti.model.Lesson;
import be.peerassistedlearningti.model.Review;
import be.peerassistedlearningti.model.Student;
import be.peerassistedlearningti.service.PALService;
import be.peerassistedlearningti.web.model.util.SessionAuth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping( value = "/profile" )
public class ProfileController extends StudentController
{
    @Autowired
    private PALService service;

    @RequestMapping( value = "/reviews", method = RequestMethod.GET )
    public ModelAndView getReviews( @RequestParam( value = "offset", required = true ) int offset, @RequestParam( value = "limit", required = true ) int limit, ModelMap model )
    {
        Student current = SessionAuth.getStudent();

        List<Review> list = new ArrayList<>();

        for ( Lesson lesson : service.getPastBookings( current, offset, limit ) )
            list.add( service.getReviewsByStudentAndLesson( current, lesson ) );

        Collections.sort( list, ( o1, o2 ) -> o1.getLesson().getDate().compareTo( o2.getLesson().getDate() ) );

        return new ModelAndView( "student/fragment/review", "reviews", list );
    }

    @RequestMapping( method = RequestMethod.GET )
    public ModelAndView getProfile()
    {
        return new ModelAndView( "redirect:/profile/" + SessionAuth.getStudent().getProfileIdentifier() );
    }

}
