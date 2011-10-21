package com.compsis.sigf.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.LocalizacaoDAO;
import com.compsis.sigf.dao.PistaDAO;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Localizacao;
import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Praca;
import com.compsis.sigf.domain.PracaMeioPagamento;
import com.compsis.sigf.domain.Sentido;

public class PracaControllerCompleto implements Controller {
	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("ISO-8859-1");
		ModelAndView mav = new ModelAndView("formpraca");
		cid = request.getParameter("cid");
		mav.addObject("cid", cid);
		
		pracaid = request.getParameter("pracaid");
		if(pracaid!=null){
			mav.addObject("pracaid", pracaid);
		}
		localid = request.getParameter("localid");
		cmd = request.getParameter("cmd");
		dominio = request.getParameter("dominio");
		if(dominio!=null){
			if(dominio.equals("local")){
				tratarLocal(request);
			}else if(dominio.equals("pista")){
				tratarPista(request);
			}else if(dominio.equals("praca")){
				tratarPraca(request);
			}else if(dominio.equals("sentido")){
				tratarSentido(request);
			}
		}
		try{
			if(cid!=null&&!cid.isEmpty()){
				loadData();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		if(cmd!=null){
			if(cmd.equals("novo")){
				this.praca = new Praca();
				this.praca.setLocalizacoes(new ArrayList<Localizacao>());
				this.listaPistas = new ArrayList<Pista>();
				praca.setConcessionaria(conc);
				mav.addObject("isnovo", "novo");
			}else if(cmd.equals("novo2")){
				this.praca.setLocalizacoes(new ArrayList<Localizacao>());
				this.listaPistas = new ArrayList<Pista>();
			}
		}
		if(localizacoes==null||localizacoes.isEmpty()){
			mav.addObject("local", "novoLocal");
		}
		mav.addObject("pracas", listaPracas);
		mav.addObject("praca", praca);
		mav.addObject("pistas", listaPistas);	
		mav.addObject("locais", localizacoes);	
		
		mav.addObject("siglaS1", siglaS1);
		mav.addObject("siglaS2", siglaS2);
		mav.addObject("siglaS3", siglaS3);
		mav.addObject("tipospista", BASE.LISTAS.TIPOS_PISTAS);
		return mav;
	}
	public void tratarSentido(HttpServletRequest request) throws Exception{
		if(cmd!=null){
			if(cmd.equals("add")){
				String sigla = request.getParameter("sigla");
				String sentido = request.getParameter("sentido");
				if(localid==null || localid.isEmpty()){
					throw new Exception();
				}
				Sentido s = new Sentido();
				s.setSigla(sigla);
				s.setSentido(sentido);
				
				LocalizacaoDAO ldao = LocalizacaoDAO.getInstance();
				local = ldao.obter(Integer.parseInt(localid));
				s.setLocalizacao(local);
				local.getSentidos().add(s);
				ldao.salvar(local);
				ldao.commit();
				ldao.close();
				ldao.clear();
				//SALVAR NOVO SENTIDO NA LOCALIZACAO
			}else if(cmd.equals("del")){
				String sigla = request.getParameter("sigla");
				String sentido = request.getParameter("sentido");
				if(localid==null || localid.isEmpty()){
					throw new Exception();
				}
				Sentido s = new Sentido();
				s.setSigla(sigla);
				s.setSentido(sentido);
				
				LocalizacaoDAO ldao = LocalizacaoDAO.getInstance();
				local = ldao.obter(Integer.parseInt(localid));
				for(Sentido std : local.getSentidos()){
					if(std!=null){
						if(std.getSigla().equals(s.getSigla())){
							s = std;
							break;
						}
					}
				}
				ldao.close();
				ldao.clear();
				local.getSentidos().remove(s);
				ldao.salvar(local);
				ldao.commit();
				ldao.close();
				ldao.clear();
			}
		}
	}
	
	private void loadData(){
		PracaDAO prdao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);
		prdao.close();
		prdao.clear();
		ConcessionariaDAO cdao = (ConcessionariaDAO)AFactoryDao.getInstance(ConcessionariaDAO.class);
		conc = cdao.obter(Integer.parseInt(cid));
		
		listaPracas = prdao.getByConcessionaria(Integer.parseInt(cid));
		if(pracaid==null || pracaid.isEmpty() || (cmd!=null && cmd.equals("del") && dominio!=null && dominio.equals("praca"))){
			for(Praca p : conc.getPracas()){
				if(p != null){
					praca = p;
					break;
				}
			}
		}else{
			praca = prdao.obter(Integer.parseInt(pracaid));
		}
		listaPistas = new ArrayList<Pista>();
		if(praca==null){
			return;
		}
		localizacoes = new ArrayList<Localizacao>();
		for(Localizacao loc : praca.getLocalizacoes()){
			if(loc!=null){
				localizacoes.add(loc);
				for(Pista pt : loc.getPistas()){
					if(pt!=null){
						listaPistas.add(pt);
					}
				}
			}
		}
	}

