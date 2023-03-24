<form method="POST" action="auth.php">
    <label for="username">Nom d'utilisateur :</label>
    <input type="text" name="username" id="username"><br>
    
    <label for="password">Mot de passe :</label>
    <input type="password" name="password" id="password"><br>
    
    <label for="userType">Type d'utilisateur :</label>
    <select name="userType" id="userType">
        <option value="moderator">Annonceur</option>
        <option value="client">Client</option>
    </select><br>
    
    <input type="submit" value="Connexion">
</form>