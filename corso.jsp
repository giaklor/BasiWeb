<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="did.*"%>

<%
	CorsoBean c = (CorsoBean) request.getAttribute("corso");
	if (c == null)
		return;
		
	Vector<IscrizioneBean> iscritti = (Vector<IscrizioneBean>)request.getAttribute("iscritti");
	Vector<MaterialeBean> materiale = (Vector<MaterialeBean>)request.getAttribute("materiale");
	Vector<IstruttoreBean> istruttoriAux = (Vector<IstruttoreBean>)request.getAttribute("istruttoriAux");
%>

<html>
   <head>
      <link rel="stylesheet" type="text/css" href="style.css"/>
      <title>Palestra Delta - <%= c.getNome() %></title>
   </head>
   <body>

		<table cellspacing = "35%">
			<tr>
				<td>
					<h3 class="smallheaderstyle"> <%= c.getNome() %> </h3>
				</td>
			</tr>
			<tr>
				<td>
					<%= c.getDescrizione() %>
				</td>
			</tr>
			<tr>
				<td>
					Istruttore responsabile: <%= c.getIstruttoreResponsabile().getNome() %> <%= c.getIstruttoreResponsabile().getCognome() %> 
				</td>
			</tr>
<%
			if (istruttoriAux.size() > 0) {
			
%>
				<tr>
					<td>
						Altri istruttori:
						<ul>
<%
							for (IstruttoreBean i : istruttoriAux) {
%>
								<li> <%= i.getNome() %>  <%= i.getCognome() %> </li>
<%
							}
%>
						</ul>
					</td>
				</tr>
<%
			}
%>
			
			<tr>
				<td>
					Periodo di svolgimento: <%= c.getDataInizio() %> - <%= c.getDataFine() %>
				</td>
			</tr>
			<tr>
				<td>
					Numero di iscritti: <%= iscritti.size() %>
				</td>
			</tr>
			
		</table>
		
		<table cellspacing = "35%">
			<tr>
				<th>Nome Iscritto</th>
				<th>Data di iscrizione</th>
			</tr>
<%
		for (IscrizioneBean i : iscritti) {
%>		
			<tr>
				<td>
					<%= i.getIscritto().getNome() %> <%= i.getIscritto().getCognome() %>
				</td>
				<td>
					<%= i.getDataIscrizione() %>
				</td>
				
			</tr>
<% }
%>
		</table>
		
		<br>


		
<%
		if (materiale.size() == 0) {
%>
		<table cellspacing = "35%">
			<tr><td>Non &egrave presente materiale didattico.</td></tr>
		</table>
<%
		}
		else {
%>
			Materiale didattico: <br>

			<table>			
				<tr>
					<th>Nome file</th>
					<th>Tipo contenuto</th>
					<th>Formato</th>
				</tr>
				
<%
				for (MaterialeBean m : materiale) {
					String linkMateriale = "\"" + InetAddress.getLocalHost().getHostAddress() + ":8080/Palestra/materiali" +  m.getPercorso() + "\"";
%>
					<tr>
						<td> <a href= <%= linkMateriale %> <%= m.getNome() %> </a> </td>
						<td> <%= m.getTipo() %> </td>
						<td> <%= m.getFormato() %> </td>
					</tr>
<%
				}
%>
			</table>
<%
		}
%>
   </body>
</html>
