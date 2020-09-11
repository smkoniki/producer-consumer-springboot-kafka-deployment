package com.ibm.phytel.controller;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.web.bind.annotation.RestController;


@RestController
public class OutreachMqCommreqDatasvcController {

	
		private KafkaTemplate<String, String> template;
	    private List<String> messages = new CopyOnWriteArrayList<>();
	   

	    public OutreachMqCommreqDatasvcController(KafkaTemplate<String, String> template) {
	        this.template= template;
	    }

	    @KafkaListener(topics = "${listener.topic}")
	    public void listen(ConsumerRecord<String, String> cr) throws Exception {
	        messages.add(cr.value());
	    }

	    @GetMapping("communicationRequest")
	    public String readMessages() throws Exception {
	        String result = messages.toString();
			
			  ObjectMapper jsonParser = new ObjectMapper();
			  JsonNode jsonnode = jsonParser.readTree(result); 
			  String data = jsonnode.toPrettyString();
			  System.out.println("data reading from topic"+data);
	        return data;
	       
	    }

}
