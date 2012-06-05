package com.compsis.sigf.servlet;

import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.compsis.sigf.log.L;
import com.compsis.sigf.utils.UtilidadesGenericas;

/**
 * Servlet implementation class Status
 */
public class Status extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Status() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processa(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processa(request, response);
	}

	private void processa(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		if (cmd != null && cmd.equals("status")) {
			response.setContentType("text/html;charset=ISO-8859-1");
			PrintWriter out = response.getWriter();
			try {
				// System.err.println("-verificando...");
				out.print(L.STATUS_HTML);
			} finally {
				out.close();
			}
		} else if (cmd != null && cmd.equals("download")) {
			String script = (String) request.getSession()
					.getAttribute("script");
			if (script != null) {
				response.setContentType("text/plain");
				response.setHeader("Content-Disposition",
			                     "attachment;filename=script"+new java.util.Date().getTime()+".sql");
				/*
				 * header("Content-Type: plain/text"); header(
				 * "Content-Disposition: Attachment; filename=test.txt Content-Type: plain/text"
				 * ); header("Pragma: no-cache");
				 */
				ServletOutputStream out = response.getOutputStream();
				BufferedOutputStream bout = new BufferedOutputStream(out);
				final int bufferSize = 1024;
				int available  = -1;
				try {
					L.d("ServletDownload", "Script encontrado. Separando linhas.");
					String[] linhas = script.split(UtilidadesGenericas.LINE_BREAK);
					L.d("ServletDownload", "Iniciando escrita do arquivo no header por linhas.");
					for(String s : linhas){
						bout.write(s.concat(UtilidadesGenericas.LINE_BREAK).getBytes());
					}
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					bout.flush();
					bout.close();
					try{
						out.flush();
						out.close();
					}catch(Exception e){
						e.printStackTrace();
					}
					L.d("ServletDownload", "Escrita concluida");
				}
			} else {
				L.d("Servlet", "Script nao esta mais em sessao. Script e nulo!");
				String cid = request.getParameter("cid");
				String vid = request.getParameter("vid");
				String url = "script.htm?cid="+cid+"&vid="+vid+"&down=true";
				response.sendRedirect(url);
			}
		}
	}
}
