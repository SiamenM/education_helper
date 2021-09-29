package com.maskalenchyk.education_helper.entity;

public class CommentForFile implements Entity {

    private Long id;
    private String comment;
    private  Byte grade;
    private FinishedFile commentedFile;
}
