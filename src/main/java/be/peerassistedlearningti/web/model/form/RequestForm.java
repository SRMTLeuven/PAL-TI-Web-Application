package be.peerassistedlearningti.web.model.form;


import be.peerassistedlearningti.model.Course;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class RequestForm {

    @NotNull(message = "{NotNull.RequestForm.description}")
    @Size( min = 10, max = 300, message = "{Size.RequestForm.text}" )
    private String description;

    @Valid
    @NotNull(message = "{NotNull.RequestForm.course}")
    private Course course;

    public RequestForm() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

}