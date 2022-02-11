package com.maskalenchyk.education_helper.entity;

import java.util.Optional;
import java.util.stream.Stream;

public enum UserRole implements Entity {
    ADMIN,
    AUTHOR,
    USER;

    public static Optional<UserRole> of(String name) {
        return Stream.of(UserRole.values()).
                filter(userRole -> userRole.name().equalsIgnoreCase(name)).
                findFirst();
    }
}
