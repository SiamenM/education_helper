package com.maskalenchyk.education_helper.entity;

public enum Disciple implements Entity {
    PROGRAMMING("Programming", "Программирование"),
    TECHNICAL("Technical disciples", "Технические дисциплины"),
    HUMANITIES("Humanities disciples", "Гуманитарные дисциплины"),
    BLUEPRINT("Blueprints", "Чертежи"),
    GENERAL("General education", "Общеобразовательные дисциплины");

    private String discipleNameEnglish;
    private String discipleNameRussian;

    Disciple(String discipleNameEnglish, String discipleNameRussian) {
        this.discipleNameEnglish = discipleNameEnglish;
        this.discipleNameRussian = discipleNameRussian;
    }

    public String getDiscipleNameEnglish() {
        return discipleNameEnglish;
    }

    public String getDiscipleNameRussian() {
        return discipleNameRussian;
    }
}
