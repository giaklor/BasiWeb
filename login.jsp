<html>
   <head>
		<link rel="stylesheet" type="text/css" href="style.css"/>
		<title>Accesso utente</title>
		
		<script type="text/javascript">
			function validateForm() {
				var username = document.forms["subscriberData"]["username"].value;
				if (username == null || username == "") {
					alert("Inserire il nome utente");
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
			<table>
				<tr>
					<td>Nome utente</td>
					<td><input type="text" name="username"><br></td>
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
