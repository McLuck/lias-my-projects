package com.compsis.sigf.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.PistaDAO;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Praca;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
/**
 * Servlet implementation class JsonServlet
 */
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonServlet() {
        super();
    }
    
    private void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String cmd = request.getParameter("cmd");
    	Set<String> set = (Set<String>)request.getParameterMap().keySet();
    	for(String s : set){
    		System.out.print(s+"=");
    		System.out.println(request.getParameter(s)); 
    	}
    	
    	if(cmd!=null){
    		if(cmd.equals("listaPista")){
    			String pracaid = request.getParameter("pracaid");
    			PracaDAO pdao = (PracaDAO)AFactoryDao.getInstance(PracaDAO.class);
    			Praca p = pdao.obter(Integer.parseInt(pracaid));
    			JsonConfig config = new JsonConfig();
    			config.setJsonPropertyFilter(new PropertyFilter() {
    				public boolean apply(Object source, String name, Object value) {
    					if (!name.equals("praca") && !name.equals("concessionaria")
    							&& !name.equals("configuracao")
    							&& !name.equals("pracaMeiosPgto")
    							) {
    						return false;
    					}
    					return true;
    				}
    			});
    			
    			JSONArray jarr = JSONArray.fromObject(p, config);
    			jarr.set(0, "aaData");
    			String ii = jarr.toString();
    			
    			/*ii = ii.replace("[", "#[#");
    			ii = ii.replace("{", "[");
    			ii = ii.replace("#[#", "{");
    			ii = ii.replace("]", "#]#");
    			ii = ii.replace("}", "]");
    			ii = ii.replace("#]#", "]}");*/
    			
    			//System.out.println(ii);
    			//["aaData",
    			
    			
    			
    			ii = ii.replace("]", "]}");
    			ii = ii.replace("[\"aaData\",", "{\"aaData\":[");
    			
    			ii = ii.replace("null,", "");
    			ii = ii.replace("null", "");
    			
    			response.setContentType("text/html;charset=ISO-8859-1");
    			response.setContentType("application/json");
    			PrintWriter out = response.getWriter();
    			out.print(ii);
    			out.flush();
    			out.close();
    		}else if(cmd.equals("edit")){
    			int id = Integer.parseInt(request.getParameter("id"));
    			PistaDAO pdao = (PistaDAO)AFactoryDao.getInstance(PistaDAO.class);
    			Pista pista = pdao.obter(id);
    			/*pista.getPraca();*/
    			pista.setIdLocalizacao(Integer.parseInt(request.getParameter("idLocalizacao")));
    			pista.setTipo(Integer.parseInt(request.getParameter("tipo")));
    			pista.setSentido(request.getParameter("sentido"));
    			pista.setIpMaquina(request.getParameter("ipMaquina"));
    			pista.setNomeMaquina(request.getParameter("nomeMaquina"));
    			pdao.close();
    			
    			pdao.salvar(pista);
    			pdao.commit();
    			pdao.close();
    			pdao.clear();
    		}
    	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

}
