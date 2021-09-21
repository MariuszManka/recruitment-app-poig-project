using System;
using System.Collections.Generic;
using System.Text;

namespace recruitment_app.ViewModel
{
    using Model;
    using DAL.Entities;
    using BaseClass;
    using System.Collections.ObjectModel;

    class JobOffersTab : ViewModelBase
    {
        private Model model = null;
        private ObservableCollection<JobOffer> jobOffersCollection = null;
       

        #region Constructors
        public JobOffersTab(Model model)
        {
            this.model = model;
            jobOffersCollection = model.JobOffersCollection;
        }
        #endregion

        public ObservableCollection<JobOffer> JobOffers
        {
            get { return jobOffersCollection; }
            set
            {
                jobOffersCollection = value;
                onPropertyChanged(nameof(JobOffers));
            }
        }
    }
}
