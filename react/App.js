import React, { Component } from 'react';
import './style.css'; // Votre fichier CSS

// 1. Composant pour une ligne avec la case à cocher (composant fonctionnel)
function CaseCocher({ id, label }) {
  return (
    <div className="css-objet">
      <input type="checkbox" id={id} />
      <label htmlFor={id}>{label}</label>
    </div>
  );
}

// 2. Composant de l'application conditionnelle
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
    fontSize: 50
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
      
      <div className="css-liste">
        <CaseCocher id="case1" label="Cocher la bonne réponse 1" />
        <CaseCocher id="case2" label="Cocher la bonne réponse 2" />
        <CaseCocher id="case3" label="Cocher la bonne réponse 3" />
        <CaseCocher id="case4" label="Cocher la bonne réponse 4" />
      </div>
    </div>
  );
}

// 3. Composant sous forme de Classe pour la carte de contact (Exercice Chatons)
class ContactCard extends Component {
  render() {
    const { img, name, phone, email } = this.props;
    
    return (
      <div className="contact-card">
        <img src={img} alt={name} />
        <h3>{name}</h3>
        <p>Phone: {phone}</p>
        <p>Email: {email}</p>
      </div>
    );
  }
}

// 4. Composant principal App (sous forme de Classe)
class App extends Component {
  render() {
    return (
      <div>
        {/* Affichage de l'activité 1 & 2 (Conditional) */}
        <Conditional />

        <hr style={{ margin: '40px 0' }} />

        {/* Affichage de l'activité 3 (Cartes de contacts) */}
        <h2 style={{ textAlign: 'center' }}>Liste des Contacts</h2>
        <div className="contacts">
          <ContactCard 
            img="https://picsum.photos/id/237/300/200"
            name="Mr. Whiskerson"
            phone="(212) 555-1234"
            email="mr.whiskaz@catnap.meow"
          />
          
          <ContactCard 
            img="https://picsum.photos/id/1025/400/200"
            name="Fluffykins"
            phone="(212) 555-2345"
            email="fluff@me.com"
          />
          
          <ContactCard 
            img="https://picsum.photos/400/300?random=3"
            name="Destroyer"
            phone="(212) 555-3456"
            email="ofworlds@yahoo.com"
          />
          
          <ContactCard 
            img="https://picsum.photos/id/40/200/100"
            name="Felix"
            phone="(212) 555-4567"
            email="thecat@hotmail.com"
          />
        </div>
      </div>
    );
  }
}

// Exportation du composant principal App
export default App;