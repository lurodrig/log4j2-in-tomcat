package hello;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Controller
public class HelloWorldController {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();
    Logger logger = LogManager.getLogger(HelloWorldController.class);

    @GetMapping("/hello-world")
    @ResponseBody
    public Greeting sayHello(@RequestParam(name="name", required=false, defaultValue="Stranger") String name) {
	System.out.println("With swallowOutput=\"true\" this message should end up in the log and not in the console!!!");
        logger.trace("A TRACE Message");
        logger.debug("A DEBUG Message");
        logger.info("An INFO Message");
        logger.warn("A WARN Message");
        logger.error("An ERROR Message");
	java.util.logging.Logger.getLogger(HelloWorldController.class.getName()).info("Hello, JUL!!!");
        return new Greeting(counter.incrementAndGet(), String.format(template, name));
    }

}
