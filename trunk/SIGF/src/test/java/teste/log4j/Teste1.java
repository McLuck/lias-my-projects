package teste.log4j;

import java.io.IOException;

import org.apache.log4j.Appender;
import org.apache.log4j.FileAppender;
import org.apache.log4j.Logger;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.PatternLayout;

public class Teste1 {
	static Logger logger = Logger.getLogger(Teste1.class);

	public static void main(String...args) throws IOException{
		BasicConfigurator.configure();
		Appender apend = new FileAppender(new PatternLayout(PatternLayout.TTCC_CONVERSION_PATTERN), "lof.log");
		logger.addAppender(apend);
		
		try {  
            throw new Exception("Loga erro no Log4J!");  
        } catch (Exception e) {  
            logger.error("Oops, deu erro: " + e.getMessage());  
        }  
		
		logger.debug("Debugandooo");
		logger.info("Informando");
		logger.fatal("Fatal");		
	}
}
