package be.peerassistedlearningti.web.model.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Represents a calendar event
 */
public class CalendarDTO
{
    @JsonProperty( index = 0, value = "title" )
    private String title;

    @JsonProperty( index = 1, value = "description" )
    private String description;

    @JsonProperty( index = 2, value = "start" )
    private String start;

    @JsonProperty( index = 3, value = "end" )
    private String end;

    @JsonProperty( index = 4, value = "color" )
    private String color;

    public CalendarDTO() {}

    public void setTitle( String title )
    {
        this.title = title;
    }

    public void setDescription( String description )
    {
        this.description = description;
    }

    public void setStart( String start )
    {
        this.start = start;
    }

    public void setEnd( String end )
    {
        this.end = end;
    }

    public void setColor( String color )
    {
        this.color = color;
    }

    public String getStart() { return start; }

    public String getTitle()
    {
        return title;
    }

    public String getDescription()
    {
        return description;
    }

    public String getColor()
    {
        return color;
    }

    public String getEnd()
    {
        return end;
    }
}
