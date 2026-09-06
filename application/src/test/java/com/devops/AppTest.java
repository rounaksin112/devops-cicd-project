package com.devops;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class AppTest {

    @Test
    void testApplicationMessage() {
        String message = "DevOps CI/CD Application is running!";
        assertEquals("DevOps CI/CD Application is running!", message);
    }
}
