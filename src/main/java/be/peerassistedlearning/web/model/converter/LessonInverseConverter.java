package be.peerassistedlearning.web.model.converter;

import be.peerassistedlearning.model.Lesson;
import org.springframework.core.convert.converter.Converter;

/**
 * Converts a Lesson into the matching String
 */
public class LessonInverseConverter implements Converter<Lesson, String>{
    public String convert( Lesson lesson ){
        try{
            return lesson.getId()
                    .toString();
        }catch( Exception e ){
            return null;
        }
    }
}
