package com.maskalenchyk.education_helper.entity;

import java.math.BigDecimal;
import java.util.List;

public class FinishedFiles implements Entity {

    private Long id;
    private String fileName;
    private BigDecimal filePrice;
    private String descriptionFile;
    private Long addFile;
    private UserAccount author;
    private TypeOfPaper typeOfPaper;
    private Disciple disciple;
    private List<CommentForFile> commentForFileList;
}
