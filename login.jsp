<html>
   <head>
		<link rel="stylesheet" type="text/css" href="style.css"/>
		<title>Accesso utente</title>
		
		<script type="text/javascript">
			function validateForm() {
				var mail = document.forms["subscriberData"]["email"].value;
				if (mail == null || mail == "") {
					alert("Inserire l'indirizzo email");
					return false;
				}
				var at = mail.indexOf("@");
				var dot = mail.lastIndexOf(".");
				if (at == -1 || dot < at || dot == at + 1 || dot == mail.length - 1) {
					alert("Indirizzo email non valido");
					return false;
				}
				return true;
			}
		</script>
   </head>
   <body>
		<br>
		<h3 class="smallheaderstyle">Accesso utente</h3>
		
<%
		if (request.getAttribute("failed") != null) {
%>
		
		<p class="textstyle">Impossibile accedere: dati non corretti.</p><br>
		
<%
		}
%>
		<form 
			name="subscriberData" 
			action="main" 
			onsubmit="return validateForm()"
			method="post">
			<table class="tablestyle">
				<tr>
					<td>Email</td>
					<td><input type="text" name="email"><br></td>
				</tr>
				<tr>
					<td>Password</td>
					<td>
						<input type="password" name="pwd">
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="Accedi"/>
			<input type="reset" value="Annulla"/>
		</form>
   </body>
</html>