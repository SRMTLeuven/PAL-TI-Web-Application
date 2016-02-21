package be.peerassistedlearningti.web.controller.admin;

import be.peerassistedlearningti.model.Student;
import be.peerassistedlearningti.model.UserType;
import be.peerassistedlearningti.service.PALService;
import be.peerassistedlearningti.web.model.form.StudentForm;
import be.peerassistedlearningti.web.model.form.StudentUpdateForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class StudentCRUDController extends AdminController
{
    @Autowired
    private PALService service;

    private ModelMap fillModel( ModelMap model )
    {
        if ( model.get( "student" ) == null )
            model.addAttribute( "student", new StudentForm() );
        if ( model.get( "updateStudent" ) == null )
            model.addAttribute( "updateStudent", new StudentUpdateForm() );
        if ( model.get( "updateStudent" ) == null )
            model.addAttribute( "userTypes", UserType.values() );
        if ( model.get( "students" ) == null )
            model.addAttribute( "students", service.getAllStudents() );
        return model;
    }

    @RequestMapping( value = "/students", method = RequestMethod.GET )
    public ModelAndView getStudentOverviewPage( ModelMap model )
    {
        return new ModelAndView( "admin/students", fillModel( model ) );
    }

    @RequestMapping( value = "/students", method = RequestMethod.POST )
    public ModelAndView addStudentPage( @Valid @ModelAttribute( "student" ) StudentForm studentForm, BindingResult result, ModelMap model )
    {
        if ( result.hasErrors() )
            return new ModelAndView( "admin/students", fillModel( model ) );

        service.addStudent( new Student( studentForm.getName(), studentForm.getPassword(), studentForm.getEmail(), studentForm.getType() ) );

        return new ModelAndView( "redirect:/admin/students" );
    }

    @RequestMapping( value = "/students/update", method = RequestMethod.POST )
    public ModelAndView updateStudent( @Valid @ModelAttribute( "updateStudent" ) StudentUpdateForm form, BindingResult result, ModelMap model )
    {
        if ( result.hasErrors() )
            return new ModelAndView( "admin/students", fillModel( model ) );

        Integer id = form.getId();

        if ( id == null )
            return new ModelAndView( "redirect:/admin/students" );

        Student s = service.getStudentById( id );

        if ( s == null )
            return new ModelAndView( "redirect:/admin/students" );

        String email = form.getEmail();
        String password = form.getPassword();
        UserType type = form.getType();

        if ( email != null && !email.isEmpty() )
            s.setEmail( email );
        if ( password != null && !password.isEmpty() )
            s.setPassword( password );
        if ( type != null )
            s.setType( type );

        service.updateStudent( s );
        return new ModelAndView( "redirect:/admin/students", fillModel( model ) );
    }

    @RequestMapping( value = "/students/remove/{id}", method = RequestMethod.POST )
    public String removeStudent( @PathVariable( value = "id" ) int id )
    {
        Student s = service.getStudentById( id );
        service.removeStudent( s );
        return "redirect:/admin/students";
    }
}
