package com.compsis.sigf.control;

import java.net.URLDecoder;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.compsis.sigf.domain.Tabela;

public class TesteController extends SimpleFormController{
	
	public TesteController(){
		setCommandClass(Tabela.class);
		setCommandName("tbl");
	}
	private Tabela tbl;
	public Tabela getTbl() {
		return tbl;
	}
	public void setTbl(Tabela tbl) {
		this.tbl = tbl;
	}
	public ModelAndView onSubmit(Object command){
		tbl = (Tabela)command;
		System.out.println(tbl.getNome());
		ModelAndView mav = new ModelAndView("frames/success2");
		mav.addObject("msg", tbl.getNome()+"  -  "+tbl.getOrdem());
		return mav;
	}
}
