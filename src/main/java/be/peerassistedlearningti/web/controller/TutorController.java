package be.peerassistedlearningti.web.controller;

import be.peerassistedlearningti.web.model.TutorForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

public class TutorController {
    @Autowired
    private PALService service;

    @RequestMapping( value = "/{id}", method = RequestMethod.GET )
    public ModelAndView getTutorDetailPage(@PathVariable( value = "id" ) int id, ModelMap model )
    {
        return new ModelAndView( "tutor_add", "tutor", service.getTutorById( id ) );
    }

    @RequestMapping( value = "/add", method = RequestMethod.GET )
    public ModelAndView getTutorAddPage()
    {
        return new ModelAndView( "tutor_add", "tutor", new TutorForm() );
    }

    @RequestMapping( value = "/remove/{id}", method = RequestMethod.POST )
    public String removeTutor( @PathVariable( value = "id" ) int id )
    {
        Tutor c = service.getTutorById( id );
        service.removeTutor( c );
        return "redirect:/tutor/overview";
    }

    @RequestMapping( value = "/add", method = RequestMethod.POST )
    public ModelAndView addTutor(@Valid @ModelAttribute( "tutor" ) TutorForm tutorForm, BindingResult result )
    {
        if ( result.hasErrors() )
            return new ModelAndView( "tutor_add" );

        /*TODO authenticated student
        service.addTutor( new Tutor( tutorForm.getCourse(), () ) );
        */

        return new ModelAndView( "redirect:/tutor/overview" );
    }
}