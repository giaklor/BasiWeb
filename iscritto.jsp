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

		<table class="tablestyle">
			<tr>
				<td>
					Benvenuto, accesso eseguito come:<br>
					<%= iscritto.getNome() %> <%= iscritto.getCognome() %> - <%= iscritto.getDataNascita() %>
				</td>
			</tr>
		
<%
		if (corsi.size() > 0) {
%>
			<tr>
				<td>
			I tuoi corsi:
			<ul>
<%
			for (CorsoBean c : corsi) {
				
				Vector<MaterialeBean> materialeCorso = materiali.get(c.getIdCorso());			
%>
				<li>
				<%= c.getNome() %>
				
				<ul>
<%
				for (MaterialeBean m : materialeCorso) {
					String linkMateriale = "\"" + "/Palestra/materiali/" +  m.getPercorso() + "\"";
%>
					<li> <a class="linkstyle" href= <%= linkMateriale %>> <%= m.getNome() %> </a> </li>
<%
				}
%>
				</ul>
				</li>
				</td>
			</tr>
<%
			}
%>
			</ul>
<%
		}
		else {
%>
			<tr><td>
			Non sei iscritto ad alcun corso.
			</td></tr>
<%
		}
%>
		</table>
   </body>
</html>
