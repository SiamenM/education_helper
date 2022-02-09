package com.maskalenchyk.education_helper.entity;

public enum UserRole implements Entity {
    ADMIN (++UserRole.idCounter,"administrator", "администратор"),
    AUTHOR (++UserRole.idCounter,"author", "автор"),
    USER (++UserRole.idCounter,"user", "пользователь");

    private static Integer idCounter = 0;
    private Integer id;
    private String englishName;
    private String russianName;

    UserRole(Integer id, String englishName, String russianName) {
        this.id = id;
        this.englishName = englishName;
        this.russianName = russianName;
    }

    public Integer getId() {
        return id;
    }

    public String getEnglishName() {
        return englishName;
    }

    public String getRussianName() {
        return russianName;
    }
}
