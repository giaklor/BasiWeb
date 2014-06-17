<%@page import="java.util.*"%>
<%@page import="did.*"%>

<html>
   <head>
      <link rel="stylesheet" type="text/css" href="style.css"/>
      <title>Palestra Delta</title>
   </head>
   <body>
      <h1 class="headerstyle">Palestra Delta</h1>
		<h2 align="center" class="smallheaderstyle"><i>Wellness - fitness center</i></h2>
		<table cellspacing = "35%">
			<tr>
				<td colspan="2">
					Palestra Delta si sviluppa su 2 piani per una superficie totale coperta di 3.500 mq. e ospita una molteplicit&agrave di attivit&agrave e servizi focalizzati al mantenimento e miglioramento della qualit&agrave della vita: dal movimento fisico alla diagnosi e cura medico/riabilitativa, dal piacere di un'alimentazione sana al supporto per i genitori con aree dedicate ai bambini, dalla Piscina alla SPA.
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<h3 class="smallheaderstyle">I nostri corsi</h3>
				</td>
			</tr>
<%
	Vector<TipoAttBean> tipi = (Vector<TipoAttBean>)request.getAttribute("tipi");
	for (TipoAttBean t : tipi) {
			String linkTipo = "\"main?ps=tipo&den=" + t.getDenominazione() + "\"";
%>		
			<tr>
				<td>
					Immagine tipo -- da sistemare
				</td>
				<td>
					<a href=<%= linkTipo %>> <%= t.getDenominazione() %> </a></b>
				</td>
			</tr>
<% }
%>
			<tr>
				<td colspan="2">
					<h3 class="smallheaderstyle">Contatti</h3>
				</td>
			</tr>
			<tr>
				<td>
					<ul class="uliststyle">
						<li>Indirizzo: Strada le Grazie, 15 - 37134 Verona</li>
						<li>Telefono: 045 8027071 - 045 8027802 </li>
						<li>Email: <a href="mailto:info@palestradelta.it">info@palestradelta.it</a></li>
					<ul>
				</td>
			</tr>
			<tr>
				<td>
					<h3 class="smallheaderstyle"><a class="linkstyle" href="main?ps=login">Accesso utenti registrati</a></h3>
				</td>
			</tr>
	</table>
   </body>
</html>
