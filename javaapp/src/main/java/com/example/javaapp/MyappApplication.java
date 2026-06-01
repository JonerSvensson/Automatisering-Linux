package com.example.javaapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class MyappApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyappApplication.class, args);
    }

    @GetMapping("/")
    public String home() {
        return """
                <html>
                <body style="font-family: Arial; text-align: center; margin-top: 100px;">
                    <h1>JavaApp</h1>
                    <p>Test av deploy</p>
                </body>
                </html>
                """;
    }
}
