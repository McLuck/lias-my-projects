package com.compsis.sigf.servlet;

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

				try {
					out.println(script);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					out.close();
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
