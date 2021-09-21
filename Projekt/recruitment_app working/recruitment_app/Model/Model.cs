using System;
using System.Collections.Generic;
using System.Text;

namespace recruitment_app.Model
{

    using DAL.Entities;
    using DAL.Repo;
    using System.Collections.ObjectModel;
    using System.Windows;

    class Model
    {
        public ObservableCollection<JobOffer> JobOffersCollection { get; set; } = new ObservableCollection<JobOffer>();
        public ObservableCollection<PersonalData> PersonalDataCollection { get; set; } = new ObservableCollection<PersonalData>();
        private const int currentPersonId = 1;
        public Model()
        {
            var job_offers = JobOffersRepo.GetAllJobOffers();
            foreach (var job_offer in job_offers)
                JobOffersCollection.Add(job_offer);

            var all_personal_data = PersonalDataRepo.GetOnePersonData(currentPersonId); //Jako parametr podajemy ID osoby której dane chcemy "wyciągnąć" z bazy
            foreach (var personal_data in all_personal_data)
                PersonalDataCollection.Add(personal_data);
        }

        public bool IsJobOfferInDatabase(JobOffer jobOffer) => JobOffersCollection.Contains(jobOffer);

        public bool AddJobOfferToDatabase(JobOffer jobOffer)
        {
            if (!IsJobOfferInDatabase(jobOffer))
            {
                JobOffersRepo.AddJobOfferToDatabase(jobOffer);//Dodajemy ofertę do Bazy danych
                JobOffersCollection.Add(jobOffer); //Dodajemy ofertę do listy wyświetlanej w JobOffersTab
                return true;
            }
            return false;
        }

        public bool EditPersonalData(PersonalData personalData)
        {
            try
            {
                PersonalDataRepo.EditPersonalDataInDatabase(personalData, currentPersonId);
                PersonalDataCollection[0] = personalData;
                return true;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
                return false;
            }

        }
    }
}
