<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="did.*"%>

<%
	IscrittoBean iscritto = (IscrittoBean) request.getAttribute("iscritto");
	if (iscritto == null)
		return;
		
	Vector<CorsoBean> corsi = (Vector<CorsoBean>)request.getAttribute("corsiIscritto");
	Map<Integer, Vector<MaterialeBean>> materiali = (Map<Integer, Vector<MaterialeBean>>) request.getAttribute("materiali");
%>

<html>
   <head>
      <link rel="stylesheet" type="text/css" href="style.css"/>
      <title>Palestra Delta - Profilo di <%= iscritto.getNome() %> <%= iscritto.getCognome() %> </title>
   </head>
   <body>

		<table cellspacing = "35%">
			<tr>
				<td colspan="2">
					Benvenuto, accesso eseguito come:<br>
					<%= iscritto.getNome() %> <%= iscritto.getCognome() %> - <%= iscritto.getDataNascita() %>
				</td>
			</tr>
		</table>
		
		I tuoi corsi:
			
<%
			for (CorsoBean c : corsi) {
				
				Vector<MaterialeBean> materialeCorso = materiali.get(c.getIdCorso());			
%>
				<%= c.getNome() %>
				
				<ul>
<%
				for (MaterialeBean m : materialeCorso) {
					String linkMateriale = "\"" + InetAddress.getLocalHost().getHostAddress() + ":8080/Palestra/" +  m.getPercorso() + "\"";
%>
					<li> <a href= <%= linkMateriale %> <%= m.getNome() %> </a> </li>
<%
				}
%>
				</ul>
<%
			}
%>
		
   </body>
</html>