	private void tratarPraca(HttpServletRequest request) {
		PracaDAO prdao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);
		if (cmd.equals("del")) {
			praca = prdao.obter(Integer.parseInt(pracaid));
			prdao.close();
			prdao.clear();
			prdao.Deletar(praca);
			prdao.commit();
			prdao.close();
			prdao.clear();
		} else if (cmd.equals("alter")) {
			praca = prdao.obter(Integer.parseInt(pracaid));
			praca.setCnpj(request.getParameter("cnpj"));
			praca.setDescricao(request.getParameter("descricao"));
			praca.setDistanciaCCA(request.getParameter("distanciaCCA"));
			praca.setNome(request.getParameter("nome"));
			String numero = request.getParameter("numeroPraca");
			try {
				praca.setNumeroPraca(numero != null && !numero.isEmpty() ? Integer
						.parseInt(numero) : 0);
			} catch (Exception e) {
				// Caso de erro, mantem o mesmo numero salvo
			}
			praca.setTrafegoEstimado(request.getParameter("trafegoEstimado"));
			prdao.salvar(praca);
		} else if (cmd.equals("novo2")) {
			praca = new Praca();
			pracaid = request.getParameter("id");
			int id = 0;
			if(pracaid!=null){
				try{
					id = Integer.parseInt(pracaid);
				}catch(Exception e){}
			}
			if(id!=0){
				praca = prdao.obter(id);
			}else{
				praca.setLocalizacoes(new ArrayList<Localizacao>());
				praca.setPracaMeiosPgto(new ArrayList<PracaMeioPagamento>());
				praca.setLocalizacoes(new ArrayList<Localizacao>());
			}
			praca.setCnpj(request.getParameter("cnpj"));
			praca.setDescricao(request.getParameter("descricao"));
			praca.setDistanciaCCA(request.getParameter("distanciaCCA"));
			praca.setNome(request.getParameter("nome"));
			String numero = request.getParameter("numeroPraca");
			try {
				praca.setNumeroPraca(numero != null && !numero.isEmpty() ? Integer
						.parseInt(numero) : 0);
			} catch (Exception e) {
				// Caso de erro, mantem o mesmo numero salvo
			}
			praca.setTrafegoEstimado(request.getParameter("trafegoEstimado"));
			
			if (cid != null && !cid.isEmpty()) {
				ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao
						.getInstance(ConcessionariaDAO.class);
				conc = cdao.obter(Integer.parseInt(cid));
				praca.setConcessionaria(conc);
				prdao.salvar(praca);
			}else if(conc!=null){
				praca.setConcessionaria(conc);
				prdao.salvar(praca);
			}else{
				prdao.close();
				prdao.clear();
				return;
			}
		}
		prdao.commit();
		prdao.close();
		prdao.clear();
	}

	private void tratarPista(HttpServletRequest request) {
		PistaDAO ptdao = (PistaDAO) AFactoryDao.getInstance(PistaDAO.class);
		if (cmd.equals("del")) {
			pista = ptdao.obter(Integer.parseInt(request.getParameter("pistaid")));
			ptdao.close();
			ptdao.clear();
			ptdao.Deletar(pista);
			ptdao.commit();
			ptdao.close();
			ptdao.clear();
		} else if (cmd.equals("alter")) {
			pista = ptdao.obter(Integer.parseInt(request.getParameter("pistaid")));
			String numero = request.getParameter("cod_pst");
			if (numero != null && !numero.isEmpty()) {
				try {
					pista.setNumeroPista(Integer.parseInt(numero));
				} catch (Exception e) {
					// caso de erro, mantem o mesmo numero salvo
				}
			}
			pista.setIpMaquina(request.getParameter("ipMaquina"));
			pista.setNomeMaquina(request.getParameter("nomeMaquina"));
			pista.setSentido(request.getParameter("sentido_pst"));
			pista.setTipo(Integer.parseInt(request.getParameter("tipo")));
			if(local!=null){
				pista.setLocalizacao(local);
			}else if(localid!=null && !localid.isEmpty()){
				LocalizacaoDAO ldao = (LocalizacaoDAO)AFactoryDao.getInstance(LocalizacaoDAO.class);
				local = (Localizacao)ldao.obter(Integer.parseInt(localid));
				pista.setLocalizacao(local);
			}else{
				ptdao.close();
				ptdao.clear();
				return;
			}
			ptdao.salvar(pista);
		}else if(cmd.equals("novo4")){
			pista = new Pista();
			String numero = request.getParameter("cod_pst");
			if (numero != null && !numero.isEmpty()) {
				try {
					pista.setNumeroPista(Integer.parseInt(numero));
				} catch (Exception e) {
					// caso de erro, mantem o mesmo numero salvo
				}
			}
			pista.setIpMaquina(request.getParameter("ipMaquina"));
			pista.setNomeMaquina(request.getParameter("nomeMaquina"));
			pista.setSentido(request.getParameter("sentido_pst"));
			pista.setTipo(Integer.parseInt(request.getParameter("tipo")));
			
			String localid = request.getParameter("localid");
			if(localid!=null && !localid.isEmpty()){
				try{
					local = LocalizacaoDAO.getInstance().obter(Integer.parseInt(localid));
				}catch(Exception e){
				}
			}
			//ptdao.salvar(pista);
			if(local!=null){
				pista.setLocalizacao(local);
			}else if(localid!=null && !localid.isEmpty()){
				LocalizacaoDAO ldao = (LocalizacaoDAO)AFactoryDao.getInstance(LocalizacaoDAO.class);
				local = (Localizacao)ldao.obter(Integer.parseInt(localid));
				pista.setLocalizacao(local);
			}else{
				ptdao.close();
				ptdao.clear();
				return;
			}
			ptdao.salvar(pista);
		}
		ptdao.commit();
		ptdao.close();
		ptdao.clear();
	}

	private void tratarLocal(HttpServletRequest request) {
		LocalizacaoDAO ldao = (LocalizacaoDAO) AFactoryDao
				.getInstance(LocalizacaoDAO.class); 
		if (cmd.equals("del")) {
			local = ldao.obter(Integer.parseInt(localid));
			praca = local.getPraca();
			ldao.close();
			ldao.clear();
			ldao.Deletar(local);
		} else if (cmd.equals("alter")) {
			local = ldao.obter(Integer.parseInt(localid));
			String numero = request.getParameter("cod_local");
			if (numero != null && !numero.isEmpty()) {
				try {
					local.setNumero(Integer.parseInt(numero));
				} catch (Exception e) {
					// Em caso de erro, continua o mesmo numero
				}
			}
			
			local.getSentidos().clear();
			
			String[] siglas = request.getParameterValues("sigla");
			if(siglas!=null){
				for (String string : siglas) {
					Sentido s = new Sentido();
					s.setSigla(string);
					s.setSentido(request.getParameter(string));
					s.setLocalizacao(local);
					local.getSentidos().add(s);
				}
			}
			
			local.setDescricao(request.getParameter("desc_loc"));
			ldao.salvar(local);
		} else if(cmd.equals("novo3")){
			local = new Localizacao();
			PracaDAO prdao = (PracaDAO)AFactoryDao.getInstance(PracaDAO.class);
			praca = prdao.obter(Integer.parseInt(pracaid));
			local.setPraca(praca);
			
			local.setSentidos(new ArrayList<Sentido>());
			
			String[] siglas = request.getParameterValues("sigla");
			if(siglas!=null){
				for (String string : siglas) {
					Sentido s = new Sentido();
					s.setSigla(string);
					s.setLocalizacao(local);
					s.setSentido(request.getParameter(string));
					local.getSentidos().add(s);
				}
			}
			
			local.setDescricao(request.getParameter("desc_loc"));
			ldao.salvar(local);
		}
		ldao.commit();
		ldao.close();
		ldao.clear();
	}

	private String dominio;
	private Praca praca;
	private Localizacao local;
	private Pista pista;
	private Concessionaria conc;
	private String cid;
	private String localid;
	private String pracaid;
	private String cmd;
	private List<Praca> listaPracas;
	private List<Pista> listaPistas;
	private List<Localizacao> localizacoes;
	private String siglaS1, siglaS2, siglaS3;
}
