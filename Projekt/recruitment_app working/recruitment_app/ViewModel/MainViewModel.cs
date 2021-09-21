using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;
using recruitment_app.View;

namespace recruitment_app.ViewModel
{

    using BaseClass;
    using recruitment_app.Model;
    using DAL;
    using System.Collections.ObjectModel;
    class MainViewModel
    {
        private Model model = new Model();

        public JobOffersTab JobOffersTabInstance { get; set; }
        public AddJobOfferTab AddJobOfferTabInstance { get; set; }
        public PersonalDataTab PersonalDataTabInstance { get; set; } 

        public MainViewModel()
            {
            //stworzenie viemodeli pomocniczych - dla każdej karty
            //przekazanie referencji do instancji modelu tak
            //aby wszystkie obiekty modeli widoków pracowały na tym samym modelu

                JobOffersTabInstance = new JobOffersTab(model);
                AddJobOfferTabInstance = new AddJobOfferTab(model);
                PersonalDataTabInstance = new PersonalDataTab(model);
            }
        }
}
