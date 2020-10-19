package com.example.kafkatest.app.controllers;

import com.example.kafkatest.app.services.Producer;
import org.springframework.web.bind.annotation.*;

@RestController
public class KafkaRestController {

    private final Producer producer;
    public KafkaRestController(Producer producer) {
        this.producer = producer;
    }

    @PostMapping("/send")
    public String sendMessage(@RequestBody String message){
        producer.sendMessage(message);
        return "Message send";
    }
}
