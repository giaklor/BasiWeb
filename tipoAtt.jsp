<%@page import="java.util.*"%>
<%@page import="did.*"%>

<%
	TipoAttBean t = (TipoAttBean) request.getAttribute("tipo");
	if (t == null)
		return;
		
	Vector<CorsoBean> corsi = (Vector<CorsoBean>)request.getAttribute("corsiTipo");
%>

<html>
   <head>
      <link rel="stylesheet" type="text/css" href="style.css"/>
      <title>Palestra Delta - <%= t.getDenominazione() %> </title>
   </head>
   <body>

		<table class="tablestyle">
			<tr>
				<td>
					<h3 class="smallheaderstyle"> <%= t.getDenominazione() %> </h3>
				</td>
			</tr>
			<tr>
				<td>
					<%=  t.getDescrizione() %>
				</td>
			</tr>
		</table>
		
		<br>
		
		<table class="tablestyle">
			<tr>
				<th>Codice</th>
				<th>Nome</th>
				<th>Istruttore responsabile</th>
				<th>Periodo di svolgimento</th>
			</tr>
<%
	for (CorsoBean c : corsi) {
			String linkCorso = "\"main?ps=corso&idCorso=" + c.getIdCorso() + "\"";
			IstruttoreBean istruttoreResp = c.getIstruttoreResponsabile();
%>		
			<tr>
				<td>
					<a class="linkstyle" href=<%= linkCorso %>> <%= c.getIdCorso() %> </a></b>
				</td>
				<td>
					<%= c.getNome() %>
				</td>
				<td>
					<%= istruttoreResp.getNome() %> <%= istruttoreResp.getCognome() %>
				</td>
				<td>
					<%= c.getDataInizio() %> - <%= c.getDataFine() %>
				</td>
				
			</tr>
<% }
%>
		</table>
   </body>
</html>
