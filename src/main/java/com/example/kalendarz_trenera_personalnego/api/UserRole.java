package com.example.kalendarz_trenera_personalnego.api;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum UserRole {

    USER("user"),
    ADMIN("admin");

    private final String name;

    public static UserRole find(String name) {
        return valueOf(name);
    }

}
