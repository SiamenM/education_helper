package com.maskalenchyk.education_helper.entity;

public enum TypeOfPaper {
    COURSEWORK("Coursework", "Курсовая работа"),
    GRADUATE_WORK("Graduate work", "Дипломная работа"),
    CONTROL_WORK("Control work", "Контрольная работа"),
    PRACTICE_REPORT("Practice report", "Отчёт по практике"),
    BLUEPRINT("Blueprint", "Чертёж"),
    Program("Program", "Программа");

    private String nameTypeEnglish;
    private String nameTypeRussian;

    TypeOfPaper(String nameTypeEnglish, String nameTypeRussian) {
        this.nameTypeEnglish = nameTypeEnglish;
        this.nameTypeRussian = nameTypeRussian;
    }

    public String getNameTypeEnglish() {
        return nameTypeEnglish;
    }

    public String getNameTypeRussian() {
        return nameTypeRussian;
    }
}
