package be.peerassistedlearningti.web.controller.student;

import be.peerassistedlearningti.model.Lesson;
import be.peerassistedlearningti.model.Student;
import be.peerassistedlearningti.service.PALService;
import be.peerassistedlearningti.web.model.dto.CalendarDTO;
import be.peerassistedlearningti.web.model.util.SessionAuth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.util.stream.Collectors;

@Controller
@RequestMapping( value = "/calendar" )
public class CalendarController extends StudentController
{
    @Autowired
    PALService service;

    @RequestMapping( method = RequestMethod.GET )
    public ModelAndView getCalendar( ModelMap model )
    {
        return new ModelAndView( "student/calendar", model );
    }

    @ResponseBody
    @RequestMapping( value = "/events", method = RequestMethod.GET )
    public List<CalendarDTO> getCalendarEvents()
    {
        Student current = SessionAuth.getStudent();
        List<CalendarDTO> events = new ArrayList<>();
        events.addAll( service.getUpcomingBookings( current ).stream().map( lesson -> convert( lesson, "#428bca" ) ).collect( Collectors.toList() ) );
        if ( current.getTutor() != null )
        {
            events.addAll( service.getLessons( SessionAuth.getStudent().getTutor() ).stream().map( lesson -> convert( lesson, "#5cb85c" ) ).collect( Collectors.toList() ) );
        }
        return events;
    }

    private CalendarDTO convert( Lesson lesson, String color )
    {
        DateFormat dateFormat = new SimpleDateFormat( "YYYY-MM-dd HH:mm:SS" );
        CalendarDTO event = new CalendarDTO();
        event.setTitle( lesson.getName() );
        event.setStart( dateFormat.format( lesson.getDate() ) );
        event.setEnd( dateFormat.format( new Date( lesson.getDate().getTime() + lesson.getDuration() * 60 * 1000 ) ) );
        event.setColor( color );
        return event;
    }
}
