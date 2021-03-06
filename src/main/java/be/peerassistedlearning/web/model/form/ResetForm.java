package be.peerassistedlearning.web.model.form;

import be.peerassistedlearning.common.model.validation.FieldMatch;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;

@FieldMatch( first = "password", second = "repeatPassword", message = "{FieldMatch.ResetForm.password.repeatPassword}" )
public class ResetForm{

    @SafeHtml
    @NotEmpty( message = "{NotEmpty.ResetForm.password}" )
    private String password;

    @SafeHtml
    @NotEmpty( message = "{NotEmpty.ResetForm.repeatPassword}" )
    private String repeatPassword;

    public ResetForm(){
    }

    public String getPassword(){
        return password;
    }

    public void setPassword( String password ){
        this.password = password;
    }

    public String getRepeatPassword(){
        return repeatPassword;
    }

    public void setRepeatPassword( String repeatPassword ){
        this.repeatPassword = repeatPassword;
    }

}
