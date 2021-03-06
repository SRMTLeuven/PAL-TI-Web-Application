package be.peerassistedlearning.web.model.util;

import be.peerassistedlearning.model.Lesson;
import be.peerassistedlearning.model.Review;

public class LessonReviewWrapper implements Comparable<LessonReviewWrapper>{

    private Lesson lesson;
    private Review review;


    public LessonReviewWrapper( Lesson lesson ){
        this.lesson = lesson;
    }

    public LessonReviewWrapper( Lesson lesson, Review review ){
        this.lesson = lesson;
        this.review = review;
    }

    public Lesson getLesson(){
        return lesson;
    }

    public void setLesson( Lesson lesson ){
        this.lesson = lesson;
    }

    public Review getReview(){
        return review;
    }

    public void setReview( Review review ){
        this.review = review;
    }

    @Override
    public int compareTo( LessonReviewWrapper o ){
        return o.lesson.getDate().compareTo( lesson.getDate() );
    }
}
