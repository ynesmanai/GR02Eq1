import React from 'react';
import './style.css'; // Votre fichier CSS

// 1. Composant pour une ligne avec la case à cocher (utilise .css-objet)
function CaseCocher() {
  return (
    <div className="css-objet">
      <input type="checkbox" id="case1" />
      <label htmlFor="case1">Cocher la bonne réponse</label>
    </div>
  );
}

// 2. Composant principal qui affiche le message dynamique et la liste de cases (utilise .css-liste)
function Conditional() {
  const heure = new Date().getHours();
  let message = "";

  if (heure >= 6 && heure < 12) {
    message = 'Bonjour';
  } else if (heure >= 12 && heure < 18) {
    message = 'Bonne Après midi';
  } else {
    message = 'Bonne nuit';
  }

  const styleObject = {
    fontSize: 50 // Réduit un peu pour que ça rentre bien dans la boîte
  };

  if (message === 'Bonjour') {
    styleObject.color = '#04567F';
  } else if (message === 'Bonne Après midi') {
    styleObject.color = '#0914A3';
  } else if (message === 'Bonne nuit') {
    styleObject.color = '#D90000';
  }

  return (
    <div>
      <h1 style={{ textAlign: 'center' }}><span style={styleObject}>{message}</span></h1>
      
      {/* Le conteneur principal avec l'effet d'ombre défini dans votre CSS */}
      <div className="css-liste">
        <CaseCocher />
        <CaseCocher />
        <CaseCocher />
        <CaseCocher />
      </div>
    </div>
  );
}

export default Conditional;