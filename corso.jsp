<%@page import="java.util.*"%>
<%@page import="did.*"%>

<%
	CorsoBean c = (CorsoBean) request.getAttribute("corso");
	if (c == null)
		return;
		
	Vector<IscrizioneBean> iscritti = (Vector<IscrizioneBean>)request.getAttribute("iscritti");
	Vector<MaterialeBean> materiale = (Vector<MaterialeBean>)request.getAttribute("materiale");
%>

<html>
   <head>
      <link rel="stylesheet" type="text/css" href="style.css"/>
      <title>Palestra Delta - <%= c.getNome() %></title>
   </head>
   <body>

		<table cellspacing = "35%">
			<tr>
				<td colspan="2">
					<h3 class="smallheaderstyle"> <%= c.getNome() %> </h3>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<%= c.getDescrizione() %>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					Istruttore responsabile: <%= c.getIstruttoreResponsabile().getNome() %> <%= c.getIstruttoreResponsabile().getCognome() %> 
				</td>
			</tr>
		</table>
		
		<br>
		
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
   </body>
</html>
