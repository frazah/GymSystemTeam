package it.unical.ingsw.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileUtils;

import it.mat.unical.ingsw.model.Atleta;
import it.mat.unical.ingsw.model.Corso;
import it.mat.unical.ingsw.model.Tessera;
import it.mat.unical.ingsw.model.Trainer;
import it.mat.unical.ingsw.model.Utente;
import it.mat.unical.persistence.DBManager;

@WebServlet("/EliminaCorso")
public class EliminaCorso extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Corso> corsi = DBManager.getInstance().getCorsi();
		List<Trainer> trainer = DBManager.getInstance().getTrainer();
		Trainer trainerAssegnato;
		List<Atleta> iscritti = DBManager.getInstance().getRegistrati();
		
		Corso corsoDaEliminare = null;
	
		request.getSession().setAttribute("corsi", corsi);
		request.getSession().setAttribute("trainer", trainer);
		
		String nomeCorso = request.getParameter("nome");
		
		//System.out.println(nomeCorso);
		
		
		
		for (int i = 0; i < corsi.size(); i++) { 
			if (nomeCorso.contentEquals(corsi.get(i).getNome())) {
			
				for (int j = 0; j < trainer.size(); j++)
				
					if (trainer.get(j).getCorso() != null && trainer.get(j).getCorso().getNome().equals(nomeCorso))
					{
						corsoDaEliminare = trainer.get(j).getCorso();
						trainer.get(j).setCorso(null);
						DBManager.getInstance().aggiornaTrainer(trainer.get(j));
						
					}

				corsoDaEliminare = corsi.get(i);
				eliminaCorsoDaTessere(corsoDaEliminare);
				DBManager.getInstance().getCorsoDAO().delete(corsoDaEliminare);
			}
		}
		
		
		
			

			
			
		
		
		
		
		
		/*for(Atleta a : iscritti)
		{
			if(a.getTessera()!=null && corsoDaEliminare != null)
			{
				a.getTessera().getCorsi().remove(corsoDaEliminare);
			}
		}*/
		
		
		
		
		Utente utente = DBManager.getInstance().login("admin@admin.com", "admin");
		
		response.sendRedirect("GestioneCorsiAdmin");

	}
	
	public void eliminaCorsoDaTessere (Corso corsoDaEliminare)
	{
		
		List<Tessera> tessere = DBManager.getInstance().getTessere();
		
		if (corsoDaEliminare != null)
			for (int i= 0; i< tessere.size(); i++)
			{
				if(tessere.get(i).getCorsi() != null)
					for (int j = 0; j<  tessere.get(i).getCorsi().size(); j++) 
						if(tessere.get(i).getCorsi().get(j).getNome().equals(corsoDaEliminare.getNome()))
						{
							tessere.get(i).getCorsi().remove(j);
							DBManager.getInstance().aggiornaTessera(tessere.get(i));
						}
			}
	}

}
