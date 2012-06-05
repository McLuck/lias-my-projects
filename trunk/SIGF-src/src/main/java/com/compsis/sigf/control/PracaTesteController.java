package com.compsis.sigf.control;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.compsis.sigf.domain.Praca;

public class PracaTesteController  extends SimpleFormController{
	
	public PracaTesteController(){
        setCommandClass(Praca.class);
        setCommandName("praca");
    }
	private Praca praca;
	public Praca getPraca() {
		return praca;
	}
	public void setPraca(Praca praca) {
		this.praca = praca;
	}
	protected ModelAndView onSubmit(Object command) throws Exception {
		praca = (Praca)command;
		System.out.println(praca.getNome());
		
		return new ModelAndView("frames/success");
	}
	
}
