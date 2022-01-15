package com.maskalenchyk.education_helper.entity;

import java.io.InputStream;
import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

public class FinishedFile implements Entity {

    private Long id;
    private String fileName;
    private InputStream file;
    private BigDecimal filePrice;
    private String description;
    private Long addFileDate;
    private Disciple disciple;
    private TypeOfPaper typeOfPaper;
    private UserAccount author;
    private Boolean isAvailable;
    private List<CommentForFile> commentsForFiles;

    public Boolean getAvailable() {
        return isAvailable;
    }

    public void setAvailable(Boolean available) {
        isAvailable = available;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public InputStream getFile() {
        return file;
    }

    public void setFile(InputStream file) {
        this.file = file;
    }

    public BigDecimal getFilePrice() {
        return filePrice;
    }

    public void setFilePrice(BigDecimal filePrice) {
        this.filePrice = filePrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getAddFileDate() {
        return addFileDate;
    }

    public void setAddFileDate(Long addFileDate) {
        this.addFileDate = addFileDate;
    }

    public Disciple getDisciple() {
        return disciple;
    }

    public void setDisciple(Disciple disciple) {
        this.disciple = disciple;
    }

    public TypeOfPaper getTypeOfPaper() {
        return typeOfPaper;
    }

    public void setTypeOfPaper(TypeOfPaper typeOfPaper) {
        this.typeOfPaper = typeOfPaper;
    }

    public UserAccount getAuthor() {
        return author;
    }

    public void setAuthor(UserAccount author) {
        this.author = author;
    }

    public List<CommentForFile> getCommentsForFiles() {
        return commentsForFiles;
    }

    public void setCommentsForFiles(List<CommentForFile> commentsForFiles) {
        this.commentsForFiles = commentsForFiles;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FinishedFile that = (FinishedFile) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(fileName, that.fileName) &&
                Objects.equals(filePrice, that.filePrice) &&
                Objects.equals(description, that.description) &&
                Objects.equals(addFileDate, that.addFileDate) &&
                disciple == that.disciple &&
                typeOfPaper == that.typeOfPaper;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, fileName, filePrice, description, addFileDate, disciple, typeOfPaper);
    }
}
